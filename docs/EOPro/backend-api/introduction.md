# Introduction

## Purpose of the Backend API

The [Backend API for Action Creator](https://github.com/EO-DataHub/eodh-ac-api) is designed to facilitate advanced geospatial data processing by enabling users to submit, manage, and monitor complex workflows, such as Water Quality Index calculations and Land Cover Change Detection. This API serves as the backbone of the EOPro's Action Creator platform, providing essential functionalities for integrating external services i.e. EODH ADES (OGC Processing API) and ensuring secure and efficient execution of geospatial analyses.

## Overview of functionalities

The Backend API supports a wide range of functionalities including task submission, job status monitoring, in-situ data calibration for Water Quality Indices (future use-case), and interaction with external processing services. It integrates seamlessly with the frontend and other system components, offering a consistent interface for users to perform various geospatial tasks.

## Integration with EODH ADES API (OGC Processing API)

A key feature of the Backend API is its integration with [EODH's ADES API](https://eoepca.readthedocs.io/projects/deploy/en/stable/) which allows for the execution of complex geospatial processes. This integration enables the Action Creator to leverage external computational resources, ensuring that users can perform sophisticated analyses on large datasets without compromising performance.
