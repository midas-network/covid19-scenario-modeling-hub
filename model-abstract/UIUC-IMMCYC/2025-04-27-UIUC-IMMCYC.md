## Summary of results
The model predicts both a summer and winter wave in most states, with the summer wave being larger than the winter wave. Our model suggests that earlier vaccine timing could have a greater impact on the deaths/hospitalizations averted at the population level and for 65+ compared to expanded vs. restricted eligibility. 

## Explanation of observed dynamics given model assumptions
The timing of summer and winter waves is driven by the seasonal force of infection, while relative wave sizes are driven by immune escape/waning of immunity. 

## Model assumptions: please describe:
### Number/type of immune classes considered
Each age/risk group is split into 5 classes:
(1) Waned/naive
(2) Partial immunity
(3) Partial immunity with immune escape
(4) Boosted
(5) Boosted with immune escape


### Initial distribution of susceptibility (if available)
At the start of calibration on April 2, 2025, we assumed that 10% of the population are waned or naive, 45% of the population are partially immune with immune escape (reflecting those who had been boosted or infected more than 10 months ago, or only one more recent infection), and 45% of the population are boosted without immune escape, reflecting having had a booster or breakthrough infection within the past 10 months. Across these groups, 3% of the population is currently infected. We calibrated from April 2, 2025 to April 26, 2025 and used susceptibility distributions at the end of calibration for the start of the projection period.  

### Initial variant characteristics (transmissibility of variants at t=0, and how uncertainty or non-identifiability was handled)
We do not model discrete variants but instead fit a baseline seasonal force of infection. During calibration, immune escape is modeled by moving individuals from boosted or partial immunity compartments to "boosted with immune escape" or "partial with immune escape" at a rate 1/365 days, with a point estimate of 35% reduction in protection. During the projection period, the estimate of reduction in protection is drawn from a distribution of 20-50%. 

### Details about calibration of immunity at t=0 (calibration period considered, assumptions about/fitting of past immune escape and waning immunity, is the same calibration process used for all scenarios?)
The same assumptions on past immune escape (35% reduction in protection against infection over 1/365 days) and waning immunity (1/10 months) are used during the calibration period (April 2, 2024 - April 26,2025) for all scenarios. The distribution of immunity at the end of the calibration period is used at the start of the projection period.

### Details about modeling of immune escape after t=0 (including what is the level of immune escape considered, whether a stepwise or continuous escape was considered and how immune escape affects infection- and vaccine-induced immunity)
Immune escape during calibration and projection periods is stepwise, moving individuals from "boosted" to "boosted with immune escape" or "partial" to "partial with immune escape" at a rate of 1/365 days. The corresponding reduction in protection against infection is a point estimate of 35% during the calibration period, and is drawn from a distribution of 20-50% during the projection period (with paired runs). We do not include a reduction in protection against severe disease. 

### Assumptions regarding waning immunity against infection and symptoms (including values used for the duration and level of protection against infection or symptomatic disease, whether a point estimate was used or a range, and distribution used)
Boosted individuals move to the partial immunity compartment at a rate 1/10 months with baseline protection against infection waning from 50% to 25%. Individuals in the partial immunity compartment move to waned at a rate 1/10 months, with full loss of protection against infection. 

### Assumptions regarding waning immunity against severe disease (including whether immunity against severe disease, conditional on infection, is fixed vs declines over time; and if it wanes, specify how)
Individuals move from the boosted to partial immunity compartments at a rate 1/10 months, with a change from 90% to 80% protection against severe disease conferred by vaccination. Individuals move from the partial immunity to waned/naive compartment at a rate 1/10 months with full loss of protection against severe disease. 

### Assumptions regarding boosting effect from multiple infections
One infection moves individuals from the waned compartment to the partial immunity compartment, and if infected again before waning of this immunity, individuals move to the boosted compartment. 

### Is vaccination assumed to prevent infection and/or transmissibility?
Recent vaccination is assumed to reduce infection risk by 50%, but not reduce transmissibility. 

### Describe the process used to set or calibrate disease severity, ie P(hosp given current infection) and P(death given current infection) details. What are the datasets used for calibration of the death targets?
SMH-provided deaths and hospitalizations (included inferred) are used to calibrate the risk of death given hospitalization irrespective of age. The baseline infection hospitalization rate is assumed to be 0.225% for low-risk adults, based on the midpoint of latest adult IHRs reported by Ward et al., Nature Communications, 2024. Scalars on this rate are calibrated for children and 65+. 

### Describe seasonality implementation, e.g., whether seasonality varies by geography, what is the function used to model seasonal forcing, and which datasets are used to fit seasonal parameters
Seasonal force of infection is calibrated for each state using a cyclic cubic spline basis, with parameters updated every 2 months. Hospitalizations (including inferred) and deaths for the past year were used for calibration. 

### What is the calibration period used to fit the model? How is the period of low reporting in hospitalization data in May-Nov 2024 handled?
Calibration is from April 2, 2024 to April 26, 2025. We fit to both reported and inferred hospitalizations across age groups throughout the calibration period to handle the period of low reporting from May-Nov 2024.

### Details about modeling of age-specific outcomes, including assumptions on age-specific parameters (e.g., susceptibility, infection hospitalization risk or fatality risk, VE)
Differences in susceptibility to infection are considered only in contact structure, with older adults assumed to have half of the contacts of younger adults and children. For each state, distinct infection hospitalization risks of children and 65+ are calibrated relative to the adult, low-risk IHR. One hospitalization fatality risk is calibrated for all age groups, on a state-by-state basis. 

### Details about modeling of high-risk individuals, e.g., susceptibility and infection hospitalization risk or infection fatality risk, VE
Based on the SMH-provided population data, we assume high-risk individuals account for 13% of the population, and these individuals have 4.5x risk of hospitalization given infection based on the adjusted RR for those with 2 underlying conditions reported by Ko et al., Clinical Infectious Diseases, 2021. Differences in susceptibility to infection, and in hospitalization fatality rate, are not considered. 

### Is empirical data on human mobility or contact patterns used in the model?
Relative contact rates between age groups were broadly informed by wave 4 contacts reported in the Berkeley Interpersonal Contact Survey (Feehan & Mahmud, Nature communications, 2021).

### Is there a background level of non pharmaceutical interventions?
No.

### Is importation from other countries considered?
No.

### Other updates in model assumptions from previous rounds (e.g., demographic dynamics, immune escape, severity)
N/A
