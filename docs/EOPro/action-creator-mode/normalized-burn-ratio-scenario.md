# Normalized burn ratio scenario

The Normalized Burn Ratio (NBR) scenario is designed to help users detect and assess burned areas and fire severity using satellite imagery. By leveraging Sentinel 2  imagery (Level-2A and Analysis Ready Data), it calculates the NBR spectral index, which highlights changes in vegetation health and structure caused by wildfires or other disturbances.

NBR is particularly effective for identifying recently burned areas, estimating burn severity, and monitoring vegetation recovery over time.

It can be used for:

- Burned Area Detection: Identify regions affected by wildfires or controlled burns.
- Fire Severity Assessment: Distinguish between low, moderate, and high burn severity zones.
- Post-Fire Recovery Monitoring: Track vegetation regrowth and ecosystem recovery over time.
- Forest and Land Management: Support decision-making for reforestation, restoration, and risk mitigation.
- Environmental Impact Analysis: Evaluate how fires affect landscapes, habitats, and carbon cycles.

Workflow explanation:

- Data Ingestion: The preset retrieves Sentinel-2 Level-2A or Analysis Ready Data (ARD)
- Spectral Index Calculation (NBR): The workflow computes the Normalized Burn Ratio using Near-Infrared (NIR) and Shortwave Infrared (SWIR) bands. Healthy vegetation reflects strongly in NIR and weakly in SWIR, while burned areas show the opposite pattern—making NBR effective for fire analysis.
- Result Storage: The generated NBR outputs are stored as raster datasets within the user’s workspace as STAC collections ensuring easy access and interoperability within EOPro.
- Visualisation: In the EOPro interface, users can explore NBR results as color-coded raster layers (e.g., red tones indicating burned areas and higher severity). Time-series comparisons enable users to visually assess fire impact and recovery trends.