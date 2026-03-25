# GIS integrations

## :simple-qgis: QGIS plugin

The EODH QGIS plugin provides a practical integration between QGIS and the Earth Observation Data Hub, enabling users to explore and execute EO workflows directly within an open-source GIS environment. Designed to showcase the EO Application Package and workflow capabilities of EODH, the plugin allows users to access the resource catalogue and search for specific data. Users can also access, manage and run CWL processing jobs without needing to leave QGIS. This tight integration supports a more efficient workflow, particularly for users who rely on QGIS for data preparation, visualisation and analysis, while still benefiting from the scalable processing and data access offered by the EODH platform. The plugin also allows users to directly load data assets into QGIS from the EODH platform.

Installation is straightforward, either via the QGIS plugin repository or through manual installation using a downloaded archive. The plugin makes use of the QPIP plugin to handle Python dependencies, simplifying setup by installing required packages automatically. Compatibility is centred around Python 3.9 or newer, with the latest QGIS Long Term Release recommended for the most stable experience. After installation, users simply configure their EODH authentication credentials within the plugin settings, allowing immediate access to workflows and job management features within the QGIS interface.


__Installation from zip__

* Go to the plugin GitHub repository
* Find the latest release and download for your operating system
* Open QGIS and click ….
* Use the “Install from Zip” function to install the plugin

__Installation from repository__

* Open QGIS and click ….
* Search for EODH under the All or Uninstalled tabs
* Select and click “Install”


* Repository: [https://github.com/EO-DataHub/eodh-qgis](https://github.com/EO-DataHub/eodh-qgis)


## :simple-esri: ArcGIS Pro plugin

The Earth Observation Data Hub (EODH) ArcGIS Pro Plugin provides a seamless way for GIS professionals to access and work with Earth observation data without leaving their familiar desktop environment. By integrating directly into ArcGIS Pro (3.3+), the plugin eliminates the need to switch between platforms, streamlining the workflow from data discovery to analysis. Users can explore STAC catalogs and collections in an intuitive interface, making it easier to identify relevant datasets for a given project. Advanced search and filtering options allow datasets to be refined by area of interest, date range, and cloud cover, ensuring that only the most suitable imagery is selected.

The plugin also enhances the data evaluation process through built-in preview capabilities, including thumbnail views and an interactive timeline, which help users quickly assess data quality and temporal coverage. Once suitable datasets are identified, they can be loaded directly into ArcGIS Pro as map layers using COG or GeoTIFF formats, enabling immediate analysis and visualisation. In addition to open data access, the plugin supports the purchase of commercial satellite imagery from providers such as Airbus and Planet, broadening the range of available data. Workspace management features further improve efficiency by allowing users to organise and maintain their selected assets within the ArcGIS Pro environment.

As of March 2026 the plugin is in beta-testing, and these documentation files will be updated as we recieve more feedback from users.

* Repository: [https://github.com/EO-DataHub/arcgis-plugin](https://github.com/EO-DataHub/arcgis-plugin)


