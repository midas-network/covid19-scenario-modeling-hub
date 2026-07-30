## Summary of results
Backward projections were the same across all scenarios through February 2026 with the same observed vaccination data. Forward projections from June 2026 to June 2027 showed a large peak in fall and winter 2026, followed by a smaller peak in late winter or early spring 2027. Differences in the projected peak were mainly due to uncertainty about the emergence of zero to four future variants, together with differences among the vaccination scenarios. Across the full 105-week retrospective and forecast period from June 8, 2025, to June 5, 2027, cumulative burden decreased from Scenario A to Scenario E, with Scenario A producing the highest burden and Scenario E the lowest. Compared with Scenario A, Scenario B averted a median of 45,827 cumulative hospitalizations (8.45%), Scenario C averted 56,684 (10.45%), Scenario D averted 90,285 (16.64%), and Scenario E averted 118,993 (21.93%). Deaths followed the same pattern. Compared with Scenario A, Scenario B averted a median of 2,206 deaths (8.17%), Scenario C averted 2,744 (10.17%), Scenario D averted 4,390 (16.26%), and Scenario E averted 5,797 (21.47%).

## Explanation of observed dynamics given model assumptions
The retrospective fit tracks NHSN hospitalizations closely with humidity-driven seasonality. Immune escape and variant-period changes were introduced as fixed changes at each variant crossover date, so the amplitude and timing of the projected fall/winter 2026-27 peak are governed mainly by two factors: the proportion of the population whose immunity has partly waned toward full susceptibility by the time a new variant becomes dominant, and the level of immune escape associated with that variant. 
The (K=1–5) ensembles represent scenarios with zero to four new variants emerging during the projection period. Each simulated trajectory includes a different number of future variant crossovers and different levels of immune escape. As a result, uncertainty about future variant emergence is combined with uncertainty in the model parameters and residual bootstrap samples.
The ordering of the vaccination scenarios results directly from differences in vaccination coverage. All natural history, transmission, and severity parameters are shared across Scenarios A–E. Higher and earlier vaccination coverage in the later-lettered scenarios increases the protected population before the fall 2026 variant crossover and reduces the projected peak. Death curves track the hospitalization curves closely in shape with the same underlying hospitalization flow through a shared HDR.

## Model assumptions: please describe:
### Number/type of immune classes considered
The model includes immune classes defined by risk group (HIGH/LOW) and the lineage associated with the most recent immunity (A/B, relabeled at each variant-epoch boundary). Within each risk group, individuals are classified as fully susceptible, vaccinated without prior infection, fully protected, partially waned but still protected, or partially susceptible to immune escape.

### Initial distribution of susceptibility (if available)
Initial conditions on June 8, 2025, were estimated from simulations fitted to hospitalization data from the previous year. The population was divided into high- and low-risk groups using population proportions of 31.3% and 68.7%, respectively.

### Initial variant characteristics (transmissibility of variants at t=0, and how uncertainty or non-identifiability was handled)
Transmissibility differences between the three historical/near-term lineages (LP.8.1 -> XFG -> XFG.1.1) are captured entirely through each lineage's point-estimate immune-escape value (LP.8.1 = 0.50, XFG = XFG.1.1 = 0.615), which enters the susceptibility multipliers. Escape uncertainty for these three lineages is not propagated as a range in production runs. For hypothetical future variants beyond XFG.1.1 (the K=2-5 crossover events), the number and timing of variant emergences during the projection period were based on the historical pattern observed from 2021 to 2026. Uncertainty in immune escape was included by allowing each simulated trajectory to draw a separate escape value for each crossover from a Beta(0.6265, 0.4521) distribution.

### Details about calibration of immunity at t=0 (calibration period considered, assumptions about/fitting of past immune escape and waning immunity, is the same calibration process used for all scenarios?)
The model was calibrated to national weekly incident hospitalizations from June 8, 2025, to June 6, 2026, using vaccination coverage from Scenario A. Initial immunity (initial waned-protected and partially susceptible populations) was estimated jointly with beta by differential evolution. The same calibrated parameter set was used for all five vaccination scenarios. Only the vaccination coverage input differed across Scenarios A–E.

