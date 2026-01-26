# Measurements Supporting Biodiversity Net Gain (BNG)

Authored by Bonnie Pickard

_Keywords_: Habitat, Biodiversity Net Gain, Sustainable Development, Airbus Pléiades Neo, Planet PlanetScope, Sentinel-2, Pixel Classification, NDVI, Change Detection, Deep Learning Models

## Supporting Measurements of Biodiversity Net Gain Using High-Resolution Commercial Earth Observation Data

Recent advancements in the resolution and availability of satellite imagery have the potential to aid the UK’s goals for sustainable development in the construction industry, by helping to measure and understand habitat biodiversity. This case study demonstrates how high-resolution commercial satellite data, obtained via the EO DataHub, can support the broad identification and monitoring of existing habitats, and highlight other areas for potential habitat creation. This therefore helps to mitigate against negative impacts from development, in the effort to promote Biodiversity Net Gain. 
Leaving nature better than you found it
Biodiversity Net Gain (BNG) is an approach to development and land management, which aims to leave the natural environment in a measurably better state than it was beforehand, by creating or enhancing habitats. Under the Environment Act 2021, it is now a legal requirement for developers across England to deliver at least 10% BNG for most major developments. BNG has become mandatory for all small sites from April 2024 and Nationally Significant Infrastructure Projects (NSIPs) from November 2025.

The statutory biodiversity metric, published by the Department for Environment, Food and Rural Affairs (DEFRA), provides the means to measure standardised biodiversity units for the purposes of BNG. A habitat will contain a number of biodiversity units, depending on its size, quality, location, and type. The number of biodiversity units present before and after a development are typically measured during surveys conducted by ecologists. The aim of the BNG initiative is to ensure a net increase in the number of biodiversity units around the development, thus delivering a positive impact on habitat biodiversity.

The EO DataHub provided the opportunity to access and analyse both commercial and open-source satellite data from Sentinel, Airbus, and Planet. The data was analysed using geoprocessing tools and deep learning packages in ArcGIS Pro (Esri). Figure 1 shows the example region of interest around Stonehouse, Gloucestershire.

__INSERT IMAGE__

Figure 1: Area of interest around Stonehouse, Gloucestershire, UK © OpenStreetMap contributors.

## Using high resolution commercial data to identify habitat type

Deep learning computer models that use pixel-based classification (also known as segmentation), can be trained on satellite data to identify habitat and land cover type. The model or ‘neural network’ is ideally trained on thousands of labelled image ‘chips’, which are representative samples of each object or class in the chosen imagery, and are selected by the user. For example, these could be buildings, lakes, road segments, or forests. The model then seeks to classify each pixel of an image according to the spatial and spectral properties of the object or class it’s been trained on. The size of each identified habitat can then be calculated.

Figure 2 depicts the results of running a pre-trained deep learning model on commercial 30cm resolution Airbus Pléiades Neo imagery. This model, available from ArcGIS Living Atlas, has been trained on the Chesapeake Bay high-resolution 2013/2014 NAIP Landcover dataset (produced by Chesapeake Conservancy with University of Vermont Spatial Analysis Lab (UVM SAL), and Worldview Solutions, Inc. (WSI)). Although the results of the analysis provide a fair approximation of habitat type, further fine-tuning of the model will be required to generate a more accurate representation across the region of interest. This could be achieved by the user generating their own training dataset with more diverse habitat classes, using the Pléiades Neo imagery to retrain the model.

__INSERT IMAGE__

Figure 2: Land cover type identified using a pre-trained deep learning model on a 30cm resolution Pléiades Neo image © Airbus DS (2023).


The application of remote sensing data to identify habitat type may help ecologists to broadly map the spatial distribution of habitats before conducting on-site surveys, and thus increase efficiency. This may also aid the detection of land parcels suitable for habitat creation both on and off-site.

## Using high resolution commercial data to assess habitat condition

The Normalized Difference Vegetation Index (NDVI) is a standardised metric to measure vegetation health or ‘greenness’. NDVI is calculated by comparing the red and near-infrared bands from multispectral satellite data and its value can vary from 1 to -1. Negative NDVI values indicate no vegetation at all, such as water, and values close to 0 represent concrete, rock, or bare soil. Moderate to high positive values indicate grasslands, forests and lush vegetation.

__INSERT IMAGE__

Figure 3a & 3b: NDVI values of 3m resolution PlanetScope images © 2022 & 2024 Planet Labs PBC. Figure 3c: Amount of change in NDVI values between summer 2022 to 2024. 


Figures 3a & 3b illustrate the measurement of NDVI values for two commercial Planet PlanetScope images, two years apart, during the summer season. Higher (green) values relate to areas of healthy woodland and agriculture whilst lower (red to yellow) values indicate buildings and sparse vegetation. Regular revisit times of satellites allow multiple images to be captured quickly. Change detection is the process with which to quantify the type, magnitude, and location of change by comparing multiple satellite images through time. Figure 3c shows the net change in NDVI values for the same area over the two-year period. Please note that in this example, the change in NDVI has been measured from two discrete images and does not represent an average or take seasonal fluctuations into account. The area of each type of change can also be calculated.


NDVI, as well as other remote sensing-derived indexes, can therefore be used to broadly determine the condition of each habitat. NDVI calculations from satellite data, coupled with change detection methods can also allow the habitat condition to be monitored remotely over the life cycle of the development. However, information derived from satellite imagery should be validated and used in conjunction with on the ground surveys.

## Powered by the EO DataHub

In summary, this study demonstrates how high-resolution satellite data has the increasing potential to support the measurement of biodiversity units alongside on the ground surveys, to ensure BNG, and prevent habitat loss.


The Earth Observation DataHub delivers the unique capability to quickly access and obtain Earth Observation data from multiple open source and commercial sources in one centralised platform. The EODH resource catalogue provides an easy-to-use, no-code interface within which to browse and identify relevant EO data, using filters to search various collections. Images from different data providers can be compared using the ability of the resource catalogue to pin and view multiple images. The EODH is an effective way to improve awareness of, and access to, a wide range of EO data, without the need for any programming experience.

## About us

Dalcour Maclaren specialise in providing BNG services tailored to the unique needs of the utilities and infrastructure sectors, offering expertise in ecology, surveying, planning and land. Find out more about solution-led approaches to delivering BNG at Dalcour Maclaren.

__INSERT IMAGE__