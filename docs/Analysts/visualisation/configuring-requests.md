# Configuring TiTiler requests

## What is TiTiler

TiTiler allows for dynamic and customisable visualisation of geospatial data. By adjusting parameters in a URL, you can control how your data is displayed. This guide will walk you through the key parameters, explaining what they do and how to use them with examples from the DataHub, including how to create visualisations for use in third-party software like QGIS.

Requests are primarily made to OGC Tile endpoints in the format .../tiles/{z}/{x}/{y} where:

* {z} is the zoom level.
* {x} is the horizontal position of the tile.
* {y} is the vertical position of the tile.

The following parameters can be added to the query string (after the ?) to customise the output.

## Working with Different Data Types

The DataHub hosts different types of data, and the TiTiler endpoint you use depends on the data format:

* Cloud Optimised GeoTIFFs (COGs): For single-band or multi-band raster data in .tif format. These requests use the /core/cog/ endpoint. This is the most common endpoint for visualising individual image files.
* Multidimensional Data (NetCDF, Zarr, Kerchunk): For data with more than two dimensions (eg. time, depth). These requests use the /xarray/ endpoint.

!!! note
    While a /stac/ endpoint exists for interacting with STAC Items directly, for clear and direct visualisation, we recommend using the asset URL within the /cog/ or /xarray/ endpoints as shown in the examples below.)

## For Single-Band Data

Band/Variable Selection (bidx / variable):

* &bidx=... for COGs (e.g. &bidx=1 for the first band).
* &variable=... for xarray data (e.g. &variable=analysed_sst).

Rescaling (rescale):

* &rescale=MIN,MAX improves contrast by mapping the data's raw values (e.g. temperature) to the full colour range.

Colourmap (colormap_name):

* &colormap_name=... applies a colour palette (e.g inferno). This is ideal for single-band data.

## Example: ESA Sea Surface Temperature (SST)

This URL visualises the analysed_sst variable, rescales the data to a specific temperature range (271K to 305K), and applies the inferno colourmap.

[https://eodatahub.org.uk/titiler/xarray/tiles/{z}/{x}/{y}?url=https://eocis.org/data/sst-cdrv3-climatology/kerchunk/D321-ESACCI-L4_GHRSST-SSTdepth-Climatology-GLOB_CDR3.0-v02.0-fv01.0-kerchunk.json&variable=analysed_sst&rescale=271,305&colormap_name=inferno](https://eodatahub.org.uk/titiler/xarray/tiles/{z}/{x}/{y}?url=https://eocis.org/data/sst-cdrv3-climatology/kerchunk/D321-ESACCI-L4_GHRSST-SSTdepth-Climatology-GLOB_CDR3.0-v02.0-fv01.0-kerchunk.json&variable=analysed_sst&rescale=271,305&colormap_name=inferno)

## For Multi-Band Colour Composites (eg True Colour Images)

Software like QGIS often requires multiple bands to render a colour image. While colormap_name is great for single bands, it is not suitable for creating true-colour (RGB) composites. For this, you must use bidx to select multiple bands and color_formula to style them.

Options:

* Band Selection (bidx):
    * Select the bands you want to map to Red, Green, and Blue. For Sentinel-2, the true-colour bands are Red (B4), Green (B3), and Blue (B2). You must specify them in order: &bidx=4&bidx=3&bidx=2.
* Colour Formula (color_formula):
    * This is a powerful parameter that applies colour correction algorithms to enhance the image. A good general-purpose formula is Gamma RGB [value] Saturation [value] Sigmoidal RGB [contrast] [brightness].
    * The formula helps to brighten the image and increase contrast, which is often necessary for raw satellite data.

### Example: True Colour Sentinel-2 Image for QGIS

This URL creates a visually enhanced, true-colour composite from a Sentinel-2 scene. It selects the Red, Green, and Blue bands and applies a gamma, saturation, and sigmoidal contrast stretch. This type of URL is robust for use in QGIS as an "XYZ Tile" layer. (Note: %20 is the URL-encoded version of a space character.)

[https://eodatahub.org.uk/titiler/core/cog/tiles/WebMercatorQuad/{z}/{x}/{y}?url=https://dap.ceda.ac.uk/neodc/sentinel_ard/data/sentinel_2/2023/11/21/S2B_20231121_latn536lonw0052_T30UUE_ORB123_20231121122846_utm30n_TM65_vmsk_sharp_rad_srefdem_stdsref.tif&bidx=4&bidx=3&bidx=2&color_formula=Gamma%20RGB%203.5%20Saturation%201.5%20Sigmoidal%20RGB%2015%200.55](https://eodatahub.org.uk/titiler/core/cog/tiles/WebMercatorQuad/{z}/{x}/{y}?url=https://dap.ceda.ac.uk/neodc/sentinel_ard/data/sentinel_2/2023/11/21/S2B_20231121_latn536lonw0052_T30UUE_ORB123_20231121122846_utm30n_TM65_vmsk_sharp_rad_srefdem_stdsref.tif&bidx=4&bidx=3&bidx=2&color_formula=Gamma%20RGB%203.5%20Saturation%201.5%20Sigmoidal%20RGB%2015%200.55)


## Using TiTiler with QGIS: WMTS Capabilities

For more integration with desktop GIS, you can provide a WMTS Capabilities XML document. This allows QGIS to understand the layer, its projection and available parameters.

You can construct a WMTS URL by taking a tile URL and changing the path to /WebMercatorQuad/WMTSCapabilities.xml. This URL will generate an XML file that you can load directly into QGIS as a WMTS layer. It contains the same multi-band selection and colour formula as the tile example above

### Example: WMTS for a True Colour Sentinel-2 Image

[https://eodatahub.org.uk/titiler/core/cog/WebMercatorQuad/WMTSCapabilities.xml?url=https://dap.ceda.ac.uk/neodc/sentinel_ard/data/sentinel_2/2023/11/21/S2B_20231121_latn536lonw0052_T30UUE_ORB123_20231121122846_utm30n_TM65_vmsk_sharp_rad_srefdem_stdsref.tif&bidx=4&bidx=3&bidx=2&color_formula=Gamma%20RGB%203.5%20Saturation%201.5%20Sigmoidal%20RGB%2015%200.55](https://eodatahub.org.uk/titiler/core/cog/WebMercatorQuad/WMTSCapabilities.xml?url=https://dap.ceda.ac.uk/neodc/sentinel_ard/data/sentinel_2/2023/11/21/S2B_20231121_latn536lonw0052_T30UUE_ORB123_20231121122846_utm30n_TM65_vmsk_sharp_rad_srefdem_stdsref.tif&bidx=4&bidx=3&bidx=2&color_formula=Gamma%20RGB%203.5%20Saturation%201.5%20Sigmoidal%20RGB%2015%200.55)