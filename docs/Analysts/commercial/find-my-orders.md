# Finding my ordered imagery

## Order confirmation

If the purchase is successful, the Order Confirmation page should appear. The status of the commercial data request, as well as access to your purchased imagery, can now be viewed in your EODH user workspace by going to the **My Data > Purchased Data** area, within the **Catalogue** tab.

See the **Order Status** column to review if a purchase was successful. If you experience issues with the delivery status of your order, contact us at [enquiries@eodatahub.org.uk](enquiries@eodatahub.org.uk). You can add failed orders to the table by selecting the **Include Failed Orders** checkbox.

<img width="99" height="22" alt="include-failed-orders" src="https://github.com/user-attachments/assets/bd59d7a3-9497-4a12-a386-cae9dcb65391" />

## View my ordered imagery

Once your order has been delivered, you can view the imagery directly within the map browser.

1. Navigate to **My Data > Purchased Data** within the **Catalogue** tab.
2. Locate the order you want to view in the table of purchased imagery.
3. Confirm that the **Order Status** shows **Delivered (data is available)**.
4. Select **View on map** in the **View** column.

<img width="960" height="400" alt="oc-vis" src="https://github.com/user-attachments/assets/316a96d1-babc-4c16-a2c7-35a657ea7982" />

This action loads a visualisation of the ordered scene to the map browser by adding it to the **Pinned Items** list. The scene footprint outline is also displayed. The imagery can be interacted with in the same way as other pinned items. You can:

- Use the **visibility toggle** (eye icon) to switch the imagery layer on or off.
- Use the **opacity control** (droplet icon) to adjust the transparency of the imagery overlay.

To review how to adjust visualisation settings for items within your **Pinned Items** list, including visibility controls, opacity settings, and item management, see:

> [📌 Managing pinned items](https://docs.eodatahub.org.uk/Explorers/resource-catalogue/search-and-browse/#managing-pinned-items)

## Download my ordered imagery

Once an order has been delivered, all of the assets and files associated with that scene can be downloaded directly from the item's metadata.

1. Select **View on map** against the delivered order to open it in the **Pinned Items** list.
2. Open the item metadata by selecting the **Information** icon.
3. In the **Assets** panel, locate the associated image files and select the dropdown menu to reveal the download options for the asset you wish to retrieve.
4. Click the download button or URL to download the file locally.

To review a detailed guide on downloading data assets from the catalogue, see:

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
