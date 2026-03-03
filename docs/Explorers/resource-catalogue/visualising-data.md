# Visualising Data

This guide explains how to access and use data from the Resource Catalogue directly in QGIS, taking advantage of cloud-optimized formats for efficient data access.

__Prerequisites__
Before starting, ensure you have:

* QGIS installed on your computer
* A scene selected in the Resource Catalogue
* The URL for the data you want to access

## Accessing Cloud-Optimized GeoTIFFs (COGs)

### Finding the Data URL

1. In the Resource Catalogue, open your scene of interest
2. Click the information (i) button on the item card
3. Navigate to the "Assets" tab
4. Look for the "cog" (Cloud-Optimized GeoTIFF) asset
5. Right-click the download link and select "Copy link address"

![](../../assets/doc_rc_vis1.png)

### Adding the Layer to QGIS

1. Open QGIS
2. Go to Layer → Add Layer → Add Raster Layer
3. In the "Source" section, select "Protocol" as the source type. Paste the COG URL you copied, and click "Add"

![](../../assets/doc_rc_vis2.png)

## Configuring the Display

### Band Assignment

After adding the layer, you may need to adjust the band assignments for proper visualization:

1. Double-click the layer in the Layers panel
2. Go to the "Symbology" tab
3. Assign the correct bands
4. Click "Apply" to see the changes

For Sentinel 2, we select:

* Red band → Band 4
* Green band → Band 3
* Blue band → Band 2

![](../../assets/doc_rc_vis3.png)

### Additional Display Options

You can further enhance the visualization by:

* Adjusting the stretch type
* Modifying the contrast
* Changing the opacity
* Applying different colour ramps

## Working with Additional Assets

Many scenes include additional assets that can be useful for analysis:

### Cloud Masks

To add a cloud mask:

1, Copy the URL for the cloud asset
2. Add it as a new raster layer in QGIS
3. The mask will show completely cloud-covered areas in black, and areas potentially affected by cloud shadow in grey

![](../../assets/doc_rc_vis4.png)

### Other Available Assets

Depending on the scene, you might find:

* Topographic shadow masks
* Valid pixel masks
* Cloud probability layers
* Other specialised masks

## Best Practices

=== "Use COGs if possible"

    * COGs are optimized for web access
    * No need to download the entire file
    * Efficient for large datasets

=== "Layer Management"

    * Organize layers in groups
    * Use meaningful names
    * Save layer styles for reuse

=== "Performance Tips"

    * Use appropriate zoom levels
    * Consider caching settings
    * Monitor memory usage with large datasets


!!! tip
    If the data is not available as a COG, download the file to your local machine, add it to QGIS using the standard file import, and process it as you would any other local file

