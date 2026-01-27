# Quality assessment

Quality Assurance (QA) is a crucial aspect of working with Earth Observation data. This guide explains how to find and interpret quality assessment information in the Resource Catalogue, including both documentation quality and product validation metrics.

## Finding Collections with QA Information

Not all collections have QA information available. To find collections that do:

1. Go to the Catalogue homepage
2. Look for the "Quality Assessment" dropdown in the top-right filters
3. Select "Available QA" to see collections with QA data

__INSERT IMAGE__

## Accessing QA Information

To view QA information for a collection:

* Open the collection
* Click the information (i) button in the top-right
* Navigate to the QA tabs

## Documentation Quality Assessment

The "Document QA" tab provides an assessment of the documentation quality for the collection. This assessment:

* Is provided by the National Physics Laboratory (NPL)
* Uses a standard developed by European Space Agency (ESA)
* Rates documentation quality from "Ideal" to "Basic" or "Not Accessible"

## Documentation Quality Levels

The documentation quality level categories are defined below for reference.


=== "Ideal"

    Comprehensive, well-structured documentation

=== "Excellent"

    Very good documentation with minor limitations

=== "Basic"

    Minimal but sufficient documentation

=== "Not Accessible"

    Documentation exists but is not accessible

=== "Not Assessed"

    Documentation has not been evaluated


## Accessing Documentation

At the bottom of the Document QA page, you'll find:

* Hyperlinks to all referenced documents
* Direct access to specific documentation (e.g., geometric processing)
* Links to related technical specifications

__INSERT IMAGE__

## Product Validation

The "Product Validation" tab provides metrics about the actual data quality. 

### Radiometric Uncertainty

* Assessment of radiometric accuracy
* Based on surveys and ground truth comparisons
* Shows accuracy criteria for each band (e.g., ±5%)

### Validation Metrics

For each band and time period:

* Accuracy criteria
* Compliance status (Pass/Fail)
* Overall collection assessment

### Understanding the Results


* Pass. Collection meets all quality metrics
* Fail. Collection does not meet quality metrics
* Partial Pass. Some metrics pass while others fail

__INSERT IMAGE__

!!! note
    Different products may have varying metric values, different requirements for different bands, or time-specific validation results

## Interpreting QA Information

When using QA information, it is useful to consider the following factors when interpreting the results of the assessment. You should:

* Check both documentation and product validation
* Consider the time period of validation
* Note any partial passes or specific band limitations
* Review the underlying documentation for detailed information

## Future Developments
The QA system is evolving. Currently, the scope of the QA assessment on the Hub focuses on quantifying radiometric uncertainty. Additional QA metrics will be added in the future, and new validation methods may be introduced.

!!! info
    Best Practices:

    * Always check QA information before using data
    * Consider both documentation and product validation
    * Review the specific time periods covered by validation
    * Consult the linked documentation for detailed information
    * Be aware of any partial passes or limitations



__Watch video tutorial__