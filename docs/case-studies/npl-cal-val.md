# Calibration and Validation

Authored by Madeline Stedman at National Physical Laboratory

_Keywords_: Uncertainty, Cross-calibration, Satellite Intercalibration, Climate, TRUTHS, Sentinel-2, Landsat, Copernicus, CAL/VAL, Calibration, Validation, Planet SuperDove, Airbus Pléiades

## Enhancing Satellite Calibration and Validation Methodologies with High-Resolution Commercial Earth Observation Data

A new generation of high-accuracy SI-Traceable satellite “SITSat” missions aim to serve as “gold-standard” references for satellite calibration. This case study demonstrates how high-resolution commercial satellite data via EO DataHub can support development of more detailed models to improve understanding of satellite calibration and validation uncertainties. This therefore helps to refine best practices in preparation for upcoming SITSat missions.

Remote sensing plays a crucial role in monitoring the Earth's climate, providing critical data to support decision-making. As our global Earth observing system expands to include a rapidly increasing number of both space agency missions and low-cost commercial constellations, ensuring data consistency across different sensors is a key challenge. For example, calibration biases make it difficult to integrate data from multiple sources seamlessly, limiting our ability to achieve comprehensive environmental monitoring.

__INSERT IMAGE__

Figure 1: Libya-4, desert Pseudo-Invariant Calibration Site (PICS), visualised in true colour with Pléiades imagery © CNES (2024), Distribution Airbus DS


To address this challenge, radiometric harmonisation can be performed to ensure consistency between different satellite sensors, by attempting to minimise the biases between their measurements. This is typically achieved through:
* Vicarious calibration, using reference data from ground-based instrumented sites, like RadCalNet.
* On-orbit cross-calibration, where images taken by satellites when their orbits cross paths are compared directly – called matchups.

The next generation of high-accuracy SI-traceable satellites (SITSats) aim to serve as “gold-standard” calibration references for on-orbit cross-calibration. This includes missions such as ESA’s planned TRUTHS (Traceable Radiometry Underpinning Terrestrial- and Helio- Studies) and NASA’s CLARREO (Climate Absolute Radiance and Refractivity Observatory) Pathfinder (CPF) missions.

However, differences in sensor designs, such as in their spectral response or spatial resolution, mean that comparisons of raw matchup images are not truly “apples to apples”. These observational differences between sensors must be compensated for to estimate fundamental calibration biases. For example, the differences in spatial resolution can be compensated by aggregating the pixels from each sensor to form a sufficiently large common comparison field-of-view, such that the aggregated pixels from both sensors now cover approximately the same area.

__INSERT IMAGE__

Figure 2: Illustration of spatial resampling in satellite matchups. The orange region shows collocated observations, with swaths from a lower resolution (green) and higher resolution (blue) satellite. Thick dark green and blue lines represent the lower-resolution sensor’s comparison field-of-view and the higher-resolution sensor’s reconstruction, respectively.


## Using high resolution commercial data to assess spatial uncertainties

Despite this processing, satellite mis-pointing and the variability of the underlying landscape limits how well the aggregated measurements in a comparison field-of-view match – ultimately limiting the performance achievable in any comparison.

To quantify and mitigate these effects, we have used high-resolution Airbus Pléiades (2m native resolution) and Planet SuperDove (3m native sampling) imagery. The fine spatial information provided by this imagery enabled us to produce detailed simulations of matchup scenarios over key Cal/Val (Calibration/Validation) sites, including Libya-4 (a widely used desert Pseudo-Invariant Calibration Site (PICS)), and RadCalNet sites (mentioned above). We could then make use of these high-resolution simulations to test how sensor geolocation uncertainty, surface heterogeneity, and field-of-view selection impact spatial resampling performance.

__INSERT IMAGE__

Figure 3: 2 m resolution Airbus Pléiades TOA radiance image (left), and subset of simulated 10 m (middle) and 50 m (right) TOA radiance images for Libya-4 desert scene at 500 nm, with a 20 degree relative rotation.


Our results show that selecting an appropriate region of interest (ROI) for the comparison, based on sensor geolocation accuracy (from mis-pointing) and surface variability, can reduce uncertainty. The figure below illustrates this for a simulated comparison between TRUTHS (50 m resolution) and ESA’s Sentinel-2 (10 m resolution). Plotted is the uncertainty on the simulated aggregated comparison field-of-views (200 m resolution), caused by sensor noise and geolocation knowledge. The geolocation uncertainties of Sentinel-2 and TRUTHS are 0.5 pixels, i.e. 5 m and 25 m respectively. These results show that this geolocation uncertainty dominates in this processing step across the spectral range, contributing uncertainties of up to 0.25 %.

__INSERT IMAGE__

Figure 4: Uncertainty components for spatially resampled Sentinel-2 (target) and TRUTHS (reference) simulated radiances over a Libyan desert scene, derived from similar Pléiades spectral bands. Combined uncertainty is obtained by combining noise and geolocation uncertainties in quadrature.


## Refining on-orbit calibration best practices

This study demonstrates how high-resolution commercial imagery supports the development of more detailed models to better understand satellite comparison uncertainties. These insights help refine best practices for on-orbit calibration, ensuring readiness for upcoming SITSat references like TRUTHS and CPF. As Earth Observation continues to evolve, analyses such as this can therefore help to maximise the effectiveness of SITSat missions, ultimately contributing to a more robust, harmonised global monitoring system.

## About Us

Find out more about research at the National Physical Laboratory.

