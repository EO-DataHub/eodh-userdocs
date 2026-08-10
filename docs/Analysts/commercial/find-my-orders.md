# Finding my ordered imagery

## Order confirmation

If the purchase is successful, the Order Confirmation pop out should appear. The status of the commercial data request, as well as access to your purchased imagery, can now be viewed in your EODH user workspace by going to the **My Data** section within the catalogue.

Reach out to [enquiries@eodatahub.org.uk](mailto:enquiries@eodatahub.org.uk) if you experience issues with the delivery status of your order.

## View my ordered imagery

Once your order has been delivered, you can view the imagery directly on the map from the **Purchased Data** page within **My Data**.

1. Navigate to **Catalogue > My Data > Purchased Data**.
2. Locate the order you want to view in the list of purchased imagery.
3. Confirm that the **Order Status** shows **Delivered (data is available)**.
4. Select **View on map** in the **View** column.

This action pins the ordered scene to the map browser and displays the scene footprint on the map. You can then view a visualisation of the full scene, review its geographic coverage, and explore the associated imagery metadata from the pinned items panel.

### Visualising purchased imagery

After selecting **View on map**, the purchased imagery is displayed as an overlay within the map browser. The imagery can be interacted with in the same way as other catalogue items.

![Purchased imagery visualisation](images/purchased-imagery-visualisation.png)

From the **Pinned Items** panel, you can:

- Use the **visibility toggle** (eye icon) to switch the imagery layer on or off.
- Use the **opacity control** (droplet icon) to adjust the transparency of the imagery overlay.
- Zoom to the scene footprint using the zoom icon.
- Access additional sharing and information options where available.

Adjusting the layer opacity can be useful when comparing the purchased imagery against the underlying basemap or other data layers. This allows you to examine the scene in more detail while maintaining geographical context.

For more information about working with items in the map browser, including visibility controls, opacity settings, sharing, and item management, see:

> [📌 Managing pinned items](https://docs.eodatahub.org.uk/Explorers/resource-catalogue/search-and-browse/#managing-pinned-items)

## Download my ordered imagery

Once an order has been delivered, the imagery files can be downloaded directly from the item metadata.

1. Navigate to **Catalogue > My Data > Purchased Data**.
2. Select **View on map** against the delivered order.
3. From the **Pinned Items** panel, select the required scene.
4. Open the item metadata by selecting the **Information** icon.
5. In the **Assets** panel, locate the available imagery files and select the download option for the asset you wish to retrieve.

The **Assets** panel provides access to the imagery products associated with your order, including any available downloadable files and supporting resources.

For a detailed guide on downloading data assets from the catalogue, see:

> [⬇️ Download data](https://docs.eodatahub.org.uk/Explorers/resource-catalogue/download-data/)

## Use my ordered imagery

Purchased imagery is automatically stored within your workspace data storage after delivery. The ordered scenes are accessible through the workspace's S3-compatible storage, allowing them to be used across the EODH platform.

### Accessing purchased imagery in Jupyter Notebooks

Once you have launched a Jupyter Notebook server, you can browse your workspace's S3 file directory directly from the Jupyter interface.

Within your S3 storage, you should find a folder named **commercial-data**. This folder contains the imagery products that have been delivered as part of your commercial data orders.

1. Launch a Jupyter Notebook server from the EODH platform.
2. Open the file browser within the Jupyter interface.
3. Navigate to your workspace S3 storage.
4. Open the **commercial-data** folder.
5. Locate your purchased scenes and associated files.

From this directory, you can access imagery directly within your notebooks and begin analysing the data using your preferred Python geospatial libraries and workflows.

### Accessing purchased imagery in GIS applications

Purchased imagery stored within your workspace can also be accessed through supported EODH GIS plugins.

Within the GIS plugin, open the **Workspaces** tab and browse to your workspace storage location. The **commercial-data** folder and its contents will be available alongside your other workspace resources.

1. Connect to your workspace using the EODH GIS plugin.
2. Open the **Workspaces** tab.
3. Navigate to the **commercial-data** folder within your workspace storage.
4. Browse the available purchased scenes.
5. Add the required imagery directly to your GIS project.

This enables you to visualise and analyse purchased imagery without needing to manually download and import files. The data can be loaded directly from workspace storage into your GIS environment, ensuring that purchased scenes remain accessible across your EODH workflows.
