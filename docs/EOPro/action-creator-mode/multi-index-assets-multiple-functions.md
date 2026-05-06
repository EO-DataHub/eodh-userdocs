# Multi-index assets

The EOPro application provides a feature that allows users to view and compare items containing multiple indices, enhancing the ability to fully analyze workflow outcomes.

This functionality is particularly beneficial for Water Quality Analysis.

Upon selection of the asset containing multiple indices users are presented with available indices such as:

- CDOM (Colored Dissolved Organic Matter)
- CYA (Cyanobacteria Bloom Indicator)
- DOC (Dissolved Organic Carbon)
- NDWI (Normalized Difference Water Index)

Then user can choose to view individual indices for detailed examination or add selected indices to comparison tool

![multi-index assets](../images/multi_index_assets.png)

# Multiple functions

Action Creator Workflow Designer allows users to combine consecutive multiple functions (e.g., NDVI with clipping) within a single workflow.

Sequential execution ensures output from one function serves as input for the next.

With built validation rules workflow designer ensures that incompatible functions or datasets are disabled to prevent errors during execution.

The possibility of parallel usage of functions is one of the functionalities coming in future phases.

![multiple functions](../images/multiple_functions.png)
