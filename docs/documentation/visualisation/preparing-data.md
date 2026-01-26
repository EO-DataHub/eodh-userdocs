# Preparing data for visualisation

Learn recommended data formats (COG, Kerchunk, Zarr) for efficient visualisation in EO DataHub.

__Formats Supported__:

* Cloud Optimised GeoTIFF (COG): ideal for imagery data.
* NetCDF and Zarr: for multi-dimensional datasets.
* Kerchunk references: Optimises large NetCDF or HDF5 files.

__Recommendations__:

* Convert GeoTIFF to COG for faster access.
* Use Zarr or Kerchunk for NetCDF files to improve performance.

If you plan to use TiTiler to visualise outputs created by the Workflow Runner, it's important to prepare your data in a format that ensures efficient access and display.

Here we discuss two common considerations: __COG vs GeoTIFF__ for imagery and __Kerchunk vs NetCDF__ for multi-dimensional data.

## Cloud Optimised GeoTIFF (COG) vs standard GeoTIFF

A GeoTIFF is a georeferenced raster image format. A COG is a regular GeoTIFF that has been internally organised for efficient cloud-based access. COGs are __tiled__ and have built-in __overviews__ - this means that when TiTiler requests a portion of the image, a COG allows the server to fetch just the relevant tiles instead of the whole file.

A traditional GeoTIFF is not optimised for cloud access might require reading a large chunk of the file even for a small area or zoom level. When attempting to view a GeoTIFF using TiTiler, you may notice TiTiler responses taking considerably longer compared to COGs.

To check if your TIFF is a GeoTIFF or COG, you can use this Python function to locally load the file and check: [Python Script to check if a TIFF is a COG](https://gist.github.com/james-hinton/88876c7e8709e788546a4e0ca03e4eb7#file-check_cog_geotiff-py)

!!! tip
    if you plan to visualise large raster data on DataHub, converting it to a COG is highly recommended.
    
    Many GIS tools can convert GeoTIFFs to COG (by re-saving with internal tiling and overviews).

## Kerchunk vs NetCDF (and other data formats)

If your data is multi-dimensional (for example, time series or 3D variables) often stored in formats like NetCDF, you should consider how to optimise it for cloud access. TiTiler's XArray extension can read NetCDF or Zarr datasets directly, but reading a raw NetCDF over HTTP can be slow, especially if the file is large and not internally tiled.

Kerchunk is a technique that creates an external reference file (JSON) describing the byte ranges of data inside a NetCDF – treating it like a virtual Zarr store. Using a kerchunk-generated reference, TiTiler (via XArray) can access just the needed chunks of data from cloud storage without loading the entire file. This approach is useful for huge climate or model datasets.

## Summary – preparing your data

* Use **COGs for imagery** (each band or product as a separate COG file, or as assets in a STAC catalog) whenever possible for raster data.
* For **multi-band or multi-variable datasets** (like scientific data cubes), consider using **Zarr or Kerchunk references** so that TiTiler can read them chunk-wise.
* Ensure your data is in a **supported projection** (commonly Web Mercator EPSG:3857 or WGS84 EPSG:4326) or be aware that TiTiler will reproject on the fly for tiling.
* Also verify the data has proper georeferencing (coordinate reference system and bounds), as TiTiler relies on this info to position tiles correctly.
