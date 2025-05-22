## Summary of results
We observed substantial reduction in both hospitalization and death in scenario B-E, where early vaccination timing for all eligible individuals yielded the most significant reduction of both targets.
There were approximately 20-30% reduction in hospitalization (using sceanrio A as the reference group), and approximately 10%-15% reduction of death. In general, deaths were more challenging to fit and calibrate.
We also observed summer peaks in several states as well as the entire US, although not all states demonstrated the summer wave.

## Explanation of observed dynamics given model assumptions
Early vaccination combined with broader coverage provided the most reduction in both hospitalization and death. 

## Model assumptions: please describe:
### Number/type of immune classes considered
One immune class.

### Initial distribution of susceptibility (if available)
N/A

### Initial variant characteristics (transmissibility of variants at t=0, and how uncertainty or non-identifiability was handled)
N/A

### Details about calibration of immunity at t=0 (calibration period considered, assumptions about/fitting of past immune escape and waning immunity, is the same calibration process used for all scenarios?)
Constant, continuous immune escape and waning was assumed, with 4-6 month uniformally distributed period.

### Details about modeling of immune escape after t=0 (including what is the level of immune escape considered, whether a stepwise or continuous escape was considered and how immune escape affects infection- and vaccine-induced immunity)
Same as calibration period.

### Assumptions regarding waning immunity against infection and symptoms (including values used for the duration and level of protection against infection or symptomatic disease, whether a point estimate was used or a range, and distribution used)
N/A

### Assumptions regarding waning immunity against severe disease (including whether immunity against severe disease, conditional on infection, is fixed vs declines over time; and if it wanes, specify how)
N/A

### Assumptions regarding boosting effect from multiple infections
N/A

### Is vaccination assumed to prevent infection and/or transmissibility?
N/A

### Describe the process used to set or calibrate disease severity, ie P(hosp given current infection) and P(death given current infection) details. What are the datasets used for calibration of the death targets?
N/A

### Describe seasonality implementation, e.g., whether seasonality varies by geography, what is the function used to model seasonal forcing, and which datasets are used to fit seasonal parameters
A comosite seasonality force was imposed: annually, biannually, and monthly. The seasonality varied by state.

### What is the calibration period used to fit the model? How is the period of low reporting in hospitalization data in May-Nov 2024 handled?
Two year period (2023-2025)/
Low reporting in May-Nov 2024 was weighted by the preceding period in 2023.

### Details about modeling of age-specific outcomes, including assumptions on age-specific parameters (e.g., susceptibility, infection hospitalization risk or fatality risk, VE)
Age-specific outcomes were handled directly in the data-driven long short term memory (LSTM) model by different model structures.

### Details about modeling of high-risk individuals, e.g., susceptibility and infection hospitalization risk or infection fatality risk, VE
Implicitly handled in the LSTM model.

### Is empirical data on human mobility or contact patterns used in the model?
No

### Is there a background level of non pharmaceutical interventions?
No

### Is importation from other countries considered?
No

### Other updates in model assumptions from previous rounds (e.g., demographic dynamics, immune escape, severity)
No
