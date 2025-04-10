
# Hospitalization data from State Level Authorities

Weekly Hospital Respiratory Data (HRD) Metrics by Jurisdiction from the 
[National Healthcare Safety Network (NHSN)](https://data.cdc.gov/Public-Health-Surveillance/Weekly-Hospital-Respiratory-Data-HRD-Metrics-by-Ju/ua7e-t2fy/about_data)
are used for incidence hospitalization targets However, data reporting was 
voluntary from May 2024 to November 2024. As a results, during this period 
some locations had less than 75% hospital reporting. The observations 
associated with less than 75% hospital reporting are removed from the target 
data.

To complete this gap, we collected information from local state authorities. 
When available these data are aggregate in the same format as the target data,
exception of the column `"observation"` called `"value"`.

This work is still in process, we hope to try to clarify some of the difference
with the NHSN data and/or to provided additional data source or types to help. 

For each state, the data are compared to the NHSN COVID-19 hospital admissions,
the output visualization are available by state and for all location in the 
[viz](./viz) folder.

## Hospitalization data - States

The file contains information from multiple sources. The table below contains
information about the source, link to the data and information used to create
the output file and visualization.

| State | Links | Notes | Source |
|:---|:---------|:---|:---------|
| Arizona        | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=1639) | ARCHIVED data - use `Hosps_Epi_Curve.csv` file containing 2024 and 2023 data | Arizona Department of Health Services |
| Arkansas       | [COVID-19 Information](https://experience.arcgis.com/experience/3f35319c03b440d58cf402a4f4efad62/page/COVID-19?draft=true&views=COVID-19-Information) | **Monthly** hospitalization until 2025| Arkansas Department of Health |
| Colorado       | [CDPHE Viral Respiratory Hospital Data](https://data-cdphe.opendata.arcgis.com/datasets/CDPHE::cdphe-viral-respiratory-hospital-data/explore) | Use Hospital Admissions weekly Historical Trends | Colorado Department of Public Health and Environment |
| Delaware       | [COVID-19 Hospitalizations](https://myhealthycommunity.dhss.delaware.gov/data-dictionary/dataset-metadata/COVID19_HOSPITALIZATIONS) | Average Daily COVID-19 Hospital Admissions (multiply `value` by 7) | Delaware Department of Health and Social Services |
| Kentucky       | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=1686) | ARCHIVED data - use August `Hospital_Admissions_by_Week` file (weekly Inpatient Encounters) | Kentucky Public Health |
| Maine          | [COVID-19 Weekly Deaths, Hospitalized Patients, and Syndromic Data](https://www.maine.gov/dhhs/mecdc/infectious-disease/epi/airborne/coronavirus/data.shtml) | Hospitalized COVID-19 Patients | Maine Center for Disease Control & Prevention |
| Massachusetts  | [Viral respiratory illness reporting ](https://www.mass.gov/info-details/viral-respiratory-illness-reporting) | Hospital Admissions | Massachusetts Department of Public Health |
| Minnesota      | [Hospitalization Data](https://www.health.state.mn.us/diseases/coronavirus/stats/hosp.html) | Hospitalizations Over Time (7-day Moving Average) | Minnesota Department of Health |
| Montana        | [COVID-19, Influenza, and RSV Dashboard](https://dphhs.mt.gov/publichealth/cdepi/diseases/Pan-Respiratory/Pan-RespiratoryDashboard) | Hospitalizations | Montana Department of Public Health & Human Services |
| Nebraska       | [Nebraska Respiratory Illness Dashboard](https://datanexus-dhhs.ne.gov/views/RI_External_CV19_HS/CVSeasonTotalsDB?%3Aembed=y&%3Aiid=2&%3AisGuestRedirectFromVizportal=y&%3Alinktarget=_parent) | Number of COVID-19 Hospitalizations | Nebraska Department of Health and Human Services|
| New Jersey     | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=1715) | ARCHIVED data - use `Cases_by_Onset` file  |New Jersey Department of Health  |
| New York       | [New York State Statewide COVID-19 Hospitalizations and Beds](https://health.data.ny.gov/Health/New-York-State-Statewide-COVID-19-Hospitalizations/jw46-jpb7/about_data)| "Patients Newly Admitted" + "Patients Positive After Admission"| New York Department of Health |
| North Carolina | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=1681)| ARCHIVED data - use `ED_Hospital_Admissions` file | North Carolina Department of Health and Human Services |
| Ohio           | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=684) | ARCHIVED data - aggregate `COVIDDeathData_CountyOfResidence` file  | Ohio Department of Health |
| Oklahoma       | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=1805) | ARCHIVED data - use `hosp_by_hhs_region` file; aggregate regions  | Oklahoma State Department of Health|
| Rhode Island   | [Rhode Island COVID-19 Data Hub](https://ri-department-of-health-covid-19-data-rihealth.hub.arcgis.com/)  | Number of hospital admissions | Rhode Island Department of Health |
| Tennessee      | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=754) | ARCHIVED data - use `daily` file | Tennessee Department of Health |
| Utah           | [Overview of COVID-19 Surveillance](https://coronavirus-dashboard.utah.gov/covid_pandash.html)| COVID-19 Hospitalizations by Date of Admission | Utah Department of Health & Human Services |
| Virginia       | [VDH-COVID-19-PublicUseDataset-Cases_By-Confirmation](https://data.virginia.gov/dataset/vdh-covid-19-publicusedataset-cases-by-confirmation/resource/c2e1ec0c-703e-4aee-b4cd-9112f4a8c758) | Total hospitalization by report data | Virginia Department of Health |
| Washington     | [Respiratory Illness Data Dashboard](https://doh.wa.gov/data-and-statistical-reports/diseases-and-chronic-conditions/communicable-disease-surveillance-data/respiratory-illness-data-dashboard) | COVID-19, influenza, and RSV emergency visits and hospitalizations | Washington State Department of Health |
| West Virginia  | [West Virginia Pan Respiratory Dashboard](https://dhhr.wv.gov/COVID-19/Pages/default.aspx) | Weekly Hospitalization Rate (`value` / 100,000 * WV total population)| West Virginia Department of Health |
| Wisconsin      | [COVID-19: Hospitalizations](https://www.dhs.wisconsin.gov/covid-19/hosp-data.htm)| Patients Hospitalized | Wisconsin Department of Health Services |

The output file containing the processed hospitalization data is available in 
the output folder:
[output/hospitalization_states.csv](./output/hospitalization_states.csv)

<img src="./viz/All Location.png" width="1000" height="1000"/>

### Daily Hospitalization data - States

For two states the data are available at daily level:

| State | Links | Notes | Source |
|:---|:---------|:---|:---------|
| Maryland       | [MD COVID-19 - MASTER Case Tracker](https://opendata.maryland.gov/Health-and-Human-Services/MD-COVID-19-MASTER-Case-Tracker/mgd3-qk8t/about_data) | **DAILY** Hospitalization: Total Number of Hospital Beds| Maryland Department of Health Prevention and Health Promotion Administration, MDH PHPA |
| Oregon         | [Oregon COVID-19 Hospital Capacity Summary Tables](https://public.tableau.com/app/profile/oregon.health.authority.covid.19/viz/OregonCOVID-19HospitalCapacitySummaryTables_15965754787060/BedAvailabilitybyRegionSummaryTable) | **DAILY** Positive Patients - Hospitalization by Region | Oregon Health Authority |

The output file containing the processed hospitalization data is available in 
the output folder:
[output/daily_hospitalization_states.csv](./output/daily_hospitalization_states.csv)

The **daily** data from those states have also been compared to **weekly** 
admission from NSHN:

<img src="./viz/Daily - All Location.png" width="1000" height="750"/>

### Different hospitalization representation

For some states, hospitalization data was available in a different format than
the total weekly admissions from NHSN, for example California report the total
number of people hospitalized with COVID-19. 

The table below contains information for the states with this issue:

| State | Links | Notes | Source |
|:---|:---------|:---|:---------|
| California     | [COVID-19 Hospital Data](https://data.chhs.ca.gov/dataset/covid-19-hospital-data) | Hospitalized patient (County level; include all patients) | California Department of Public Health|
| Illinois       | [Seasonal Respiratory Illness Dashboard](https://dph.illinois.gov/topics-services/diseases-and-conditions/respiratory-disease/surveillance/respiratory-disease-report.html) | Percentages of Hospital Admissions | Illinois Department of Public Health |
| Puerto Rico    | [COVID-19 Hospitalizaciones ](https://datos.salud.pr.gov/covid-19/hospitalizations) | Number of Hospitalizations associated with COVID-19 | Puerto Rico Department of Health |

The output file containing the processed hospitalization data is available in 
the output folder:
[output/other_hospitalization_states.csv](./output/other_hospitalization_states.csv)

The [viz](./viz) folder contains also visualization for these states but without
comparison to the NHSN data.

### Reproduction

To reproduce the data, the raw data are available in the [source](./source) 
folder, organized by states. The R code is also available in the 
[code](./code) folder via 2 script:
 
 - `utils.R`: containing function used for the processing, standardization and
 visualization
 - `data.R`: R script processing all the data and generating the output files.

