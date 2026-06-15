# :simple-qgis: QGIS plugin

## Introduction
The EODH QGIS plugin provides a practical integration between QGIS and the Earth Observation Data Hub, enabling users to explore and execute EO workflows directly within an open-source GIS environment. Designed to showcase the EO Application Package and workflow capabilities of EODH, the plugin allows users to access the resource catalogue and search for specific data. Users can also access, manage and run CWL processing jobs without needing to leave QGIS. This tight integration supports a more efficient workflow, particularly for users who rely on QGIS for data preparation, visualisation and analysis, while still benefiting from the scalable processing and data access offered by the EODH platform. The plugin also allows users to directly load data assets into QGIS from the EODH platform.

## 💡 Video Tutorial: EODH QGIS Plugin
<div class="video-embed">
    <iframe src="https://drive.google.com/file/d/1zHC6thJZl2x7P_j1Vli_RssFpX7D2XGA/preview" width="640" height="480" allowfullscreen loading="lazy"></iframe>
</div>

## Setup
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

[Go to the repository 🚀](https://github.com/EO-DataHub/eodh-qgis){ .md-button }