### Details about modeling of immune escape after t=0 (including what is the level of immune escape considered, whether a stepwise or continuous escape was considered and how immune escape affects infection- and vaccine-induced immunity)
Immune escape was modeled as a stepwise process rather than a continuous change over time. Each variant period was assigned a fixed immune-escape value, which changed only at the date when a new variant became dominant. Immune escape affected vaccine- and infection-derived protection in the same way by increasing susceptibility according to (1- (1-escape) 𝜀1), where 𝜀1 is the VE against infection.
Fixed values were used for historical and near-term variants: 0.50 for LP.8.1 and 0.615 for XFG and XFG.1.1. For hypothetical future variants, we project the variant emerging during the projection period based on the historical distribution from 2021 to 2026. An escape value was drawn for each simulated variant crossover from a beta distribution. At each crossover, immune-history compartments were relabeled for the new variant period, so the model retained the most recent immune background but did not track the full sequence of prior variant exposures.

### Assumptions regarding waning immunity against infection and symptoms (including values used for the duration and level of protection against infection or symptomatic disease, whether a point estimate was used or a range, and distribution used)
Waning immunity against infection was modeled using a two-stage process with fixed parameter values. Individuals remained fully protected for an average of approximately 88 days before immunity began to wane. At that point, 10% moved directly into a partially susceptible state that was vulnerable to immune escape, while the remaining 90% entered a still-protected state. Individuals in the still-protected state had reduced susceptibility based on risk-group-specific protection levels of 0.40 for the high-risk group and 0.48 for the low-risk group. This protection then waned to full susceptibility over an average of 180 days.
All waning durations and protection levels were treated as fixed point estimates and were not resampled across stochastic simulations. The model did not distinguish protection against infection from protection against symptomatic disease; the protection parameter reduced the risk of acquiring infection directly.

### Assumptions regarding waning immunity against severe disease (including whether immunity against severe disease, conditional on infection, is fixed vs declines over time; and if it wanes, specify how)
Protection against severe disease, conditional on infection, was assumed to remain constant over time. A fixed value of (𝜀2=0.55) was applied to all breakthrough infections arising from prior vaccination or infection, reducing the infection hospitalization ratio to (IHR*(1-𝜀_2)). This value was shared across risk groups and was not recalibrated during model fitting. The model did not include a separate waning process for protection against severe disease; the same level of protection was maintained as long as an individual remained in an immune-background state.

### Assumptions regarding boosting effect from multiple infections
Not modeled. After any infection, including primary, breakthrough, or reinfection, individuals entered the same recovered compartment and restarted the same two-stage waning process. The model did not include separate states for multiple prior infections or any cumulative change in the strength or breadth of immune protection.

### Is vaccination assumed to prevent infection and/or transmissibility?
Vaccination was assumed to reduce the risk of infection and the risk of severe disease. Vaccine protection against infection was modified by the immune-escape level of the circulating variant. Vaccination was not assumed to reduce infectiousness after infection; vaccinated and unvaccinated infected individuals contributed equally to transmission.

### How is re-vaccination of individuals handled in scenarios where high-risk individuals can be vaccinated twice a year (eg, is a spring dose only given to individuals who had a prior fall dose)?
Revaccination eligibility was not modeled explicitly within the epidemic model. Instead, the model used the cumulative vaccination coverage specified for each RD20 scenario and calculated the number of new doses from weekly changes in coverage. Any rules for repeat vaccination, such as limiting a spring dose to individuals who received a prior fall dose or to high-risk groups, were assumed to be included when the scenario-specific coverage curves were developed.
When a reported coverage series dropped to less than half of its previous value, the model treated this as the start of a new vaccination campaign. An offset was then applied so that doses from the new campaign were added to the cumulative total rather than interpreted as a decrease in the vaccinated population.

### Are vaccination curves used as provided, or was there any adjustment made?
The scenario-specific vaccination coverage curves were used as provided, with data reported for the same week aggregated before analysis.

