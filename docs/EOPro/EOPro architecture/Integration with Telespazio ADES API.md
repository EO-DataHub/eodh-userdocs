Telespazio’s ADES API provides a platform for executing geospatial processes. The Action Creator API integrates with this service to offload computationally intensive tasks.

Please refer to: [ADES (Processing) - EOEPCA Deployment Guide ](https://eoepca.readthedocs.io/projects/deploy/en/stable/eoepca/ades-zoo/) for more details.

**Triggering Processes via ADES**

The API includes logic to trigger geospatial processing tasks via the ADES API,
allowing users to leverage Telespazio’s computational resources.

Samples are [here](https://github.com/EO-DataHub/eodhp-ades-demonstration/blob/main/eodhp-ades-demonstration.ipynb)

**Handling Responses from ADES**

The API handles responses from the ADES API, logging the outcomes and returning relevant information to the user.

Sample responses can be viewed with this [notebook](https://github.com/EO-DataHub/eodhp-ades-demonstration/blob/main/eodhp-ades-demonstration.ipynb).

**Challenges and Considerations**

Integration with ADES presents challenges such as ensuring secure communication, handling errors, and managing long-running tasks. These aspects are carefully managed to ensure a smooth user experience. 