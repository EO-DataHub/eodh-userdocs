# Serving data with TiTiler


## TiTiler Extensions in DataHub:

* Core: Directly visualise individual raster files (COGs).
* STAC: Use STAC items directly for quick asset visualisation.
* XArray: Supports multi-dimensional NetCDF and Zarr datasets.


## Using TiTiler for Visualisation:

* Serve Public Data hosted on the Platform
* Serve Public Data hosted on third-party websites
* Serve Private Data including Workflow outputs and Commercially ordered data

Depending on where your data resides and who should access it, there are slight differences in how you use TiTiler.

## Public Data

Public being that the data is openly accessible via a URL without special credentials (for example, a COG on a public AWS S3 bucket or an open HTTP link). To visualise public data, you can directly use TiTiler’s endpoints with the data’s URL. For instance, if you have a COG available at https://some-domain.com/mydata.tif, you can use the DataHub TiTiler endpoint to request tiles or a preview by providing this URL (via a url= query parameter). No authentication is required in this case, and anyone with access to the DataHub platform can potentially visualise that data.

### Example 1: A Preview of a Public Sentinel 2 ARD COG from the CEDA Archive

`https://eodatahub.org.uk/titiler/core/cog/preview?url=https://dap.ceda.ac.uk/neodc/sentinel_ard/data/sentinel_2/2023/11/21/S2B_20231121_latn536lonw0052_T30UUE_ORB123_20231121122846_utm30n_TM65_vmsk_sharp_rad_srefdem_stdsref.tif&bidx=1&rescale=0%2C255&colormap_name=bone`

![](../../assets/doc_vis_srv1.png)

### Example 2: An XYZ Tile Request of EOCIS Sea-Surface Temperature

`https://eodatahub.org.uk/titiler/xarray/tiles/3/6/4?url=https://eocis.org/data/sst-cdrv3-kerchunk/2024/03/20240331120000-ESACCI-L4_GHRSST-SSTdepth-OSTIA-GLOB_ICDR3.0-v02.0-fv01.0-kerchunk.json&variable=analysed_sst&tileMatrixSetId=WebMercatorQuad&scale=1&multiscale=false&reference=true&decode_times=true&consolidated=false&rescale=271%2C305&colormap_name=twilight&return_mask=true`

![](../../assets/doc_vis_srv2.png)

## Private Data

Private data refers to files that are not publicly accessible – for example, data in your EO DataHub workspace object or block store. DataHub allows you to visualise these too, but you need to authenticate so that TiTiler can securely fetch the data on your behalf.

Typically, DataHub uses a workspace-scoped API Key. When you sign up to DataHub, you can retrieve an API key that represents your credentials inside the Workspace page (See nav bar at the top). To use TiTiler with private data, you will include this API key as a Bearer header in your requests. Providing this key proves to the system that you have permission to access the data in your workspace.

### Example 3: A Private ZARR stored in a user's workspace

```bash
curl 'https://eodatahub.org.uk/titiler/xarray/tiles/WebMercatorQuad/5/15/10?url=https://workspaces-eodhp-staging.s3.eu-west-2.amazonaws.com/<YOUR-WORKSPACE>/xarray-zarr-directory/&variable=data&scale=1&multiscale=false&reference=false&decode_times=true&consolidated=false&rescale=0,255&return_mask=true&colormap_name=magma' \
  -H 'Authorization: Bearer <WORKSPACE API KEY>' \
  --output test.png
```

![](../../assets/doc_vis_srv3.jpg)