# TiTiler visualisation endpoints

This section describes the key TiTiler endpoints you’ll use to visualise data within the EO DataHub. If you’d like to explore them directly, [visit the Swagger docs](https://eodatahub.org.uk/api/docs/#/Visualization%20and%20Mapping%20-%20Available%20Tiling%20schemes%2C%20Algorithms%20and%20Colour%20maps).

## TiTiler Core (For COG and GeoTIFF)

### /info

Returns metadata about the raster, such as its bounds, coordinate reference system (CRS), number of bands, and data type.

`https://eodatahub.org.uk/titiler/core/cog/info?url=https://some-bucket.org/myfile.tif`

### /statistics

Provides statistics (min, max, mean, std) and histograms for each band. You can use this to determine rescale values for better visualisation.

`https://eodatahub.org.uk/titiler/core/cog/statistics?url=https://some-bucket.org/myfile.tif`

### /tiles/{z}/{x}/{y} (default WebMercatorQuad)

Fetches a 256×256 tile at zoom level z, tile coordinates x/y, in Web Mercator projection (EPSG:3857). This is the classic “XYZ” tile approach. You can change the projection using `/tiles/{tileMatrixSetId}/{z}/{x}/{y}` (e.g., WebMercatorQuad, WorldCRS84Quad)

`https://eodatahub.org.uk/titiler/core/cog/tiles/5/15/10?url=https://some-bucket.org/myfile.tif&bidx=1&rescale=0,255`

### /map

Returns an interactive HTML page that displays a web map for the specified dataset. You can see the bounding box, zoom in/out and adjust styling parameters.

```bash
https://eodatahub.org.uk/titiler/core/cog/map
    ?tile_scale=1
    &url=https%3A%2F%2Fdap.ceda.ac.uk%2F...
    &bidx=1
    &rescale=100%2C200
```

### /preview

Returns a small preview image of the entire dataset’s extent (e.g. 512×512). Good for quickly inspecting how the data looks.

`https://eodatahub.org.uk/titiler/core/cog/preview?url=https://some-bucket.org/myfile.tif&bidx=1&colormap_name=viridis`


## TiTiler XArray (Multi-dimensional)

### /xarray/info

Returns information about the dataset’s variables, dimensions, and attributes

### /xarray/tiles/{z}/{x}/{y}

Retrieves tiles in Web Mercator (EPSG:3857) by default. You can specify:

* &variable= to select a particular variable
* &multiscale= for multi-resolution data
* &decode_times= for time-indexed data

```bash
https://eodatahub.org.uk/titiler/xarray/tiles/5/15/10
    ?url=https://mybucket.org/path/to/dataset.zarr
    &variable=temperature
    &rescale=0,300
    &colormap_name=magma
```

## Preconfigured WMTS (for Mosaic Datasets)
For certain public datasets, the EO DataHub team provides a fully mosaiced WMTS layer. Rather than visualising individual scenes, you get a mosaic covering a region (e.g. an entire country) or time period.

### How We Set It Up

In a STAC Collection’s JSON, we add a "renders" section which tells TiTiler how to combine assets, choose bands, rescale them, and define tile levels. For example:

```json
{
  "renders": {
    "rgb": {
      "title": "RGB",
      "assets": ["cog"],
      "bidx": [1, 2, 3],
      "rescale": [
        [0, 100],
        [0, 100],
        [0, 100]
      ],
      "resampling": "nearest",
      "tilematrixsets": {
        "WebMercatorQuad": [0, 30]
      }
    }
  }
}
```

When this is configured, TiTiler recognises it can serve a mosaic of all relevant scenes for that date or dataset.

### Accessing the WMTS

#### GetCapabilities Document

Append `/wmts?request=GetCapabilities&service=WMTS` to the catalogue URL for the chosen dataset. For example:

```bash
https://eodatahub.org.uk/api/catalogue/stac/catalogs/supported-datasets/ceda-stac-catalogue/wmts
    ?request=GetCapabilities
    &service=WMTS
```

This returns the WMTS GetCapabilities XML, describing available layers.

### Add to GIS

In QGIS or another tool, add a WMTS layer by pointing to this URL. You can then select the layer (e.g. sentinel2_ard for a particular date), and the software will automatically fetch the mosaic tiles.

### Dataset Coverage
Different public datasets might have their own mosaic endpoints. Keep an eye on the EO DataHub documentation for a list of which catalogues and datasets are available in this manner.