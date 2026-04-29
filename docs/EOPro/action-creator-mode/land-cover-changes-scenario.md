# Land cover changes scenario

The Land Cover Change Detection preset workflow on the EOPro platform allows users to easily detect and analyze land cover changes within their Area of Interest (AOI). It is designed to help users monitor how different land cover classes evolve over time by utilizing established data set such as Global Land Cover dataset from ESA sourced via the CEDA archive.

The workflow processes and crops STAC items to the user's specified AOI. Then it calculates the per-class area for each land cover category. The front-end interface visualizes these changes over a selected time period, providing clear insights into the spatial distribution and temporal changes of various land cover classes (e.g., forest, cropland, urban areas, water bodies).

The backend API in the Land Cover Change Detection workflow manages the registration of processes in the user's workspace on the ADES (Application Deployment and Execution Service). It handles the orchestration of these processes by triggering jobs to run asynchronously, ensuring efficient resource management and seamless execution. 

Land Cover Changes scenario can be used for: 

- Detecting Urban Expansion: Observe how cities grow and change land use.
- Measuring Deforestation/Reforestation: Track increases or decreases in forested areas. 
- Agricultural Management: Understand the shift and scale of farmland, pasture, or crop types over time. 
- Environmental Monitoring: Identify changes in wetlands, grasslands, or other habitats sensitive to climate or human impact.

Workflow explanation: 

- **Data Ingestion:** The system takes in relevant land cover data set ESA GLCM
- **Per-Class Area Calculation:** Within the user-specified region of interest, the workflow calculates the area occupied by each land cover class for each available time period. 
- **Storage:** These aggregated results are stored as a STAC collection in the user’s workspace, ensuring easy retrieval and compatibility with EOPro tools. 
- **Visualisation:** In the front-end application, the user sees a time series bar-chart illustrating how each land cover class’s area changes over different time periods. 