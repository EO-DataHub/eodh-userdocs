# Using Dask with the Earth Observation Data Hub

Dask is an open-source parallel computing library for Python that enables users to scale their data processing workflows from a single machine to large distributed environments. It is designed to work with familiar Python tools such as NumPy, pandas, and xarray, but extends them to handle datasets that are too large to fit into memory or require more computational power than a single core can provide. Within the context of Earth observation, Dask is particularly well suited to processing large raster datasets, time series stacks and multidimensional data cubes, making it a natural fit for platforms such as the Earth Observation Data Hub (EODH).

One of the key advantages of Dask is its ability to parallelise workloads transparently. Instead of rewriting code for distributed systems, users can write standard Python workflows and allow Dask to handle task scheduling and execution. This is especially useful when working with large volumes of satellite imagery, where operations such as mosaicking, reprojection, or temporal aggregation can be computationally intensive. By leveraging Dask, users can significantly reduce processing time and make more efficient use of available compute resources, whether running locally or on cloud-based infrastructure.

## Using Dask as an alternative to CWL/EOAP

While Common Workflow Language (CWL) and Earth Observation Application Packages (EOAPs) provide structured, reproducible ways to define and execute processing workflows, Dask offers a more flexible, code-driven alternative. CWL and EOAPs are well suited to standardised, repeatable pipelines that can be packaged and shared across systems. However, they can be less convenient when users need to experiment, iterate quickly or build highly customised workflows.

Dask, by contrast, allows users to define workflows programmatically in Python, making it easier to prototype new approaches, integrate with scientific libraries and adapt processing steps dynamically. This can be particularly advantageous in research and development settings, where workflows are often exploratory and evolve over time. Rather than replacing CWL or EOAPs entirely, Dask can complement them, providing a more interactive and flexible option for certain types of analysis.

## Installing and Running Dask on the EO Data Hub

Dask is already available as part of the EODH pre-configured Python environments, and can be accessed through the Jupyter Notebook service provided by the platform. Dask can also be configured to run as a distributed cluster, which involves setting up a scheduler and multiple worker processes, allowing workloads to be distributed across multiple machines. EODH is providing Dask in configurations suitable to user needs. For example, users working in a notebook environment can install Dask and its common dependencies (such as distributed, xarray, and zarr support) with a single command.

### Using Dask from a Jupyter Notebook

Jupyter Notebooks provide an ideal interface for working with Dask on the EO Data Hub. Users can interactively develop and execute code, visualise intermediate results, and monitor computation progress. Dask integrates seamlessly with libraries such as xarray, which is commonly used for handling multidimensional Earth observation data. By opening datasets as Dask arrays, users can work with data lazily, meaning that computations are only executed when explicitly requested. This approach helps to conserve memory and allows large datasets to be processed in manageable chunks.

Within a notebook, users can also connect to a Dask distributed client, which provides access to a dashboard for monitoring task execution, memory usage, and performance. This visibility is particularly useful when optimising workflows or troubleshooting bottlenecks. Typical use cases might include processing time series of satellite imagery, generating composites, or applying machine learning models to large spatial datasets.

## Further Information

To learn more about Dask, including installation instructions, tutorials, and detailed documentation, visit the official website and documentation:

* [Dask homepage](https://www.dask.org/)
* [Dask official documentation](https://docs.dask.org/)
* [EODH example notebook](../../training-materials/examples/dask_example.ipynb)

These resources provide comprehensive guidance for getting started, as well as more advanced topics such as distributed computing, performance tuning, and integration with other scientific Python tools.
