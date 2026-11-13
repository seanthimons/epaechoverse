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

Generated paged wrappers return native feature records and use server transfer
flags, captured page limits, caller page size and a bounded page cap. Related
queries preserve groups. Nonpaging queries retain envelopes. The public
`arcgis_query_page()` helper retains the entire envelope for one native request,
including spatialReference and exceededTransferLimit, and accepts native spatial
filters and output reference systems. It does not infer a CRS or silently
convert ArcGIS geometry to sf/GeoJSON. Several EPA layers report WKID 102100 /
latestWKID 3857; the city demo reports 4326, and the monthly sample table has no
geometry. Use the response's reference system or request outSR explicitly.

`live-checks.json` records bounded zero-match queries and identify calls for all
35 emitted operations, plus a nonempty two-request Facilities paging check.
Zero-match queries establish that the operations accept requests, not that the
entire underlying datasets are correct or complete. Raw-response output-SR
checks verify a bounded Facilities request with outSR=4326 and matching native
reference metadata. No write/edit operations were exercised.
