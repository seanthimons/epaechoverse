# EPA ArcGIS capture and coverage

Captured November 13, 2026 from https://echogeo.epa.gov/arcgis/rest/services.
The native directory advertises ECHO, ECHOGov, monitor, Utilities and WQI.

The reviewed public scope is six MapServers, 21 leaf layers/tables and 35
operations: 21 layer queries, eight related-record queries and six identify
calls. All are read operations. The monitor checks and SampleWorldCities are
server diagnostics/demo content, not environmental observations.

`directory.json` records directory metadata, source URLs, SHA-256 hashes,
retrieval time, service capture paths and diagnostics. `services/*.json` are
specmill 0.3.1's reviewed, filtered service/layer captures. Their hashes identify
the original server responses, not the serialized filtered captures.
`layer-metadata.json` supplements the captures with native spatial references
and hashes of the corresponding complete layer responses. The importer itself
omits extent/reference-system fields. `service-names.csv` records reviewed
client prefixes. `inst/extdata/arcgis-layers.csv` is the installed layer index.

## Exclusions

- ECHOGov responds with HTTP 303 to EPA's SAML login. The capture utility follows
  the redirect and reports non-JSON content. No anonymous layer inventory was
  available; no protected layers were invented or generated.
- ECHO/getFacilities and Utilities/RasterUtilities are GPServer services.
- Utilities/Symbols is a SymbolServer service.

The released importer supports MapServer and FeatureServer captures, not
GPServer or SymbolServer operations. Supporting those services needs upstream
importer work or a separately specified client. These exclusions remain open.

## Reproduction

Use specmill **v0.3.1**, pinned in renv.lock. `dev/capture_arcgis.R` is the MIT
capture utility vendored unchanged except for its attribution header from
specmill commit 08ea19f54aba92aa02a6e9f0732642645b8e511d.

```r
source('dev/capture_arcgis.R')
capture_arcgis('https://echogeo.epa.gov/arcgis/rest/services',
               output = '/path/to/new-empty-capture', max_resources = 2000)
```

Review new captures and exclusions before replacing saved inputs. Keep all
advertised leaf layers and tables. After reviewing captures and service names,
`Rscript dev/configure_arcgis.R` creates absent API configs, schemas and
client-owned transports without replacing existing ones. Regenerate with
`Rscript dev/regenerate.R apply`, then run `check`. Edits to existing schemas or
transport policy require deliberate review rather than another initialization.

## Response and geometry contracts

Generated ArcGIS operations use the shared client-owned post-request hook with
`format = tidy | sf | geojson | raw`. A pre-hook validates the client format,
and the transport's ArcGIS response policy still raises API errors. Single
responses format immediately; paged requests retain their native envelopes
until the post-combine hook runs, so completion checks see unmodified server
flags and formatting retains metadata even for empty pages. The small collector
in each client-owned `_pages` helper is configured idempotently by
`dev/configure_arcgis_format.R`; it does not alter offset/limit/completion logic.

Tidy output preserves native attribute types and geometry, with service/layer
and related-record parent IDs. sf and GeoJSON transform from the reported source
CRS to EPSG:4326. GDAL's ESRIJSON driver handles point, multipoint, line and polygon
ring geometry, including holes. Missing geometries keep their records; unknown
source CRS and quantized or measured geometry cannot be silently converted. Metadata lives
in the `arcgis` attribute, or the GeoJSON `arcgis` member. Raw generated wrappers
retain their existing feature/group/envelope shape. `arcgis_query_page()` uses
the same formatter and returns a complete single-page native envelope when
`format = 'raw'`.

`live-checks.json` records bounded zero-match queries and identify calls for all
35 emitted operations, plus a nonempty two-request Facilities paging check.
Zero-match queries establish that the operations accept requests, not that the
entire underlying datasets are correct or complete. Raw-response output-SR
checks verify a bounded Facilities request with outSR=4326 and matching native
reference metadata. No write/edit operations were exercised.

`Rscript dev/verify_arcgis_format.R` checks bounded live tibble, sf and GeoJSON
output plus two-page sf output. It writes format-checks.json. Offline fixtures
cover null and empty geometries, missing CRS, typed attributes, polygon holes,
lines/multipoints, identify layers, related-record parent IDs and empty pages.
