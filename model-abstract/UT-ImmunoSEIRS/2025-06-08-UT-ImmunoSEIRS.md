## Summary of results
The national-level projections indicate that vaccination substantially reduces the projected COVID-19 burden over the 2025–2027 projection period. Among the five vaccination scenarios considered, Scenario A (no vaccination recommendation) consistently resulted in the highest projected hospitalizations. Scenarios B and C, representing business-as-usual vaccination coverage with annual and twice-yearly vaccination strategies, respectively, reduced the projected burden relative to no vaccination. The greatest reductions were observed under the optimistic vaccination coverage scenarios (Scenarios D and E), with Scenario E, which includes a second annual dose for high-risk individuals, producing the lowest projected hospitalizations. Overall, the results suggest that increasing vaccine uptake provides the largest reduction in disease burden, while an additional dose for high-risk individuals offers further, although comparatively modest, reductions beyond increased coverage alone.   

## Explanation of observed dynamics given model assumptions
The lower projected hospitalizations in Scenarios D and E are expected because higher vaccination coverage increases vaccine-derived immunity within the population, thereby reducing both susceptibility to infection and the probability of severe disease among infected individuals. The additional vaccination of high-risk individuals in Scenario E further increases protection in the population most likely to experience severe outcomes, resulting in an incremental reduction in projected hospitalizations compared with Scenario D. These differences arise from the combined effects of vaccination, infection driven immunity, waning immunity, immune escape, and seasonal transmission incorporated within the model

## Model assumptions: please describe:
We use a novel stochastic age-structured SEIRS model that explicitly tracks the changes in immunity acquired from natural infection and vaccination. Population-level immunity changes depending on natural infection rates, vaccination rates, and the waning of immunity, and we modulate transmission rates, hospitalization rates, and mortality rates, according to population immunity. The model includes stratification into low- and high-risk populations within each age group, an updated calibration framework with simultaneous estimation of transmission parameters  and seasonality represented using annual and semiannual sinusoidal forcing functions. The updated model explicitly preserves vaccine effectiveness against infection and severe disease throughout the simulation while accounting for waning immunity and immune escape. We fit the model to the hospitalization and death data between October 2024 till May end, 2026, and fit the transmission, hospitalization, and mortality rates to national data. National-level projections were generated under five vaccination scenarios representing varying vaccination coverage levels and recommendations for annual and twice-yearly vaccination among high-risk individuals. The model is stratified according to six age groups. 

### Number/type of immune classes considered
Infection and vaccine derived immunity classes are included in the model. 

### Initial distribution of susceptibility (if available)
Other (NA)

### Initial variant characteristics (transmissibility of variants at t=0, and how uncertainty or non-identifiability was handled)
We parameterized the variant characteristics according to best literature estimates on transmissibility, immune escape, and severity. In case of uncertainty, we have used the estimates which provided the most accurate predictions in our previous projections. 

### Details about calibration of immunity at t=0 (calibration period considered, assumptions about/fitting of past immune escape and waning immunity, is the same calibration process used for all scenarios?)
We obtain the initial immunities attained by variants at time t=0 from the previous COVID-19 season. Immune escape and waning immunity were incorporated continuously throughout the calibration and projection periods.

### Details about modeling of immune escape after t=0 (including how projected immune escape is handled in scenarios, e.g., whether a stepwise or continuous escape was considered and how immune escape affects infection- and vaccine-induced immunity)
Immune escape is modeled as a continuous process that gradually reduces both infection-derived and vaccine-derived immunity over time. The immune escape rate is assumed to remain constant for the circulating variant during the projection period and acts on all immunity classes.

### Assumptions regarding waning immunity against infection and symptoms (including values used for the duration and level of protection against infection or symptomatic disease, whether a point estimate was used or a range, and distribution used)
The model considers exponential decay for the waning of all immunity types. We assume a half-life time for the waning of immunity derived from vaccination equal to 6 months against infection and 12 against severe disease.  The half-life time of the immunity derived from natural infection with all variants is assumed to be 4 months for protection against infection and 8 against severe disease.

