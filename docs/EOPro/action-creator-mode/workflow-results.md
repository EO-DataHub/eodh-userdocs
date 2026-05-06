# Workflow results

Workflow results are displayed as overlays on the map displaying true color images and corresponding assets listed in the left-hand panel. Users can check asset details and select to view asset's true color image on the map.

Users can view and analyze workflow result assets data in the graph below the workflow results. Graphs are generated automatically for applicable workflows, displaying results based on the selected functions, such as NDVI values or Land Cover classes.

Two types of charts are available:

- Line Chart (for NDVI, SAVI, EVI, and Water Quality Analysis):
    - Displays minimum, maximum, and median values for each timestamp.
- Stacked Bar Chart (for Land Cover Change analysis):
    - Each bar represents land cover percentages across different classes (e.g., wetlands, grasslands).
    - Clicking a legend item filters the graph to display only the selected land cover class.

Users can utilize the time slider tool to adjust the displayed data range, which is automatically reflected in the respective graph.

Stacked Bar Chart – Land Cover Change example:

![land cover change](../images/land_cover_change.png)

Line Chart - Water Quality Analysis example:

![water quality analysis](../images/water_quality_analysis.png)

# Legends and symbology

## Land cover changes

Land cover Changes classes use the following colour coding (for GLOBAL Land Cover):

![color coding](../images/color_coding.png)

## Water quality analysis

Water Quality Analysis classes use the following colour coding:

![water quality color coding](../images/water_quality_color_coding.png)

## Normalized burn ratio (NBR)

Normalized Burn Ratio (NBR) uses the following colour coding:

![normalized burn ratio colour coding](../images/normalized_burn_ratio_color_coding.png)

## NDVI, EVI and SAVI

Additional colour coding used for **NDVI**, **EVI** and **SAVI**:

![additional color coding](../images/additional_color_coding.png)

# Downloading results

Users can download a workflow or search results by selecting the 'Download' option in the asset details menu on the left side menu. The respective files, including resulting images and metadata for the selected item, will be downloaded locally.

For multiple files contained within one item, each file initiates its download in a separate browser tab, and depending on the browser's settings, the user might need to approve the download for each tab individually.

![results download](../images/results_download.png)
