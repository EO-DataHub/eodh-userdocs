# Key components

Task Submission and Management: Handles the submission of geospatial tasks and manages their lifecycle.

Action Creator Workflows: Internally the API leverages [eodh-workflows](https://github.com/EO-DataHub/eodh-workflows) package to schedule CWL processes to the ADES API.

Integration with External Services: Manages interactions with EODH's ADES API and [Keycloak](https://eodatahub.org.uk/keycloak/realms/eodhp/account/).
