# COVID-19 Scenario Modeling Hub

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6584489.svg)](https://doi.org/10.5281/zenodo.6584489)

Last updated: 2026-06-04 for **Round 20 Scenarios**.

## Previous Round Scenarios and Results:

<https://covid19scenariomodelinghub.org/viz.html>

Previous rounds (round 1 to round 18) are available in the 
[COVID-19 Scenario Modeling Hub - Archive](https://github.com/midas-network/covid19-scenario-modeling-hub_archive) 
GitHub Repository


## Rationale

Even the best models of emerging infections struggle to give accurate
forecasts at time scales greater than 3-4 weeks due to unpredictable
drivers such as a changing policy environment, behavior change, the
development of new control measures, and stochastic events. However,
policy decisions around the course of emerging infections often require
projections in the time frame of months. The goal of long-term
projections is to compare outbreak trajectories under different
scenarios, as opposed to offering a specific, unconditional estimate of
what "will" happen. As such, long-term projections can guide longer-term
decision-making while short-term forecasts are more useful for
situational awareness and guiding immediate response. The need for
long-term epidemic projections is particularly acute in a severe
pandemic, such as COVID-19, that has a large impact on the economy; for
instance, economic and budget projections require estimates of outbreak
trajectories in the 3-6 month time scale.

From weather to infectious diseases, it has been shown that synergizing
results from multiple models gives more reliable projections than any
one model alone. In the COVID-19 pandemic this approach has been
exemplified by the [COVID-19 Forecast
Hub](https://covid19forecasthub.org/), which combines the results of
over 30 models (see a
[report](https://www.medrxiv.org/content/10.1101/2020.08.19.20177493v1)
on the first wave of the pandemic). Further, a
[comparison](https://www.medrxiv.org/content/10.1101/2020.11.03.20225409v1)
of the impact of interventions across 17 models has illustrated how any
individual model can grossly underestimate uncertainty, while ensemble
projections can offer robust projections of COVID-19 the course of the
epidemic under different scenarios at a 6-month time scale.

The [COVID-19 Forecasting Hub](https://covid19forecasthub.org/) provides
useful and accurate short-term forecasts, but there remains a lack of
publicly available model projections at 3-6 month time scale. Some
single models are available online (e.g.,
[IHME](https://covid19.healthdata.org/united-states-of-america), or
[Imperial College](https://www.imperial.ac.uk/mrc-global-infectious-disease-analysis/covid-19/report-33-vaccine/)),
but a decade of infectious disease forecasts has demonstrated that
projections from a single model are particularly risky. Single model
projections are particularly problematic for emerging infections where
there is much uncertainty about basic epidemiological parameters (such
as the waning of immunity), the transmission process, future policies,
the impact of interventions, and how the population may react to the
outbreak and associated interventions. There is a need for generating
long-term COVID-19 projections combining insights from different models
and making them available to decision-makers, public health experts, and
the general public. We plan to fill this gap by building a public
COVID-19 Scenario Hub to harmonize scenario projections in the United
States.

We have specified a set of scenarios and target outcomes to allow
alignment of model projections for collective insights. Scenarios have
been designed in consultation with academic modeling teams and
government agencies (e.g., CDC).

This repository follows the guidelines and standards outlined by the 
[hubverse](https://hubverse.io), which provides a set of data formats
and open source tools for modeling hubs.

## How to participate

The COVID-19 Scenario Modeling Hub is be open to any team willing to
provide projections at the right temporal and spatial scales, with
minimal gatekeeping. We only require that participating teams share
point estimates and uncertainty bounds, along with a short model
description and answers to a list of key questions about design. A major
output of the projection hub would be ensemble estimates of epidemic
outcomes (e.g., cases, hospitalization and/or deaths), for different
time points, intervention scenarios, and US jurisdictions.

Those interested to participate, please read the README file and email
us at
[scenariohub\@midasnetwork.us](mailto:scenariohub@midasnetwork.us).

Model projections should be submitted via pull request to the
data-processed folder of this GitHub repository. Technical instructions
for submission and required file formats can be found
[here](./model-output/README.md).


## Round 20 Scenarios


The COVID-19 Scenario Projections for the 2026-27 Season (COVID-19 Round 20) of 
the US Scenario Modeling Hub (SMH) focuses on the impact of the frequency of 
COVID-19 boosters for high-risk groups and vaccination coverage. With this round, 
SMH aims to provide insight into the impact of continued recommendations that high 
risk populations receive a booster twice per year, one prior to the summer wave of 
COVID-19, and one prior to the winter wave. This round also aims to assess the 
impact of current vaccination coverage as compared to either no vaccination or 
increased coverage levels. The projection period for Round 20 spans two years, 
from Sunday, June 8, 2025, to Saturday, June 5, 2027, including one retrospective 
year and one prospective year. We are particularly interested in how the different 
scenarios affect the size of the summer 2026  COVID-19 wave, and that of the 
following wave in winter 2026-27.

![](./auxiliary-data/rounds/round20_viz/covid19_round20.png)

#### **Projection Period**

In this round, the projection period includes both a retrospective and a prospective 
component, spanning June 2025 to June 2027. This design is motivated by Scenarios C–E, 
which include a Spring 2026 vaccination campaign. To assess the potential impact of 
this campaign on a Summer 2026 COVID-19 wave, projections must begin before Spring 2026.


As in previous rounds, teams may use all available data up to the present (June 2026 at 
the time of writing) for model calibration. Consequently, the first year of the projection 
period (June 2025–June 2026) should be interpreted as a retrospective counterfactual 
under the specified scenario assumptions, while the second year (June 2026–June 2027) 
represents prospective projections.


This approach allows us to evaluate the potential impact of alternative vaccination 
strategies on an upcoming summer wave while keeping forward projections anchored to 
recent observations and limiting the prospective projection horizon to one year.


#### **Vaccine Effectiveness**

In all scenarios, boosters are expected to match the predominant variants 
circulating on June 31, 2026.  **Teams should use VE against COVID-19 
hospitalization = 55% at the start of the vaccination campaign (August 13, 
2025 for the 2025-26 and August 14, 2026 for the 2026-27 seasons)**, in line 
with recent analyses of hospitalizations during September-December 2025 (55% among 
[US veterans](https://www.medrxiv.org/content/10.64898/2026.01.22.26344618v1), 
53% among [Canadian seniors](https://www.eurosurveillance.org/content/10.2807/1560-7917.ES.2026.31.18.2600331), 
59% among [Europeans seniors](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6379099)). 
We note that in these studies, VE waning over time was not deeply studied as 
these were early season analyses. Further, these studies were primarily focused 
on individuals 65+ yo but it is generally accepted that COVID-19 VE does not depend 
on age (see the Canadian study for age breakdowns). We recommend using the same VE 
across all population groups considered in Round 20.
 

This VE is equivalent to a vaccine trial that would be performed at the start of 
the vaccination campaign in populations with varying levels of prior immunity at 
trial enrollment. Vaccinated individuals would have a 55% reduced risk of 
hospitalization compared to unvaccinated individuals on average in this trial, 
if VE was estimated a few days after the start of the campaign. Importantly, this 
stated hospitalization reduction includes the combined effects of protection 
against infection and protection against hospitalization given (breakthrough) 
infection. This is the same logic we used in Round 19. Based on available evidence, 
we suggest that teams choose VE against **infection** in the range 35-57% at 
the start of the vaccination campaign (see 
[VE estimates](https://docs.google.com/document/d/1H-6Q9dIDjLCubU-oRAoVHyw7Lr-rlb_D_zp31hNyMGw/edit) 
for detailed studies).


Two mechanisms will result in an effective decrease from the stated VE of 55% against 
hospitalization at the start of the vaccination campaign.  The first mechanism is 
immune escape, with circulating strains moving gradually away from the vaccine. For 
instance, someone vaccinated in January 2027 may not benefit from a 55% VE, because 
the circulating strain has moved further away from the vaccine strain, compared to 
when VE was measured at 55% in mid-August. The effective VE in January 2027 for a 
newly vaccinated person would be lower or equal to 55%, depending on immune escape 
assumptions. In this round, immune escape against infection and severe disease is at 
teams’ discretion (we return to this later).


The second mechanism is waning of immunity due to decline in immune responses over time. 
This applies to both protection against infection and severity given infection. 
Parameters for waning immunity against infection are left at teams discretion, although we 
suggest a 3-10 month waning time, with 40-60% reduction against baseline protection levels 
in waned state. Waning of vaccine-induced immunity against severe disease remains at teams 
discretion (but if present should wane at slower timescale than against infection).


Lastly we note that waning immunity mechanisms apply in similar ways to vaccine-induced and 
infection-induced protection.


#### **Vaccine Frequency (see schematic of vaccine campaigns below)**


![](./auxiliary-data/rounds/round20_viz/covid19_rnd20_vaccination_timing.png)


In this round, we consider two different frequencies of vaccination. Scenarios B and D 
correspond to a “classic” frequency of annual vaccination campaigns starting in mid August 
of each year. This is the timing that was observed in the 2025-26 season and which is 
expected to operate in the 2026-27 season. We also consider hypothetical scenarios C and E, 
where a second vaccine opportunity is offered to high risk individuals (those 65+ and adults 
with chronic conditions), in light of the substantial COVID-19 activity in recent summers. 
This second opportunity starts in mid February 2026, with a pace of ramp up similar to that 
of the main annual campaign but saturating at only half of the main campaign. These are fully 
counterfactual scenarios since this second vaccination opportunity has not actually occurred in 
2026 (at least not at the levels considered here).


**Only high-risk individuals can benefit from the additional opportunity modeled in 
scenarios C and E, with only (half of the) individuals already vaccinated during the main 
campaign receiving a second dose. Further, we assume that the vaccine is only reformulated once 
a year in June, so that the second-dose opportunity starting in mid-February 2026 will have 
reduced effective VE due immune escape** (the exact VE reduction is at teams’ discretion). 
These hypothetical scenarios may be useful to project the potential value of additional 
vaccination campaigns in future COVID-19 seasons, in light of substantial summer waves of 
COVID-19 observed in recent years and lack of second dose vaccination in reported data. 
Vaccine coverage curves will be provided for all scenarios and will reflect the stipulated 
timing and frequency of vaccination in each scenario. 


Modeling of the second dose is left at the discretion of each team. While we expect that 
the risk of getting vaccinated in the Spring campaign is correlated to the propensity to 
get vaccinated in the Fall campaign, limited data are available. Teams can choose to model 
correlated outcomes or not. Details of the second dose implementation should be provided 
in the Appendix.


#### **Vaccination Coverage**

Vaccine coverage curves are available in the 
[auxiliary-data/vaccination-coverage](./auxiliary-data/vaccination-coverage) folder
for all scenarios and will be extrapolated from the 
[2025-26 data](https://www.cdc.gov/covidvaxview/weekly-dashboard/adult-vaccination-coverage.html).

In all 5 scenarios A-E, the COVID-19 vaccination campaign in 2025-26 operates as 
observed, with vaccination starting in mid Aug 2025 and ending in mid Feb 2026. 
In counterfactual scenario A, no further vaccination is implemented after mid Feb 2026.


Vaccination recommended annually for all currently eligible groups (scenarios B & D): 
Prospective uptake of annual boosters in 2026-27 in all population groups follows either 
the uptake observed for the booster dose during the 2025-26 seasons (Scenario B) or an 
aspirational uptake based on the 2024-25 flu vaccine (Scenario D; the 2024-25 season 
is used for reference due to availability of data). In scenarios B & D, the campaign 
ollows the usual timing, from mid August 2026 to mid Feb 2027. The fall vaccine has 
been reformulated to be matched to strains circulating in June 2026.


Vaccination recommended twice a year for high risk groups and annually for all other 
eligible groups (scenarios C & E). Scenarios C and E follow scenarios B and D, with 
the addition of a spring 2026 campaign focused on high risk individuals. The spring 
campaign starts in mid Feb 2026 and runs through mid Aug 2026. Only high risk groups 
are targeted, and low risk group do not receive any vaccination in the spring. 
Coverage in the spring campaign is half that of the 2026-2027 fall. The vaccine 
formulation is the same as that from the prior season.


In this round, we assume that high-risk populations, of any age, are included in booster 
recommendations in *scenarios B, C, D & E*. We define high-risk groups as those with 
underlying conditions putting them at increased risk of severe outcomes from COVID-19. 
Data on the population size and vaccine coverage of high and low risk groups is provided by 
state and age in GitHub. Teams can choose to adjust VE for high-risk and low-risk groups 
based on available evidence, although the population-level average VE against hospitalization 
should equal 55% on August 15, 2026. Data on increased risk of COVID-19 hospitalization from 
high risk groups can be found 
[here](https://academic.oup.com/cid/article/72/11/e695/5908300). If teams wish to adjust VE 
based on specific risk conditions, they can refer to data on VE in immunocompromised 
populations [here](https://www.cdc.gov/acip/downloads/slides-2024-10-23-24/04-COVID-Link-Gelles-508.pdf).



#### **Immune Escape**

SARS-CoV-2 immune escape away from existing immunity should proceed at a constant rate 
throughout the year, aligned with the diversity of strains that is now circulating in 
the population. The rate of immune escape is left at teams discretion but, in following 
recent prior rounds, we suggest that it should be bounded by 20-50% per year. 


Immune escape will affect protection conferred by natural infection and vaccination. 
For instance, let’s assume that immune escape is 20%. Now, assume an individual is infected 
on June 16, 2026 and this infection confers X% protection against symptoms, compared to an 
individual who has not been recently infected. If this individual was instantaneously 
transported a year later, on June 15, 2026, with their antibodies from the 2025 infection 
intact, this individual's protection against variants circulating on June 15, 2026 would 
be X\*0.8 (20% immune escape). In this thought experiment, the decay of protection would 
solely be due to the effects of immune escape. In reality, moving away from the thought 
experiment, if this individual actually lived throughout an entire year without a new 
infection between June 2025 and June 2026, then their effective immunity on June 15, 2026 
will be the combined effects of antibody waning (at a rate and plateau left at teams’ 
discretion)  and immune escape (at teams discretion as well). 


Teams should note that the impact of immune escape is separate from the impact of waning 
immunity (especially because the impact of immune escape affects infection and vaccination 
differently), although these processes may be implemented similarly in models. 

It is left to the teams’ discretion how to implement immune escape in their models. 
Teams may choose to sample over a range of immune escape values that is based on 
plausibility (for instance, within 20-50% per year), or informed by calibration to 
epidemiological or strain cycling data. Teams may choose to implement gradual escape 
of existing variants, or they can choose to introduce new discrete variants with levels 
of immune escape consistent with the epidemiology of SARS-CoV-2 in the past year, so 
long as these occur frequently.


#### Waning of Immunity


Teams must incorporate waning of immunity against infection. The median waning time 
of protection against infection should range between 3-10 months (this should not be 
read to mean that waning is to complete loss of protection, see below). Teams can 
sample this range, or use any value within this range as a point estimate. Teams can 
consider differences in waning of natural and vaccine-induced immunity, or in waning 
after Omicron infection vs waning from other types of SARS-CoV-2 exposures; however 
the median waning time should remain within the 3-10 month range.


The rate and levels of waning are left to the best scientific discretion of the 
teams. We recommend that in the waned classes, teams consider a reduction from 
baseline levels of protection ranging between 40% and 60%, corresponding to x0.60 
and x0.40 of the baseline levels reported immediately after exposure (vaccination 
or infection).

Teams may incorporate waning of immunity against severe disease, however the 
timescale of waning against severe disease must be slower than the timescale of 
waning against infection.


#### Handling immune escape and waning immunity in the calibration process


It is important that scenarios are directly comparable in the amount of immune escape 
and waning, both in terms of the proportion of population in different immune classes 
at the start of projections, and throughout the projection period (because immune 
escape and waning are not part of the scenario axes). These shared assumptions should 
include rate of immune escape (or number of variants modeled), timescale of immunity 
decline and plateau reached after immunity has waned, if any. Ideally, simulations 
should be paired across scenarios, with each simulation of the “counterfactual” (scenario 
A) having a comparable simulation in each of the other intervention scenarios in terms 
of immune escape and waning assumptions during both calibration and projection periods. 
Alternatively, if pairing is not feasible, each scenario should similarly draw from 
shared distributions to ensure comparability, with no variation in assumptions/specifications 
across the scenarios during the calibration period. Only by having paired simulations or 
completely comparable starting conditions at the start of the projection period for all 
scenarios can we evaluate the impact of different vaccine coverage and timing assumptions 
in the projection period. If past immune escape and/or waning immunity parameters are 
unobservable from the recent data, estimates can be drawn from the literature to help with 
calibration. It is also acceptable to use the midpoint of the recommended immune escape 
bounds (35%, midpoint between 20% and 50%) for calibration of immune escape in the recent 
past.


#### **Modeling COVID19 in the endemic phase: seasonality and severity.**


Recent years have seen a drop in reported COVID-19 hospitalizations and deaths. 
Teams are encouraged to consider mechanisms by which estimated burden has decreased, 
whether it is due to decreased risk of infection, severity per infection, or both, 
and from slower immune escape and/or build up of immunity.  Calibration to recent 
hospitalizations and deaths is encouraged.


Recent years have also seen marked levels of COVID-19 activity in the summer and fall, 
along with a winter wave of varying magnitude. Seasonality has also varied geographically, 
with Southern states experiencing more pronounced summer waves. It is important to try to 
reproduce this feature of COVID-19 epidemiology as COVID-19 timing interacts with the 
frequency of the vaccination campaigns, which is one of the scenario axes. 


Teams should include their best estimate of COVID-19 seasonality and severity in their 
model. We do not prescribe a specific level or shape of seasonal forcing or severity 
values but we ask that teams check that their models are able to reproduce the observed 
patterns of COVID-19 activity in the past year in their calibration step. 


Note that reporting to the NHSN hospitalization dataset was paused during May-November 
2024, with reporting from fewer than 75% hospitals over the period. However hospitalization 
reporting was complete in summer 2025, allowing for a fuller picture of seasonality. Teams 
will also be provided with auxiliary datasets from other surveillance systems to help with 
calibration (eg, wastewater surveillance, ED visits, COVID-net).


#### Variants


Teams should assume that the projection period will not see the emergence of any unusual 
variants, other than those implied by the level of immune escape chosen for a specific 
simulation. Treatment of variants existing at the start of the projection period is left 
to the discretion of the teams. **Intrinsic transmissibility and severity of disease in 
a naive individual** is assumed to be constant across all currently-circulating and 
future variants. 


#### **NPIs**


Teams should NOT include reactive changes in NPIs imposed by health authorities 
to curb transmission, e.g., reinstatement of mask mandates, or closure of schools 
and businesses. However, teams can incorporate inherent changes in population 
behavior in response to increasing or decreasing incidences (eg, changes in 
contacts or masking), if these changes were inferred from earlier phases of the 
pandemic and are already part of the model. 

Database tracking of NPIs: teams may use their own data if desired, otherwise we 
recommend the following sources as a common starting point:

-   [Coronavirus Government Response Tracker | Blavatnik School of Government 
    (ox.ac.uk)](https://www.bsg.ox.ac.uk/research/research-projects/coronavirus-government-response-tracker)
-   [Coronavirus State Actions - National Governors Association 
    (nga.org)](https://www.nga.org/coronavirus-state-actions-all/)


#### **Initial Conditions**

The mix of circulating strains at the start of the projection period is at the 
discretion of the teams based on their interpretation/analysis of the available 
data. Variation in initial prevalence between states is left at teams’ discretion. 
  

#### **Targets and case ascertainment:**

**For round 20, targets will be similar to Round 19 and consist of weekly state- 
and national-level COVID-19 hospitalizations and deaths** (no case projections). 
Ascertainment of hospitalizations and deaths will proceed at the same level as 
they were at the start of the projection period. 
[NHSN hospitalization](https://data.cdc.gov/Public-Health-Surveillance/Weekly-Hospital-Respiratory-Data-HRD-Metrics-by-Ju/ua7e-t2fy/) 
will be used as the source of hospitalization data and 
[NCHS](https://data.cdc.gov/NCHS/Provisional-COVID-19-Death-Counts-by-Week-Ending-D/r8kw-7aab) 
will be used as the 
source of gold-standard death data. Note that NCHS data source **counts deaths 
on the dates they occurred, not on the date they were reported**. In accordance 
with the data, the death target should give deaths on the date they occur.


#### Population

Whether or not to include demographic dynamics (aging, birth) is at the 
discretion of the teams.

***All of the teams' specific assumptions should be documented in
metadata and abstract.***

**Projection Time Horizon:** We consider a 24-month (104-week) projection period,
Sunday, June 8, 2025, to Saturday, June 5, 2027. 


### Submission Information

| Scenario  | Scenario name  | Scenario ID for submission file ('scenario_id') |
|---------------------------------|:-----------------:|:-----------------:|
| Scenario A. No booster, no immunization (counterfactual)                       | noVax                  | A-2026-05-11  |
| Scenario B. Business as usual coverage, annual immunization                    | ModCov_AnnualVax       | B-2026-05-11  |
| Scenario C. Business as usual coverage, semi-annual immunization for high-risk | ModCov_SemiannualHRVax | C-2026-05-11  |
| Scenario D. Optimistic coverage, annual immunization                           | OptCov_AnnualVax       | D-2026-05-11  |
| Scenario E. Optimistic coverage, semi-annual immunization for high-risk        | OptCov_SemiannualHRVax | E-2026-05-11  |

-   **Due date**: June 29, 2026

-   **End date for fitting data**: Saturday June 6, 2026 (no later 
	than Sat June 6, no earlier than Sat May 30)

-   **Start date for scenarios**: Sunday June 8, 2025 (Note, the scenario 
	period begins in June 2025, but the fitting/calibration data can include 
	observations through June 2026; the first year is used to generate 
	retrospective counterfactuals under the scenario assumptions.) 

-   **Simulation end date:** Saturday, June 5, 2027 (104 week time horizon)

**Submission Target**

- Required:
    - Weekly incident deaths
    - Weekly incident hospitalizations
- Optional:
    - Weekly incident hospitalizations by population group 
    (<5, 5-17, 18-64 low-risk, 18-64 high-risk, 65+). See 
    [model-output documentation](./model-output/README.md#age_group) 
    on how to code the age group in the submission file.


**Other submission requirements**

-   We require teams to submit 300 representative trajectories from their simulations.
-   Projections need to be **paired across horizon, targets and scenarios**. If teams are 
	providing age or risk group -specific projections, then these projections need to be 
	paired across horizon, targets, scenarios and populations subgroups.
-   Projection quantiles for incident outcomes are optional but encouraged. 
    Similarly projections of cumulative outcomes (either as quantiles or cumulative
    trajectories) are optional.
    -   Weekly incident deaths
    -   Weekly incident hospitalizations
    -   Weekly cumulative deaths since simulation start 
    -   Weekly cumulative hospitalizations since simulation start
    -   For teams who wish to submit quantiles, the format is in accordance with 
    prior rounds. We ask for the following quantiles: 0.01, 0.025, 0.05, every 5% 
    to 0.95, 0.975, and 0.99. Mean is optional.
-   Weeks will follow epi-weeks (Sun-Sat) dated by the last day of
    the week
-   Submission file type: **gz.parquet** (from Apache Arrow) is now required. The
    submission file can be partitioned by "origin_date" and "target". For more information,
    please consult the associated [README](./model-output/README.md) 

-   **Abstract:** We require a brief abstract describing model
    assumptions and results, from all teams.

-   **Metadata:** We require a brief metadata form, from all teams.


## Submitting model projections

Groups interested in participating can submit model projections for each
scenario in a PARQUET file formatted according to our specifications,
and a metadata file with a description of model information. See
[here](./model-output/README.md)
for technical submission requirements.

## Target data

The [target-data/](./target-data) folder contains the target data
in a hubverse compliant 
[time-series format](https://hubverse.io/en/latest/user-guide/target-data.html).

The data are automatically updated on Monday morning. The code to generate the
data is available in the [src](./src/) folder.
The past version of the `time-series` files are stored in the 
[auxiliary-data/target-data_archive](./auxiliary-data/target-data_archive/) 
folder, with the date the data was archived append to the filename.

### Death
 
[National Center for Health Statistics (NCHS) Mortality Surveillance
Data](https://www.cdc.gov/flu/weekly/overview.htm#NCHSMortality) 
data for weekly incidence COVID-19 deaths extracted from the 
[FluView Interactive - Mortality](https://gis.cdc.gov/grasp/fluview/mortality.html) 
CDC dashboard will be used for incidence death target . These data are 
weekly and pertain to date of death, not report date. 

Due to the delay and backfilling of these data, the cumulative death 
target will also start from the date of projection (instead of cumulative 
since pandemic start).

### Hospitalization

Weekly Hospital Respiratory Data (HRD) Metrics by Jurisdiction from
the [National Healthcare Safety Network (NHSN)](https://data.cdc.gov/Public-Health-Surveillance/Weekly-Hospital-Respiratory-Data-HRD-Metrics-by-Ju/ua7e-t2fy/about_data) will be used for incidence hospitalization
target. The data are weekly. 

## Auxiliary Data

The repository stores and updates additional data relevant to the COVID-19 
modeling efforts in the [auxiliary-data/](./auxiliary-data/) folder:

- Vaccination Coverage: data on vaccination coverage that can be used for 
  a specific round. 
  
- Reports: Reports from COVID-19 Scenario Modeling Hub rounds results. Each 
  report contains an executive summary with key messages and results, and 
  analyses of ensemble and individual projections. 
  
- Hospitalization: Data from local state authorities to complete NHSN data. Does
  not include all states. 

- Wastewater & Other Topic of Interest: List of source and link that might be
  of interest for COVID-19 modeling. The list contains link to cases, deaths,
  tests, vaccination, emergency department visit, variants, wastewater, 
  demographics data.

- Population and census data: National and State level name and fips code as 
  used in the Hub and associated population size.

- Rounds: Information on ongoing round and previous round available in the 
  repository

For more information, please consult the associated 
[README file](./auxiliary-data/README.md).

## Round information

The repository also contains round information in a 
[rounds/](./auxiliary-data/rounds) folder:

- [Round 19](./auxiliary-data/rounds/round19.md)
- [Round 20](./auxiliary-data/rounds/round20.md)


## Ensemble model

We aim to combine model projections into an ensemble.

## Data license and reuse

We are grateful to the teams who have generated these scenarios. The
groups have made their public data available under different terms and
licenses. You will find the licenses (when provided) within the
model-specific metadata files in the [model-metadata](./model-metadata/)
directory. Please consult these licenses before using these data to
ensure that you follow the terms under which these data were released.

All source code that is specific to the overall project is available
under an open-source [MIT license](https://opensource.org/licenses/MIT).
We note that this license does NOT cover model code from the various
teams or model scenario data (available under specified licenses as
described above).

## Computational power

Those teams interested in accessing additional computational power
should contact Katriona Shea at
[k-shea\@psu.edu](mailto:k-shea@psu.edu).

Additional resources might be available from the 
[MIDAS Coordination Center](https://midasnetwork.us/), 
please contact [questions\@midasnetwork.us](mailto:questions@midasnetwork.us) 
for information.

## Funding

Scenario modeling groups are supported through grants to the contributing 
investigators.

The Scenario Modeling Hub site is supported by the MIDAS Coordination Center, 
NIGMS Grant U24GM132013 (2019-2024) and R24GM153920 (2024-2029) to the
University of Pittsburgh.

## Teams and models

- [*CDC Center for Forecasting and Outbreak Analytics --- Scenarios*](model-metadata/CFA-Scenarios.yaml)
    - Nicholas Adams (CDC Center for Forecasting and Outbreak Analytics), 
    Laura Albrecht (CDC Center for Forecasting and Outbreak Analytics), 
    Elisha Are (CDC Center for Forecasting and Outbreak Analytics), 
    Michael Batista (CDC Center for Forecasting and Outbreak Analytics), 
    Thomas Hladish (CDC Center for Forecasting and Outbreak Analytics), 
    Kok Ben Toh (CDC Center for Forecasting and Outbreak Analytics), 
    Fuhan Yang (CDC Center for Forecasting and Outbreak Analytics)

- [*Johns Hopkins University and University of North Carolina at Chapel Hill --- Flexible Epidemic Modeling Pipeline*](model-metadata/JHU_UNC-flepiMoP.yaml)
    - Joshua Macdonald (Johns Hopkins University), 
    Carl Pearson (University of North Carolina at Chapel Hill), 
    Timothy Willard (University of North Carolina at Chapel Hill), 
    Nhi Dinh (Johns Hopkins University), 
    Emiliano Morales Lopez (Swarthmore College), 
    Justin Lessler (University of North Carolina at Chapel Hill), 
    Shaun Truelove (Johns Hopkins University)

- [*PLANET Group at Northeastern University --- SIkJalpha*](/model-metadata//PLANET_NEU-SIkJalpha.yaml)
	- Ajitesh Srivastava (Northeastern University)

- [*UNC Charlotte --- Hierbin Hybrid*](model-metadata/UNCC-Hierbin.yaml)
    - Shi Chen (UNC Charlotte),
      Daniel Janies (UNC Charlotte),
      Rajib Paul (UNC Charlotte)

- [*University of Texas at Austin --- UT-ImmunoSEIRS*](model-metadata/UT-ImmunoSEIRS.yaml)
    - Shraddha Ramdas Bandekar (The University of Texas at Austin), 
    Kaiming Bi (University of Texas Health Science Center School of Public Health), 
    Anass Bouchnita (The University of Texas at El Paso), 
    Spencer J. Fox (North Arizona University), 
    Lauren Ancel Meyers (The University of Texas at Austin)

- [*University of Texas Health Science Center at Houston - Rensselaer Polytechnic Institute --- EvoSEIR*](model-metadata//UIUC-IMMCYC.yaml)
	- Boya Peng (University of Texas Health Science Center at Houston), 
	Junfeng Wu (Rensselaer Polytechnic Institute), 
	Yinan Wang (Rensselaer Polytechnic Institute), 
	Kaiming Bi (University of Texas Health Science Center at Houston)

- [*UVA Biocomplexity Institute --- adaptive*](model-metadata/UVA-adaptive.yaml)
    - Przemyslaw Porebski (UVA),
      Srinivasan Venkatramanan (UVA),
      Bryan Lewis (UVA),
      Aniruddha Adiga (UVA),
      Jiangzhuo Chen (UVA),
      Madhav Marathe (UVA)

### Past members

- [*LEMMA (Part of the ACCIDDA center) --- DTW+Shape based Ensemble*](model-metadata/LEMMA-EnsembleDTWS.yaml)
    - Ajitesh Srivastava (University of Southern California)

- [*MOBS Lab at Northeastern University --- GLEAM COVID-19 Model*](model-metadata/MOBS_NEU-GLEAM_COVID.yml)
    - Alessandro Vespignani (MOBS Lab, Northeastern University),
      Matteo Chinazzi (The Roux Institute, Northeastern University),
      Jessica T. Davis (MOBS Lab, Northeastern University)

- [*Predictive Science Inc --- Mechanistic SARS-CoV-2 compartmental model designed for round 19*](model-metadata/PSI-M_CoV_2025.yaml)
    - Turtle J (Predictive Science),
      Ben-Nun M (Predictive Science),
      Riley P (Predictive Science)

- [*University of Illinois, Urbana-Champaign --- UIUC-IMMCYC*](model-metadata/UIUC-IMMCYC.yaml)
    - Soren L Larsen (Program in Ecology, Evolution, and Conservation Biology, University of Illinois 
    at Urbana-Champaign, Urbana, IL, USA)


## The COVID-19 Scenario Modeling Hub Coordination Team

-   Shaun Truelove, Johns Hopkins University
-   Cécile Viboud, NIH Fogarty
-   Justin Lessler, University of North Carolina
-   Katriona Shea, Penn State University
-   Claire Smith, Johns Hopkins University
-   Emily Howerton, Penn State University
-   Harry Hochheiser, University of Pittsburgh
-   Michael Runge, USGS
-   Lucie Contamin, University of Pittsburgh
-   John Levander, University of Pittsburgh
-   Jessi Espino, University of Pittsburgh
-   Erica Carcelen, John Hopkins University
-   Katie Yan, Penn State University

### Past members

-   Wilbert Van Panhuis, University of Pittsburgh
-   Jessica Kerr, University of Pittsburgh
-   Luke Mullany, Johns Hopkins University
-   Kaitlin Lovett, John Hopkins University
-   Michelle Qin, Harvard University
-   Tiffany Bogich, Penn State University
-   Rebecca Borchering, Penn State University
-   Nick Reich, University of Massachussetts at Amherst
-   Sara Loo, Johns Hopkins University
-   Sung-mok Jung, University of North Carolina
-   Samantha Bents, NIH Fogarty
-   Hidetoshi Inamine, Penn State University

