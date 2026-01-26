# Seagrass monitoring in the Sound of Barra

Authored by Karen Frake and Chris Nall at NatureScot

_Keywords_: Environment, Seagrass, ArcGIS Pro, Airbus, SPOT, Pléiades, Pléiades Neo, Special Area of Conservation

## Seagrass monitoring in the Sound of Barra, Outer Hebrides, Scotland

High resolution imagery is essential for monitoring the seagrass at the Sound of Barra, on the west coast of Scotland in the Outer Hebrides. The EO DataHub was used to determine the availability of commercial satellite imagery for this area, and to download samples for further analysis.

The Sound of Barra, located off the Scottish coastline in the Outer Hebrides, is a Special Area of Conservation (SAC). It was designated for two Annex I European Habitats, including sandbanks that are slightly covered by seawater all the time, which encompasses seagrass beds. In addition, seagrass beds are a Priority Marine Feature, and contribute to carbon sequestration, provide shelter to a range of other species and prevent erosion of the seabed. However, in the Sound of Barra the subtidal sandbanks are in unfavourable condition. This classification reflects the loss and degradation of seagrass beds and maerl beds within the site. Tracking the health and extent of these beds is, therefore, essential for long-term habitat management and restoration.

__INSERT IMAGE__

Figure 1: Underwater view of healthy seagrass beds, a Priority Marine Feature

## The need for improved mapping
Mapping extent of seagrass beds is important for monitoring the condition of beds in the SAC, to help protect these habitats. The seagrass reduces in coverage over the winter and increases over the summer, with a maximum coverage reached in August to September. Peak coverage conditions are best for delineating the seagrass bed extents, making the months of August and September a suitable date constraint for the image search.

While aerial imagery is available through national monitoring contracts, it's typically collected only every three to four years. Infrequency of aerial survey flights means this data doesn't provide the temporal resolution needed to capture seasonal changes. In addition, the aerial imagery contract is confined to inshore waters, precluding capture for some seagrass beds that are further offshore. To supplement this, high resolution satellite imagery offers another way to monitor the extent of seagrass between these years, and a way to monitor seasonal change in coverage within a single year.

__INSERT IMAGE__ 

Figure 2: Map of area of interest in Sound of Barra, Outer Hebrides, Scotland

## Seagrass conservation and protection

Seagrass beds (Zostera spp.) are an OSPAR threatened and / or declining habitat and a Priority Marine Feature (PMF) in Scotland. Seagrass beds are a protected feature in a number of Marine Protected Areas (MPAs). The MPA network includes Nature Conservation MPAs, Special Areas of Conservation (SACs), Special Protection Areas (SPAs) and Sites of Special Scientific Interest (SSSI). Sites with seagrass beds include Sound of Arisaig; Sound of Barra; Loch nam Madadh; Dornoch Firth and South Arran. The feature can be part of the following broadscale habitats: Lagoons; Mudflats and sandflats; Sandbanks which are slightly covered by sea water all the time; and, Estuaries. European sites (SACs and SPAs) are internationally important for threatened habitats and species.

## Streamlining image search

The EO DataHub was used to search for suitable cloud-free, high-revisit imagery. By determining the availability of useful Airbus data for the application area using EODH search functionality, a fitness-for-purpose assessment could be carried out prior to analysis. The commercial data catalogue was used to define a targeted image search, including parameters such as:

* Specified date ranges (months of August and September)
* Defined area of interest (as a bounding box)
* Cloud coverage area range constraints

The search returned a range of candidate images, which were initially assessed through thumbnails. The results included imagery from three commercial data collections:
* Airbus SPOT6 (1.5m resolution)
* Airbus PHR (0.5m resolution)
* Airbus PNEO (30cm resolution)

Four high-quality images captured between 2023 and 2024 were selected for further analysis. Python notebooks were used to automate and streamline the ordering process, simplifying the transition from search to acquisition.

__INSERT IMAGE__

Figure 3: Seagrass in the Sound of Barra, seen from a cloud-free Pléiades Neo acquisition © Airbus DS 2023

## Analysis continuity in ArcGIS Pro

The next step was to download these images to a local machine in order to work with them directly in ArcGIS Pro. Once the image files were imported into the software, a direct visual comparison was made between the commercial satellite data and an aerial imagery dataset. The Classification Wizard in ArcGIS Pro, an inbuilt GIS tool for image classification, was used to preprocess the aerial imagery for quantification over a long time range prior to carrying out the intercomparison. Minimal visible seasonal change was found to be present. Synergising commercial data provided by the EO DataHub with aerial photography and other datasets external to the Hub allowed for advanced insights to be derived from combined sources to inform future conservation initiatives.

## Powered by the EODH

Using the EODH as a single point of access for high resolution and high revisit cloud-free commercial data simplified the approach to seasonal seagrass extent monitoring in the Sound of Barra. Search workflows were easy to follow and rapid to execute. Refining search constraints with useful filters such as temporal range, spatial extent, collection type and cloud cover returned a valuable selection of imagery specific to the use case. Finally, access to both commercial and open data in one place allowed for a useful comparison of fitness-for-purpose, and facilitated easy piloting of a potential project, study, or analysis.

## About Us
Read more about environmental management and protection of Scottish natural landscapes at NatureScot.

