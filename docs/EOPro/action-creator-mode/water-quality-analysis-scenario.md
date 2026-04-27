The Water Quality Analysis preset workflow on the EOPro platform enables users to assess water quality by analyzing spectral data from satellite imagery sourced from Sentinel-2 ARD (created by DEFRA and JNCC). It evaluates key parameters such as Cyanobacteria concentration, Dissolved Organic Carbon (DOC), Colored Dissolved Organic Matter (CDOM), Normalized Difference Water Index (NDWI), and Turbidity (TURB). The workflow employs the Sentinel Water Mask (SWM) algorithm to generate a water mask, ensuring calculations are performed only on water pixels.

The backend API orchestrates parallel execution of index calculations on ADES, optimizing performance and resource efficiency. Users can visualize individual indices on a map and explore time-series data, displaying minimum, mean, and maximum values for each source item over time. This provides an interactive and insightful analysis of water quality dynamics. 

Water Quality Analysis scenario can be used for:

- Monitoring Algal Blooms: Track and predict cyanobacteria growth in lakes and reservoirs.
- Drinking Water Safety: Detect high turbidity or dissolved organic matter levels that might indicate contamination.
- Ecosystem Health: Gauge the clarity and overall health of rivers, lakes, and coastal waters.
- Aquaculture & Fisheries: Evaluate suitable environments for fish farming and
maintain healthy aquatic habitats. 

Workflow explanation:

- **Data Ingestion:** The preset retrieves Sentinel-2 L2A or Analysis Ready Data (ARD) for the water bodies of interest.
- **Spectral Indices Calculation:** A suite of indices is generated, including but not limited to: 
    - Cyanobacteria Density: Helps indicate the presence and concentration of harmful algal blooms.
    - Turbidity: Measures water clarity; higher values can signal suspended sediment or pollution.
    - Dissolved Organic Carbon (DOC): Estimates organic carbon content, critical for water chemistry and quality. 
    - Coloured Dissolved Organic Matter (CDOM): Evaluates the amount of organic material that affects water colour and light penetration.
    - Normalised Difference Water Index (NDWI): Delineates water bodies and tracks water content in vegetation.

- **Result Storage & Visualisation:** The output data and derived indices are saved in the user’s workspace as STAC collections for easy access. Graphical tools and dashboards within EOPro can be used to visualise trends over time, allowing for early detection of deteriorating water conditions.

References: 

- [Potes et al. 2018 - CYA](https://piahs.copernicus.org/articles/380/73/2018/)
- [Sentinel 2 Water Mask](http://www.informacjakryzysowa.pl/en/publikacje1/sentinel-water-mask-(swm)-new-index-for-water-detection-on-sentinel-2-images)
- [Zhan et al. 2022 - TURB ](http://dx.doi.org/10.23818/limn.41.18)
- [Soria-Perpinya et al. 2021 - CDOM](https://www.mdpi.com/2073-4441/13/5/686)
- [Potes et al. 2018 - DOC](https://piahs.copernicus.org/articles/380/73/2018/)
- [Sentinel 2 NDWI](https://custom-scripts.sentinel-hub.com/custom-scripts/sentinel-2/ndwi/)