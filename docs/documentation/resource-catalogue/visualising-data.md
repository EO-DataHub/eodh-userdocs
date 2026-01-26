Visualising Data
This guide explains how to access and use data from the Resource Catalogue directly in QGIS, taking advantage of cloud-optimized formats for efficient data access.

Prerequisites
Before starting, ensure you have:

QGIS installed on your computer
A scene selected in the Resource Catalogue
The URL for the data you want to access
Accessing Cloud-Optimized GeoTIFFs (COGs)
Finding the Data URL

In the Resource Catalogue, open your scene of interest
Click the information (i) button on the item card
Navigate to the "Assets" tab
Look for the "cog" (Cloud-Optimized GeoTIFF) asset
Right-click the download link and select "Copy link address"

Adding the Layer to QGIS

Open QGIS
Go to Layer → Add Layer → Add Raster Layer
In the "Source" section, select "Protocol" as the source type. Paste the COG URL you copied, and click "Add"

Configuring the Display
Band Assignment

After adding the layer, you may need to adjust the band assignments for proper visualization:

Double-click the layer in the Layers panel
Go to the "Symbology" tab
Assign the correct bands
Click "Apply" to see the changes

For Sentinel 2, we select:

Red band → Band 4

Green band → Band 3

Blue band → Band 2


Additional Display Options

You can further enhance the visualization by:

Adjusting the stretch type
Modifying the contrast
Changing the opacity
Applying different colour ramps
Working with Additional Assets
Many scenes include additional assets that can be useful for analysis:


Cloud Masks

To add a cloud mask:

Copy the URL for the cloud asset
Add it as a new raster layer in QGIS
The mask will show completely cloud-covered areas in black, and areas potentially affected by cloud shadow in grey

Other Available Assets

Depending on the scene, you might find:

Topographic shadow masks
Valid pixel masks
Cloud probability layers
Other specialized masks
Best Practices
Use COGs When Possible

COGs are optimized for web access
No need to download the entire file
Efficient for large datasets

Layer Management

Organize layers in groups
Use meaningful names
Save layer styles for reuse

Performance Tips

Use appropriate zoom levels
Consider caching settings
Monitor memory usage with large datasets
Note: If the data is not available as a COG, download the file to your local machine, add it to QGIS using the standard file import, and process it as you would any other local file
Next Steps
Now that you know how to access and use data in QGIS, you can:

Perform spatial analysis
Create maps and visualizations
Combine data from multiple sources
Generate reports and share results
Watch video tutorial