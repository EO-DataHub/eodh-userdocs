# Reading Landsat data with GDAL

<!--
DRAFT: hold this page back until the Landsat catalogue proxy is live, so that catalogue
asset links point at /api/data/objects. Before release, fill in the TODOs below.
-->

You can read Landsat Collection 2 files from the Hub with GDAL, and with tools built on GDAL such as rasterio and QGIS. GDAL reads only the parts of a file it needs, so a small window of a large image is fast and cheap.

Landsat files are stored by the USGS in Amazon S3. The Hub pays Amazon for each read and charges the cost to the workspace that you name. <!-- TODO: link to the pricing page, and give the price per GB. -->

## Before you start

You need:

- GDAL 3.12 or later, or a version of rasterio that includes it <!-- TODO: confirm the oldest GDAL version that accepts comma-separated headers. -->
- An API token for your workspace. See [Workspace credentials](../../Getting-Started/workspaces/workspace-credentials.md).
- The name of the workspace to charge.
- The link to a Landsat asset. In the Resource Catalogue, open a Landsat scene, select **Assets**, and copy the link of the asset. The link starts with `https://eodatahub.org.uk/api/data/objects/usgs-landsat/`.

## Read a file from the command line

1. Set your token and workspace:

    ```bash
    export TOKEN=<your API token>
    export WORKSPACE=<your workspace name>
    ```

2. Set the GDAL options:

    ```bash
    export GDAL_HTTP_HEADERS="Authorization: Bearer $TOKEN,X-EODH-Workspace: $WORKSPACE"
    export GDAL_DISABLE_READDIR_ON_OPEN=EMPTY_DIR
    ```

3. Open the file. Put `/vsicurl/` in front of the asset link:

    ```bash
    gdalinfo "/vsicurl/https://eodatahub.org.uk/api/data/objects/usgs-landsat/<path to the file>"
    ```

To copy a window of 256 × 256 pixels to a local file:

```bash
gdal_translate -srcwin 3000 3000 256 256 "/vsicurl/<asset link>" window.tif
```

## Read a file in Python

```python
import rasterio

url = "https://eodatahub.org.uk/api/data/objects/usgs-landsat/<path to the file>"

with rasterio.Env(
    GDAL_HTTP_HEADERS=f"Authorization: Bearer {token},X-EODH-Workspace: {workspace}",
    GDAL_DISABLE_READDIR_ON_OPEN="EMPTY_DIR",
):
    with rasterio.open(url) as src:
        window = src.read(1, window=((3000, 3256), (3000, 3256)))
```

## Why these two settings matter

### Use a comma between the headers

GDAL also accepts a line break between headers. A line break is easy to lose when you copy and paste a command. If it is lost, GDAL sends your workspace name as part of your token, and the Hub refuses the request with `HTTP response code: 401`.

If you get a `401` error, check that a comma separates the two headers.

### Stop GDAL from looking for extra files

When GDAL opens a file, it looks for related files beside it, such as `.aux.xml` and `.ovr` files. Landsat Collection 2 has none of these files. Without `GDAL_DISABLE_READDIR_ON_OPEN=EMPTY_DIR`, GDAL makes about 40 extra requests each time it opens a file, and each open takes several seconds longer.

## Errors

| Error | Cause |
|---|---|
| `401` | The token is missing or not valid, or the headers are not separated by a comma. |
| `403` | Your token does not give access to the workspace you named. |
| `404` | The file does not exist. Check the asset link. |