### Was there any adjustment made to scenario specifications beyond vaccine coverage?
No. All five vaccination scenarios (A-E) share the identical calibrated natural-history/transmission/severity parameter set and the identical structural variant-uncertainty layer; only the vaccination coverage input differs across A-E.

### How are projections generated for the retrospective period (June 2025-May 2026)?
Retrospective projections from June 2025 to May 2026 were generated by running the calibrated deterministic model forward from the initial conditions. The model used the observed historical variant distribution and the corresponding RD20 vaccination coverage. The same fitted transmission, immunity, hospitalization, and mortality parameters were used throughout the period. Uncertainty was included by resampling the transmission parameter and adding residual-bootstrap variation based on the calibration period. A total of 300 trajectories were generated for each vaccination scenario. Each retrospective trajectory was paired with its corresponding forward projection to form one continuous simulated path.

### Describe the process used to set or calibrate disease severity, ie P(hosp given current infection) and P(death given current infection) details. What are the datasets used for calibration of the death targets?

The probability of hospitalization given infection was defined separately for high- and low-risk groups. Base infection hospitalization ratios of 0.012 and 0.0025, respectively, were selected to produce approximately 65% of hospitalizations among high-risk individuals, consistent with CDC COVID-NET data.
The model did not include a direct probability of death given infection. Deaths occurred only among hospitalized individuals through the hospitalization fatality ratio. This ratio was estimated separately by nonlinear least squares using national weekly incident death data over the same calibration period, while all other parameters were held fixed.

### Describe seasonality implementation, e.g., whether seasonality varies by geography, what is the function used to model seasonal forcing, and which datasets are used to fit seasonal parameters
Seasonality is a single national-scale multiplicative factor on beta, following the Shaman-Kohn (2009) exponential absolute-humidity form: beta_eff(t) = beta_t * exp(-alpha * AH(t)) / baseline_mean_exp, where AH(t) is a population-weighted daily national absolute-humidity series (NOAA-derived, CONUS states excluding AK/HI), and baseline_mean_exp = mean(exp(-alpha*AH)) over the fit window normalizes the average factor to 1.0 during calibration. The humidity sensitivity alpha was estimated jointly with the other model parameters by fitting the model to national weekly hospitalization data. For forecast dates beyond the observed humidity data, absolute humidity was estimated using the average value for each calendar day across all available years.

### What is the calibration period used to fit the model? Are there any adjustments made to the reported NHSN hospitalization data?
The calibration window is 2025-06-08 through 2026-06-06, fit against Scenario A's vaccination curve only. The hospitalization and death target series are from the R20 weekly hospitalization/death dataset.

### Details about modeling of age-specific outcomes, including assumptions on age-specific parameters (e.g., susceptibility, infection hospitalization risk or fatality risk, VE)
The model does not include direct age stratification, only HIGH/LOW risk group definition. This yields HIGH ≈31.3% and LOW ≈68.7% of the US population. 

### Details about modeling of high-risk individuals, e.g., susceptibility and infection hospitalization risk or infection fatality risk, VE
Within this two-group stratification, VE against infection (epsilon1: 0.40 HIGH vs. 0.48 LOW) and IHR (0.012 HIGH vs. 0.0025 LOW) are group-specific. VE against hospitalization (epsilon2), HDR, and all disease-progression rates are shared across groups. Vaccination dose allocation between HIGH and LOW uses the actual RD20 coverage curves, independently tracking the risk groups making up HIGH versus LOW before aggregating.

### Is empirical data on human mobility or contact patterns used in the model?
No. The force of infection assumes homogeneous mixing between the HIGH and LOW risk groups (both groups experience the same force of infection computed from the pooled infectious total over total population), with no contact matrix or empirical mobility data informing differential mixing rates.

### Is there a background level of non pharmaceutical interventions?
No. There is no explicit NPI term or compartment in the model.

### Is importation from other countries considered?
No. There is no explicit case-importation term in the model.

### Other updates in model assumptions from previous rounds (e.g., demographic dynamics, immune escape, severity)
NA

