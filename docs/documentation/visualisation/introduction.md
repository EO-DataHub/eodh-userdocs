# Introducing data visualisation

## What is TiTiler

* TiTiler serves geospatial data as interactive web tiles.
* Supports Cloud Optimised GeoTIFFs (COGs), STAC items, Kerchunk, NetCDF and Zarr.
* Enables dynamic map rendering without downloading entire datasets.

!!! tip
    Useful Links

    [TiTiler Documentation](https://developmentseed.org/titiler/) | [EO DataHub TiTiler Swagger API](https://eodatahub.org.uk/api/docs/#/Visualization%20and%20Mapping%20-%20Available%20Tiling%20schemes%2C%20Algorithms%20and%20Colour%20maps)

Data visualisation in EO DataHub focuses on turning raw Earth Observation data into map tiles and imagery that can be easily viewed and analysed. TiTiler is the tool that we use to power this.

TiTiler is a dynamic tile server created by DevelopmentSeed built on FastAPI and Rasterio/GDAL, designed to support cloud-optimized geospatial data and serve it as web map tiles ([Building a Dynamic Tile Server Using Cloud Optimized GeoTIFF(COG) with TiTiler](https://dev.to/mierune/building-a-dynamic-tile-server-using-cloud-optimized-geotiffcog-with-titiler-alg#:~:text=TiTiler%20is%20a%20dynamic%20tile,deployment%20environments%20using%20AWS%20CDK)). In practice, this means you can take a large geospatial file (like a satellite image or a multi-band dataset) and TiTiler will handle just the portion needed for the current map view.

## Key Features of TiTiler

TiTiler supports Cloud Optimised GeoTIFFs (COGs), as well as STAC (SpatioTemporal Asset Catalog) items and even multi-dimensional data via Xarray. It can handle multiple projections (through OGC TileMatrixSets) and offers various output image formats (PNG, JPEG, GeoTIFF, etc.) ([TiTiler](https://developmentseed.org/titiler/#:~:text=,OGC%20WMTS%20support)). It also implements OGC WMTS standards for integration with GIS clients.

!!! note
    For more details on TiTiler’s design and capabilities, the EO DataHub instance of TiTiler has its API documented via Swagger at EO [DataHub TiTiler API](https://eodatahub.org.uk/api/docs/#/Visualization%20and%20Mapping%20-%20Available%20Tiling%20schemes%2C%20Algorithms%20and%20Colour%20maps) for those interested in the raw REST endpoints.