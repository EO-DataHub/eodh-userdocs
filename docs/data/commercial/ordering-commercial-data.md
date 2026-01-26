# Ordering commercial data

## Find the data you need

### Search and browse

Searching for the imagery you are looking to purchase is currently possible within our Resource Catalogue interface or directly through our APIs.

This guide walks you through using the Resource Catalogue to find the data you need. You can filter on commercial collections within the Resource Catalogue to discover which collections are available from the currently supported commercial providers. Alternatively, we have an example notebook script to help you get started searching for data programmatically, using pyeodh, available within our training materials.

### Using the Resource Catalogue

Once you have opened a commercial data collection, using the left-hand panel, search for the data you are looking to find by using the available filters. An area of interest should be drawn on the map, and a temporal extent for the data search can be selected via calendar input. The user can also refine the parameters based on max cloud cover and look angle using the slider widgets. The search is carried out automatically once you have applied the chosen filters by selecting the blue Apply button.

All imagery from the Resource Catalogue matching the search parameters is then displayed in a pop out panel adjacent to the left hand panel. The user can scroll through the list to search the available data. Acquisition date and time are displayed per image, as well as the cloud coverage (%), and a thumbnail snapshot of the imagery.

### Checking thumbnails
A thumbnail or quicklook is a low-resolution preview version of the commercial image, typically in JPEG or PNG format, that provides a visual summary of the full-resolution satellite data. It can be viewed prior to placing an order. It allows the user to visually check the content of the image for cloud, quality, or coverage of a specific asset, before purchasing. This allows the user to make informed purchasing decisions.

__INSERT IMAGE__

Figure: Low-resolution quicklook thumbnails for Cornwall, UK (left) and Caringorms, Scotland (right)

!!! note
    Some data thumbnails for commercial imagery provided by Airbus require the user to be logged in to their EODH account.

!!! tip
    To download a quicklook thumbnail, open the data item by clicking the 'i' icon, and got to 'Assets'. If you open the available dropdown menus, you should be given the option to download. From there, you can view the low-resolution thumbnail as you would a normal image file.
    __INSERT IMAGE__


### Ordering interface
From here, the user can purchase an item from the catalogue by selecting 'Purchase' on the item card on the left-hand panel.

__INSERT IMAGE__

This will take you through to the ordering interface, which should look something like the image below. The available ordering fields will vary depending on the data type and the data provider. For example, a SAR data order requests additional, more specific field options. The 'Purchase full scene' checkbox will only be visible if you have drawn an AOI polygon i.e. allowing you to clip your order to the AOI which was drawn.

__INSERT IMAGE__

The next page in the guide will outline each order field. For help understanding the specific requirements of the order needed for your application, it is best to contact support for the data provider directly. Alternatively, reach out to enquiries@eodatahub.org.uk who will be able to put you in touch with the data specialists.


## Understanding the ordering options

### Getting started

The following guidance walks through the requirements for each field in the ordering interface, step by step. Before attempting to order any commercial data, you must first link your account using an API key which is self-served from the commercial provider. This allows you to fetch a quote for the image you are looking to purchase. If your workspace is not linked with an API key, an error message will flag at the point of purchase, preventing you from fetching a quote.

### Filling out the order options

#### [Workspace]

Select a workspace for the private data delivery. You can select any workspace from those that you have been added to or created yourself. The data you purchase will be shared with, and accessible to, all members who are in the selected workspace. Make sure the workspace you select is linked via a valid API key, so that the commercial data quote can be fetched. If you still have issues fetching a quote despite your account being linked, it could be that your API key has expired and you need to refresh it.

#### [Product bundle]

The product bundle is selected from a dropdown menu of 4 available options, outlined below. This field indicates the level of preprocessing required from your imagery order. For example, Basic is the most raw version of the image with the least preprocessing, generally more useful for scientists, while Visual has the most preprocessing stages, enhanced to support easy map visualisations for novice users.

__INSERT IMAGE__

!!! note
    === "Visual"

        A simple map accurate image analogous to an aerial photo. Immediately recognisable, with no specialist EO data expertise. Natural colour, 8-bit RGB image - should be opened by any system - just like a consumer digital camera image, only georeferenced. Orthorectified, pansharpened, natural colour. Suitable for visual mapping applications, image backing for GIS applications, AI computer vision analysis - training and deployment. Suitable for all users.

    === "General Use"
        
        Orthorectified, pansharpened (where applicable) multi-spectral imagery to support general mapping and analytic applications. Calibrated to reflectance. Ready for immediate use - no calibration or data fusion required. Suitable for general image analysis and classification, land cover and land use analysis, and visual mapping applications.

    === "Analytic"
        
        Orthorectified, multispectral imagery to support scientific applications. Calibrated to reflectance. Supplied as a bundle (where applicable) to maintain the radiometric integrity of each band. Orthorectified, reflectance. Suitable for spectroscopy and physical modelling, empirical modelling, precision agriculture and biophysical modelling, and image classification. More aligned to EO specialists.

    === "Basic"
    
        A multi-spectral image close to the natural image aquired by the sensor, aimed to give the user close to full automomy over the data processing chain. Imagery in sensor geometry and corrected for sensor distortions, and co-registration of spectral bands (multispectral and panchromatic). Contains RPCs and sensor model. Imagery is calibrated to remove sensor affects (such as CCD array equalisation), but has no further radiometric processing and can be considered 'Raw'. Not orthorectified or radiometrically corrected. Suitable for precision ortho-rectification, photogrammetry, data calibration and atmospheric correction, and 3D modelling. For EO and photogrammetry specialists.

#### [End user country]

The user must input their country from the dropdown menu.

#### [License]

Select the license from a dropdown menu of the following options:

* Single Use - An individual user
* Multi Use - An organisational license for a team of users

### Clip the ordered image to your AOI

If you have drawn an area of interest, you have the option to clip the delivered image to the drawn polygon area. This will happen automatically if the checkbox remains unticked.

If the box is checked, you are confirming you want to order the full scene, unclipped. You can check this has been actioned by confirming that the quote fetched has gone up in cost (assuming you will now be purchasing a larger area of imagery).

__INSERT IMAGE__

### Placing an order

Once you are happy that all of the above fields are populated as per your purchase request, ensuring there are no errors in the inputs, proceed to make the purchase by selecting the blue Place Order button. Before you carry out the purchase, review all of the fields displayed and check you are happy with all elements of the order, including the metadata, acquisition date, and image ID, as a purchase cannot be reversed once it has been made. If you have any queries before carrying out the order, don’t hesitate to get in contact with enquiries@eodatahub.org.uk where the team will be happy to assist you.


### Order confirmation

If the purchase is successful, the Order Confirmation pop out should appear. The status of the commercial data request, as well as access to your purchased imagery, can now be viewed in your EODH user workspace by going to the 'My Data' section within the catalogue. Reach out to enquiries@eodatahub.org.uk if you experience issues with the delivery status of your order.



## Ordering data programmatically

An example Commercial Data Ordering Notebook is available to guide you through the process of placing an order programmatically. This is the best method to place a bulk order of multiple images in one go. More guidance can be found within the notebook itself, which you can run by starting a Jupyter notebook server instance on the Hub, and uploading the downloaded .ipynb file.