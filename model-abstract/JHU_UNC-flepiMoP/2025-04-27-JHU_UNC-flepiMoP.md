## Summary of results
Differences across scenarios are mainly driven by the scenarios that determine which populations should receive vaccine recommendations - with the vaccine recommendation of vaccinating all eligible groups leading to a higher number of hospitalizations averted as compared to the recommendation of only vaccinating high risk individuals. Early vaccination scenarios led to more averted hospitalizations at the country-level and for most states as compared to the scenarios with the classic vaccination timing, however, for some states we found the opposite. Our model suggests the presence of a summer and winter peak in the following season. 

## Explanation of observed dynamics given model assumptions
Dynamics are largely driven by a combination of immune escape which defines the level of protection of the vaccine over time, waning, and seasonality. This, complex combination of effects generates projections with a high likelihood of a summer peak in addition to the winter peak.

## Model assumptions: please describe:
### Number/type of immune classes considered
We model immune classes as a ladder of immune protection, where a level 10 protection is fully protected from infection (directly following infection), and level 0 corresponds to full susceptibility. People move down this ladder due to waning and drift, and up the ladder following vaccination and infection. 

### Initial distribution of susceptibility (if available)
The initial distribution of the SEIR compartments at the start date of calibration for this round is sampled from the final fit from Round 18.

### Initial variant characteristics (transmissibility of variants at t=0, and how uncertainty or non-identifiability was handled)
Variants are not directly modelled, but instead a constant rate of immune escape. Initial transmissibility is fit from prior rounds (uncertainty is inherent in these prior fits).

### Details about calibration of immunity at t=0 (calibration period considered, assumptions about/fitting of past immune escape and waning immunity, is the same calibration process used for all scenarios?)
Initial immunity is fit from prior rounds. Calibration for this round was specifically for the time period from April 2023 - April 2025, using scenario D as the calibration scenario (vaccinating everyone with classic timing), following the recommendations of the previous years. Waning of immunity is fit from prior rounds. This calibration was then used to project all other scenarios.

### Details about modeling of immune escape after t=0 (including what is the level of immune escape considered, whether a stepwise or continuous escape was considered and how immune escape affects infection- and vaccine-induced immunity)
A continuous escape is considered. We assume that drift from the vaccine strain follows the provided rate of immune escape (35%) and determines how much protection is provided from the vaccine, and also defines the rate of waning down the immune ladder. 

### Assumptions regarding waning immunity against infection and symptoms (including values used for the duration and level of protection against infection or symptomatic disease, whether a point estimate was used or a range, and distribution used)
In our model structure we do not distinguish between natural or vaccine-induced immunity. Initial VE (at the time of the release of the vaccine) against infection of 45%. The duration of protection is driven by rate of waning with prior of 10 months and is inferred.

### Assumptions regarding waning immunity against severe disease (including whether immunity against severe disease, conditional on infection, is fixed vs declines over time; and if it wanes, specify how)
We only model protection against infection which indirectly leads to protection against severe disease. As mentioned previously, this immunity wanes, as individuals in our model structure move down levels of immune protection due to waning and drift.

### Assumptions regarding boosting effect from multiple infections
None. 

### Is vaccination assumed to prevent infection and/or transmissibility?
Infection only. 

### Describe the process used to set or calibrate disease severity, ie P(hosp given current infection) and P(death given current infection) details. What are the datasets used for calibration of the death targets?
Disease severity estimates are based on age-specific outcome probabilities derived from serological studies during the pandemic, as well as vaccination effectiveness studies, which provide adjustments to these outcome probabilities for each vaccination. These outcome probabilities are applied to the population distributions of each state and the age groups of the model to scale outcomes based on state demography. As outcome probability has reduced over time, we also apply a adjustment parameters that are fit by state for both IFR and IHR at various time periods. These outcome adjustment scalers shift all outcome probabilities up or down across age groups for each jurisdiction. For Round 19, we fit outcome scalers for both 2023-24 and 2024-25 seasons, using the 2024-25 scaler for the 2025-26 season. Finally, to calibrate to changes in the severity ratios between ages, we calculated an age-specific hospitalization adjustment ratio comparing the empirical hospitalizations by age to our modeled estimates for the period of October 2024 - April 2025, during which age-specific hospitalization data are available. We assumed probability of infection does not change by age-group, other than that which would be changing based on vaccination differences. These adjustment ratios were then applied to the age-specific IHRs and IFRs, and the model was run again with these new inputs.

### Describe seasonality implementation, e.g., whether seasonality varies by geography, what is the function used to model seasonal forcing, and which datasets are used to fit seasonal parameters
Seasonality is inferred from the start of the pandemic. They are state-specific monthly terms (with a rolling mean applied) that adjust transmissibility.

### What is the calibration period used to fit the model? How is the period of low reporting in hospitalization data in May-Nov 2024 handled?
We calibrated from 2023-04-07 to 2025-04-26 and fit the model to both hospitalizations (NHSN dataset) and deaths (NCHS dataset). We did not adjust the underreported hospitalization data between May-Nov 2024 and used the SMH provided target data as provided.

### Details about modeling of age-specific outcomes, including assumptions on age-specific parameters (e.g., susceptibility, infection hospitalization risk or fatality risk, VE)
IFR and IHR are age-specific (0-17, 18-64, 65+). 

### Details about modeling of high-risk individuals, e.g., susceptibility and infection hospitalization risk or infection fatality risk, VE
We divide the 18-64 age group into low-risk and high-risk individuals, with differential IHR (high risk 4.3 times higher) and IFR (high risk 9.3 times higher). 

### Is empirical data on human mobility or contact patterns used in the model?
None.

### Is there a background level of non pharmaceutical interventions?
None.

### Is importation from other countries considered?
None. 

### Other updates in model assumptions from previous rounds (e.g., demographic dynamics, immune escape, severity)
None. 
