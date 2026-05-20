# EODH Plugin for ArcGIS Pro — Usage Guide

The EODH plugin brings the Earth Observation DataHub into ArcGIS Pro, letting you search, preview, and load satellite imagery directly into your map. It also supports purchasing commercial imagery from Airbus and Planet.

## Requirements

- Windows 10/11 (x64)
- ArcGIS Pro 3.6 or later
- An EODH account with an API token

## Installation

1. Download the latest `eodh.esriAddinX` file from the [GitHub Releases](https://github.com/EO-DataHub/eodh-arcgis/releases) page.
2. Double-click the downloaded file.
3. Click **Install Add-In** when prompted.
4. Restart ArcGIS Pro if it was already open.

After installation, a new **EODH** tab appears in the ArcGIS Pro ribbon.

<img width="647" height="170" alt="image" src="https://github.com/user-attachments/assets/089fa121-7168-4648-a049-043a67f5e63c" />

## Getting Started

### Signing In

1. Click the **EODH Search** button in the EODH ribbon tab to open the dockpane.
2. Select your environment (Production, Staging, or Test). If you're not sure, select Production.
3. Enter your workspace name and API token.
4. Click **Sign In**.

Your credentials are encrypted and stored locally, so you won't need to sign in again next time.

<img width="398" height="350" alt="image" src="https://github.com/user-attachments/assets/f04891c3-3cd9-40ce-b160-338863eed3ac" />

### Signing Out

Click **Sign Out** in the header bar at the top of the dockpane.

## Searching for Data

The **Search** tab lets you define filters and query the EODH catalog.

<img width="435" height="484" alt="image" src="https://github.com/user-attachments/assets/e84b24e5-c57a-430a-a956-7a90ac76d277" />

### 1. Select a Catalog and Collection

Use the dropdown menus at the top of the Search tab to choose a catalog and, optionally, a specific collection within it.

### 2. Define an Area of Interest (AOI)

Choose one of four methods:

| Method | Description |
|--------|-------------|
| **Draw on Map** | Click the button, then draw a rectangle on the map canvas |
| **Map Extent** | Use the current map view as the AOI |
| **Import GeoJSON** | Load a boundary from a `.geojson` or `.json` file |
| **Clear** | Remove the current AOI |

<img width="1494" height="1105" alt="image" src="https://github.com/user-attachments/assets/a17a8038-948a-4e54-8b96-7f0cbd0a8d72" />

### 3. Set Date Range

Use the date pickers to define the start and end dates for your search. By default, this covers the last two months.

### 4. Set Max Cloud Cover

Drag the slider to set a cloud cover threshold (0–100%). Only results at or below this value will be returned.

### 5. Run the Search

Click **Search**. A summary will show how many items were found.

## Browsing Results

Results appear in the **Results** tab.

<img width="428" height="951" alt="image" src="https://github.com/user-attachments/assets/1c7b64f2-59a8-4d74-b35f-604b3e0d0bad" />

### Timeline

A scrollable timeline strip at the top shows thumbnail previews of each result arranged by acquisition date. Use the **Previous** / **Next** buttons or scroll to navigate. Clicking a thumbnail highlights the corresponding item in the list below.

### Results List

Each result displays:

- **Thumbnail** preview
- **Item ID** and **Collection**
- **Acquisition date**
- **Resolution** (metres)
- **Cloud cover** (%)
- **AOI overlap** (%)

### Selecting Assets

Click on a result to expand its asset list. Each asset shows its type (COG, GeoTIFF, etc.) and whether it can be loaded. Use the checkboxes to select the assets you want, then click **Load Selected Assets**.

You can also **double-click** a result to load its selected assets directly into the map.

<img width="432" height="468" alt="image" src="https://github.com/user-attachments/assets/3ff0e40e-9795-4eca-9a41-16f300a82879" />

## Purchasing Commercial Imagery

Commercial items are highlighted with a gold border. The purchase workflow depends on the provider:

| Provider | Licence Required | Country Required |
|----------|:----------------:|:----------------:|
| Airbus Optical | Yes | Yes (ISO-3 code) |
| Airbus SAR | Yes | No |
| Planet | No | No |

### Purchase Steps

1. Select a licence from the dropdown (if required).
2. Enter the end-user country code (if required).
3. Click **Get Quote** to see the price.
4. Review the price and currency displayed.
5. Click **Place Order** and confirm the purchase.

You can track order status in the **Workspace** tab.

<img width="397" height="172" alt="image" src="https://github.com/user-attachments/assets/7b30a394-5b55-4a5f-a583-e79c3254c776" />

