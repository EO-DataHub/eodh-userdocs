# Reading Landsat data with GDAL

<!--
DRAFT: hold this page back until the Landsat catalogue proxy is live, so that catalogue
asset links point at /api/data/objects. Before release, fill in the TODOs below.
-->

You can read Landsat Collection 2 files from the Hub with GDAL, and with tools built on GDAL such as rasterio and QGIS.

## How access and billing work

The USGS stores Landsat files in an Amazon S3 bucket where the reader, not the USGS, pays for each download. You do not need an AWS account. The Hub reads the files for you:

1. You request a file from the Hub with your API token and the name of a workspace.
2. The Hub checks that the token gives access to that workspace.
3. The Hub sends you to a short-lived link for the file, and pays Amazon for the read.
4. The Hub charges the data that you read to that workspace.

Reading file data costs <!-- TODO: price --> per GB, charged to the workspace. <!-- TODO: link to the pricing page. --> Only file data that you read is charged. Browsing Landsat scenes in the catalogue, including their preview images, is free.

GDAL reads only the parts of a file it needs, so you pay for those parts, not for the whole file. For example, a window of 256 × 256 pixels from a 71 MB Landsat band reads about 0.5 MB.

## Before you start

You need:

- GDAL 3.12 or later, or a version of rasterio that includes it <!-- TODO: confirm the oldest GDAL version that accepts comma-separated headers. -->
- An API token for your workspace. See [Workspace credentials](../../Getting-Started/workspaces/workspace-credentials.md).
- The name of the workspace to charge. If your token gives access to only one workspace, the Hub uses that workspace, and you can leave out the `X-EODH-Workspace` header in the examples below.
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

This example reads the token and workspace from the `TOKEN` and `WORKSPACE` environment variables set in step 1 above.

```python
import os

import rasterio

token = os.environ["TOKEN"]
workspace = os.environ["WORKSPACE"]
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
| `400` | Your token gives access to more than one workspace, and you did not name one. Add the `X-EODH-Workspace` header. The Hub also returns `400` if the workspace name is not valid. |
| `401` | The token is missing or not valid, or the headers are not separated by a comma. |
| `403` | Your token does not give access to the workspace you named. |
| `404` | The file does not exist. Check the asset link. |
| `502` | The Hub could not get access to the file from Amazon. Try again later. |
| `503` | The Hub could not check your token. Try again later. |
