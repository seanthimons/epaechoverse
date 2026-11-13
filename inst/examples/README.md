# Chemical occurrence examples

These scripts look up measured concentrations and detections for chemicals you
choose. They combine three sources:

| Medium | Source | Needs |
|---|---|---|
| Drinking water | SDWIS (via echoverse) and EPA Six-Year Review 4 compliance data | nothing |
| Ambient air | EPA AQS Data API (via [aqsually](https://github.com/seanthimons/aqsually)) | aqsually, AQS e-mail and key |
| Both | CompTox Monitoring Media Database (via ComptoxR) | CompTox API key |

Work through the steps in order. Run every command in the R console (or
RStudio's Console pane), not in the shell.

## 1. Install echoverse (once)

```r
install.packages("pak")
pak::pkg_install("seanthimons/epaechoverse")
```

If R asks whether to install into a personal library, answer yes.

## 2. Add your credentials (once)

You need three values: a CompTox API key (email ccte_api@epa.gov to request
one), and an e-mail address plus key registered with the EPA AQS Data API.

This folder contains a template, `Renviron.example`. Show where it is:

```r
system.file("examples", "Renviron.example", package = "echoverse")
```

Then open your personal settings file:

```r
file.edit("~/.Renviron")
```

Copy the three lines from the template into it, replace the placeholders with
your values, and save. **Restart R afterwards**; R reads this file only at
startup. Check that the values are visible:

```r
nzchar(Sys.getenv(c("ctx_api_key", "AQS_EMAIL", "AQS_KEY")))
# All three should print TRUE
```

If you already have a `~/.Renviron`, add the three lines to it and keep the
rest. Never share the file or put the values in a script.

Ambient-air data **requires** aqsually and the AQS e-mail and key; the full run
(step 5) installs aqsually if it is missing. Only the discovery run (step 4)
skips them: it needs just `ctx_api_key`, because it retrieves no air samples.

## 3. Load the script

```r
source(system.file("examples", "occurrence_chemicals.R", package = "echoverse"))
```

This only defines functions. It makes no requests. Use `source()` for every
script in this folder; running one with `Rscript file.R` fails with
"Load this example with source()".

## 4. Discovery run (start here)

This resolves each chemical to its identifiers and checks which sources cover
it. It downloads no samples.

```r
results <- run_occurrence(
  chemical_queries = c("atrazine", "117-81-7"),   # names or CASRNs
  aqs_scope = data.frame(state = "26", year = 2002),  # two-digit state FIPS, four-digit year
  mapping_only = TRUE
)
results$source_coverage
```

The first call installs any missing packages (`ComptoxR` and a few CRAN
packages) and can look idle for several minutes. That is normal.

## 5. Full run

Repeat step 4 with `mapping_only = FALSE`.

```r
results <- run_occurrence(
  chemical_queries = c("atrazine", "117-81-7"),
  aqs_scope = data.frame(state = "26", year = 2002),
  mapping_only = FALSE,
  output_dir = "occurrence-output"   # optional: also saves CSV and RDS files
)
```

Before you run it:

- It installs `aqsually` if missing. This is the package that retrieves the air data.
- AQS requests are paced at one every 6 seconds, so many chemicals, states or
  years make a long run. Keep the scope small the first time.
- Six-Year Review 4 data are large ZIP downloads (about 95 MB and 81 MB) and are
  cached for later runs in the `occurrence` folder under `tools::R_user_dir("echoverse", "cache")`.
- SDWIS violation records are off by default. Add `run_sdwis = TRUE` to include
  them; they are violation measures, not individual samples.

## Reading the results

`results` is a list of tables. Start with these:

| Name | Contents |
|---|---|
| `source_coverage` | which sources have each chemical (check this first) |
| `syr4_summary` | finished-water detection rates, 2012-2019 |
| `syr4_concentrations` | detected-value quantiles, separated by unit |
| `air_samples` | ambient-air samples with qualifiers and detection limits |
| `mmdb_water_air` | CompTox drinking-water and air records (may be empty) |
| `mapping_status` | which lookup steps resolved, found no match, or failed |

An empty table means no records were found in the scope you asked for. It is
not proof that the concentration is zero.

## Other files in this folder

- `occurrence_atrazine_dehp.R` runs a ready-made example (atrazine and DEHP,
  Michigan, 2002). **Sourcing it starts a full run** with the downloads above,
  so use steps 4 and 5 first.
- `occurrence_chemicals.csv` and `occurrence_aqs_scope.csv` are sample inputs.
  Pass them in as `read_chemicals(path)$casrn` and `read_aqs_scope(path)`. Build
  `path` with `system.file("examples", "occurrence_chemicals.csv", package = "echoverse")`.
- `occurrence_mapping.R`, `occurrence_aqs.R` and `occurrence_sdwis.R` are helpers
  that `occurrence_chemicals.R` loads. You do not run them directly.

To edit a script, copy the whole folder somewhere you can write to:

```r
file.copy(system.file("examples", package = "echoverse"), ".", recursive = TRUE)
```

## If something fails

Failures in a single lookup do not stop the run. The script prints a line like
`[label] failed` (sometimes `[label] failed: HTTP 503`) and carries on, so read
the label in the brackets:

| Message starts with | What to do |
|---|---|
| `[identity ...]`, `[synonyms ...]` or `[MMDB ...]` failed | CompTox lookup. Check `ctx_api_key` (step 2, then restart R). `HTTP 503` means the service is down; try again later. |
| `[aqs <chemical> <state> <year>]` failed | One AQS request. Check `AQS_EMAIL` and `AQS_KEY` (step 2, then restart R), and that the `AQSUALLY_DRY_RUN` environment variable is not set. |
| `[aqs]` failed, with no chemical, state or year | No AQS parameter matched your chemicals, or the `[AQS parameter catalog]` download failed (see that row), so nothing was requested. This is not a credentials problem. Check `results$source_coverage`. |
| `[AQS parameter catalog]`, `[SDWIS catalog ...]`, `[SYR4 ...]`, `[syr4]` or `[sdwis ...]` failed | An EPA download or catalog could not be fetched (`[sdwis ...]` appears only with `run_sdwis = TRUE`). Try again later. |
| `[SDWIS identity verification ...]` failed | A possible SDWIS match was rejected, usually because it turned out to be a different chemical. This is normal; no action needed. If the message ends with an HTTP status such as `HTTP 503`, the CompTox service was down and a real match may have been dropped; try again later. |
| `[mmdb]` failed | No chemical resolved to a CompTox ID, so the MMDB step was skipped. Fix the `[identity ...]` failure first. |
| `Load this example with source()` | Use `source(...)`, not `Rscript`. |
| `system.file(...)` returns `""` | echoverse is not installed; redo step 1. |

Failed identifier, synonym, SDWIS catalog, SDWIS identity verification and SYR4
inventory lookups also show as `unresolved` in `results$mapping_status`. AQS,
MMDB and sample-download failures appear only in the printed messages, so scroll back through them
before trusting an empty table.
