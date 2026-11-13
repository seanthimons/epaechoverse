# Existing ECHO mapping checks, November 13, 2026

`mapping-verification.json` is a bounded live snapshot. Re-run with
`python3 dev/verify_mapping.py`. The standard-library script makes read-only
GET/form POST requests, uses fresh per-service query IDs, limits concurrency to
three and applies 25-second request timeouts. It stores counts and hashes of
sorted records, not ephemeral query IDs. It is independent of generated-client
unit tests, which check the transport and response adapters offline.

- Rhode Island CWA major-facility maps returned 25 records for QID-only,
  bounding-box and tablelist variants. GET/POST sorted map records matched.
- Rhode Island AMS maps returned seven records without a bounding box. Both
  c1/c2 and xmin/ymin/xmax/ymax requests in this sample returned zero records.
  GET/POST agreed, but this does not establish reliable bounding-box semantics.
- Case maps returned 237 records without mapset, one with mapset=1 and five with
  mapset=10. Clustering and server selection remain relevant; these are not
  complete facility extracts. GET/POST sorted records matched.
- DFR and CAA report maps each returned four facilities, including neighbors.
  GET/POST agreed. Their spatial metadata retained coordinate source and
  accuracy fields unchanged.
- AMS/AQS report calls returned station maps for the sample site. AQS was checked
  with p_map_facs=N. GET/POST agreed.
- An unknown QID returned an empty map, without an explicit API error. Empty
  map results therefore cannot prove that a cached query is still valid. These
  checks do not establish a QID expiration lifetime.

The existing offline coordinate tests check numeric conversion, missing/invalid
coordinates, retention of records and diagnostic values, and optional spatial
formats. Latitude83/Longitude83 remains provenance text. No CRS is inferred from
those names. A separate ArcGIS Facilities lookup with outSR=4326 for registry
110000381989 returned (-82.66827, 39.73456), matching the sampled report
provenance. That is evidence for one record, not independent confirmation of
every report map's source datum. Existing ECHO map output uses the documented
search-schema WGS84 convention; broader report-datum verification stays open.

No additional shared ECHO helper was introduced: service differences and these
remaining uncertainties do not justify hiding them. ArcGIS has its own narrow
single-page raw-envelope helper and retains native spatial-reference metadata.
