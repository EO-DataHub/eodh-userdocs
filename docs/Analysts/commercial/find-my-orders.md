# Finding my ordered imagery

## Order confirmation

If the purchase is successful, the Order Confirmation page should appear. The status of the commercial data request, as well as access to your purchased imagery, can now be viewed in your EODH user workspace by going to the **My Data > Purchased Data** area, within the **Catalogue** tab.

See the **Order Status** column to review if a purchase was successful. If you experience issues with the delivery status of your order, contact us at [enquiries@eodatahub.org.uk](enquiries@eodatahub.org.uk). You can add failed orders to the table by selecting the **Include Failed Orders** checkbox.

<img width="300" alt="include-failed-orders" src="https://github.com/user-attachments/assets/bd59d7a3-9497-4a12-a386-cae9dcb65391" />

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

[📌 Managing pinned items](https://docs.eodatahub.org.uk/Explorers/resource-catalogue/search-and-browse/#managing-pinned-items){ .md-button }

## Download my ordered imagery

Once an order has been delivered, all of the assets and files associated with that scene can be downloaded directly from the item's metadata.

1. Select **View on map** against the delivered order to open it in the **Pinned Items** list.
2. Open the item metadata by selecting the **Information** icon.
3. In the **Assets** panel, locate the associated image files and select the dropdown menu to reveal the download options for the asset you wish to retrieve.
4. Click the download button or URL to download the file locally.

To review a detailed guide on downloading data assets from the catalogue, see:

[⬇️ Download data](https://docs.eodatahub.org.uk/Explorers/resource-catalogue/downloading-data/){ .md-button }

## Use my ordered imagery

Purchased imagery is delivered to and stored within your EODH workspace data storage, using S3. This allows you to access and use ordered scenes across the EODH platform.

### Jupyter notebooks

Once you have launched a Jupyter notebook server, you can browse your workspace file directory directly from the Jupyter interface. Within your `s3` storage folder, you should find a sub-folder named `commercial-data`. This folder contains the imagery products that have been delivered as part of your commercial data orders.

<img width="574" height="261" alt="s3-store-jupyter" src="https://github.com/user-attachments/assets/6aaec518-cd36-44b2-8df0-61b45db4ff38" />

From this directory, you can access imagery directly within your notebooks and begin analysing the data in a programmatic Python environment.

### GIS plugins

Within any of the EODH GIS plugins, open the **Workspaces** tab when authenticated (signed in) to the plugin with your workspace credentials. From here, you can browse your workspace storage within the GIS software, and load the scenes directly into your GIS project.

<img width="500" alt="gis-s3-workspace" src="https://github.com/user-attachments/assets/0eab2021-c61b-4c10-82ce-61df6e622e47" />

This enables you to visualise and analyse purchased imagery without needing to manually download and import the imagery files locally.
