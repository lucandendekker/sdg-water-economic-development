# Project notes

## Assignment

Build an interactive dashboard around a UN Sustainable Development Goal using real data. The work follows CRISP-DM: business understanding, data understanding, preparation, exploratory analysis, evaluation and publication. The audience includes policymakers, researchers and the public.

## Analytical choices

Safe drinking water is the central indicator. Additional tables provide GDP per capita and universal health coverage, so readers can compare infrastructure access with economic and health-service conditions. Maps show geographic differences; comparison and trend views support exploration by country and year.

The exported measures include selected-year handling and a relative change calculation. That calculation looks for the previous **available** year, which may not be the previous calendar year. Average water access is a simple average over the selected records; it is not automatically a population-weighted African average. Check population-group filters when comparing totals, rural and urban observations.

## Limits to interpretation

- GDP and water observations reach 2024 in the stored model, while health observations end in 2021. Compare aligned periods when drawing conclusions.
- Missing observations and different country coverage can affect aggregate trends.
- Country-level averages can hide substantial local differences.
- A relationship between GDP, water access and health-service coverage does not demonstrate a causal effect.
- The original model labels the health indicator as a health index. Its query imports universal health coverage data; it should not be interpreted as a newly validated general health index.
- The stored water table has an `Indicator` column typed as a date. This is an original preparation issue, not a date series used for the report's year filters. The substantive year column is `Year`.

## Next improvements

Align the time periods and country coverage explicitly, clarify averaging and weighting choices, correct unused metadata types, parameterise source locations, and make missing-data coverage visible to readers. These are potential improvements, not features claimed to be completed in this version.