### Assumptions regarding waning immunity against severe disease (including whether immunity against severe disease, conditional on infection, is fixed vs declines over time; and if it wanes, specify how)
The model considers exponential decay for the waning of all immunity types. We assume a half-life time for the waning of immunity derived from vaccination equal to 6 months against infection and 12 against severe disease. The half-life time of the immunity derived from natural infection with all variants is assumed to be 4 months for protection against infection and 8 against severe disease.

### Assumptions regarding boosting effect from multiple infections
Natural infection contributes to boosting infection-derived immunity, with immunity increasing following reinfection and subsequently waning over time according to the assumed waning rates.

### Is vaccination assumed to prevent infection and/or transmissibility?
Yes. Vaccination reduces susceptibility to infection through vaccine effectiveness against infection and indirectly reduces transmission by decreasing the number of susceptible individuals who become infected. Vaccination also independently reduces the probability of hospitalization and death among infected individuals through vaccine effectiveness against severe disease.

### How is re-vaccination of individuals handled in scenarios where high-risk individuals can be vaccinated twice a year (eg, is a spring dose only given to individuals who had a prior fall dose)?
High-risk individuals eligible for the second annual vaccination are assumed to receive an additional vaccine dose regardless of whether they received the fall vaccination. The second dose is implemented as an additional increase in vaccine-derived immunity according to the specified coverage for the spring campaign (50% of the first-dose coverage), without requiring prior receipt of the fall dose.

### Are vaccination curves used as provided, or was there any adjustment made?
Yes.

### Was there any adjustment made to scenario specifications beyond vaccine coverage?
No.

### How are projections generated for the retrospective period (June 2025-May 2026)?
The model was first calibrated to observed hospitalization and mortality data from October 26, 2024 through end May, 2026. After the end of May 2026, projections are generated using the calibrated model parameters under each of the five vaccination scenarios. The calibration is based on scenario B. Then all other scenarios use those calibrated parameters in the retrospective period as well. 

### Describe the process used to set or calibrate disease severity, ie P(hosp given current infection) and P(death given current infection) details. What are the datasets used for calibration of the death targets?
Hospitalization and mortality rates were estimated simultaneously during model calibration using least-squares optimization against observed hospitalization and mortality data. In the projection period, we keep the last estimate for both the hospitalization and death rates.

### Describe seasonality implementation, e.g., whether seasonality varies by geography, what is the function used to model seasonal forcing, and which datasets are used to fit seasonal parameters
Seasonality is incorporated using annual and semiannual sinusoidal forcing functions that modulate the transmission rate. The amplitudes of these seasonal components are estimated during model calibration together with the transmission parameters.

### What is the calibration period used to fit the model? How is the period of low reporting in hospitalization data in May-Nov 2024 handled?
The calibration period is between October 26, 2024 to May end, 2026. We did not use the data prior to this period for calibration.  

### Details about modeling of age-specific outcomes, including assumptions on age-specific parameters (e.g., susceptibility, infection hospitalization risk or fatality risk, VE)
We have 6 age groups. The model is age-stratified. We have assumptions pertaining to VE for age specific from literature. The IHR, HDR are initialized studies and later updated by calibrating to fitting to data.  

### Details about modeling of high-risk individuals, e.g., susceptibility and infection hospitalization risk or infection fatality risk, VE
Each age group is subdivided into low-risk and high-risk populations.

### Is empirical data on human mobility or contact patterns used in the model?
No

### Is there a background level of non pharmaceutical interventions?
No

### Is importation from other countries considered?
No

### Other updates in model assumptions from previous rounds (e.g., demographic dynamics)
The updated model explicitly preserves vaccine effectiveness against infection and severe disease throughout the simulation using dynamic vaccine-derived immunity. Additional updates include  seasonality represented using sinusoidal forcing functions.
