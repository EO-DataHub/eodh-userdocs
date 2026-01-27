# Metadata

Metadata, or "data about data," is crucial for understanding and effectively using the datasets in the Resource Catalogue. This chapter explains the different types of metadata available and how to access and interpret them.

## Basic Collection Metadata

When you first view a collection card, you're already seeing some basic metadata:

* Collection title
* Date range
* Description
* Keywords

__INSERT IMAGE__

## Detailed Collection Metadata

To access more detailed metadata about a collection:

1. Open the collection
2. Look for the information button in the left-hand panel
3. Click the information button to view comprehensive metadata

__INSERT IMAGE__

## Types of Collection Metadata

The detailed metadata view includes:


=== "STAC Extensions"

    * Information about the SpatioTemporal Asset Catalog (STAC) extensions used
    * STAC is the standard protocol used for storing catalog data

=== "Spatial Information"

    * Geographic coverage of the data
    * Spatial extent details

=== "Rendering Information"

    * Parameters for different visualization types
    * Available variables and their display options

=== "Data Content"

    * Fields within the data cube
    * Available variables (e.g., analysed sea surface temperature, standard deviation, sea ice fraction)

=== "Scientific References"

    * Academic citations related to the dataset
    * Links to relevant research


## Additional Collection Information Tabs

Beyond the basic metadata view, collections include several specialised tabs:


=== "Assets"

    * Files associated with the collection
    * Includes thumbnails and data files
    * Links to actual data resources

=== "Providers"

    * Information about data providers
    * Includes hyperlinks to provider websites
    * Specifies different roles (producer, host, etc.)

=== "Additional Resources"

    * Links to related references
        * Item geode
        * JSON metadata (for developers)
        * License information
        * Collection items

=== "Quality Information"

    * Documented product validation
    * Quality assurance details
    * Data quality metrics

## Item-Level Metadata

Each individual item (scene) within a collection has its own metadata, accessible through the information button on the item card. 

### Basic Scene Information

* Platform information (e.g., which satellite captured the data)
* Orbit details
* Cloud cover information

### Scene Assets

For satellite imagery (e.g., Sentinel 2 ARD), assets might include:

* Cloud-optimized GeoTIFFs (COGs)
* Cloud cover masks
* Cloud probability files
* Topographic shadow data

Each asset file includes metadata about:

* Available bands
* File formats
* Usage instructions

__INSERT IMAGE__

## Accessing Machine-Readable Metadata

For developers or advanced users:

Look for the "self" link in the additional resources. This provides the JSON representation of the metadata and can be used for programmatic access or integration with other tools

__INSERT IMAGE__


__Watch video tutorial__