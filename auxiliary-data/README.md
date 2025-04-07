# Auxiliary Data

This folder is used to store additional information and data relevant to the 
COVID-19 modeling efforts. 

The data are organized in multiple sections:

- [Vaccination Coverage](.README.md#vaccination-coverage)
- [Hospitalization](./README.md#hospitalization)
- [Wastewater](./README.md#wastewater)
- [Other Topics of Interest](./README.md#other-topics-of-interest)
- [Locations and Census Data](./README.md#location-and-census-data)
- [Additional Resources](./README.md#additional-resources)
    - [MIDAS Network Curated Archive](./README.md#midas-network-curated-archive)
    
If there any issues, or questions, please feel free to 
[open an issue](https://github.com/midas-network/covid19-scenario-modeling-hub/issues).
If you want to contribute to the list of resources, please free to 
[open an issue](https://github.com/midas-network/covid19-scenario-modeling-hub/issues) or
[open a Pull Request](https://github.com/midas-network/covid19-scenario-modeling-hub/pulls) 
containing the information to add. 

## Vaccination Coverage

The folder [vaccination-coverage/](./vaccination-coverage/) contains round specific
vaccination coverage data.

The folder contains a [README](./vaccination-coverage/README.md) file with detailed 
information for each file.

## Hospitalization

Weekly Hospital Respiratory Data (HRD) Metrics by Jurisdiction from
the [National Healthcare Safety Network (NHSN)](https://data.cdc.gov/Public-Health-Surveillance/Weekly-Hospital-Respiratory-Data-HRD-Metrics-by-Ju/ua7e-t2fy/about_data) 
are used for incidence hospitalization targets 
However, data reporting was voluntary  from May 2024 to November 2024. As a results, 
during this period some locations had less than 75% hospital reporting. The
observations associated with less than 75% hospital reporting are removed from
the target data.

To complete this gap, we collected information from local state authorities.  When
available these data are aggregate them in the same format as the target data, except from
Arkansas who reported monthly information.

The results will be posted soon in an hospitalization subfolder containing the 
source data, the code to reproduce the results and visualization comparison
with the NHSN data. 


## Wastewater

| Location | Link |
|:---|:------|
| US             | [WastewaterSCAN](https://data.wastewaterscan.org/tracker/?charts=CjIQACABSABaBk4gR2VuZXIKMjAyNS0wMi0xN3IKMjAyNS0wMy0zMYoBBjk5MGE5N8ABAQ%3D%3D&selectedChartId=990a97) |
| US             | [NWSS - Wastewater Surveillance](https://covid.cdc.gov/covid-data-tracker/#wastewater-surveillance) |
| California     | [CDPH California Surveillance of Wastewaters (Cal-SuWers) ](https://skylab.cdph.ca.gov/calwws/) |
| California     | [COVID-19 Sewershed Restricted Case Data ](https://data.chhs.ca.gov/dataset/covid-19-sewershed-restricted-case-data) |
| Colorado       | [CDPHE Colorado Wastewater Surveillance Data](https://data-cdphe.opendata.arcgis.com/datasets/54a508b3c9c543559a367054fc956e6d_0/explore)|
| Connecticut    | [Weekly Respiratory Viral Disease Update - Wastewater Surveillance](https://app.powerbigov.us/view?r=eyJrIjoiOWNmYzZmZWUtNjRlMy00ZDc5LWE5YzMtYTY2YzVjNmE1NGU4IiwidCI6IjExOGI3Y2ZhLWEzZGQtNDhiOS1iMDI2LTMxZmY2OWJiNzM4YiJ9)|
| Georgia        | [GA NWSS Wastewater Surveillance Reports](https://dph.georgia.gov/ga-nwss-wastewater-surveillance-reports) |
| Illinois       | [Illinois Wastewater Surveillance System](https://iwss.uillinois.edu/)|
| Indiana        | [COVID-19 Dashboard](https://www.in.gov/health/idepd/respiratory-disease/coronavirus/covid-19-dashboard/)|
| Maine          | [Wastewater Surveillance in Maine](https://www.maine.gov/dhhs/mecdc/infectious-disease/epi/airborne/coronavirus/wastewater-reports.shtml) |
| Massachusetts  | [Wastewater surveillance reporting](https://www.mass.gov/info-details/wastewater-surveillance-reporting) |
| Michigan       | [Sentinel Wastewater Epidemiology Evaluation Project (SWEEP)](https://www.michigan.gov/coronavirus/stats/wastewater-surveillance/dashboard/sentinel-wastewater-epidemiology-evaluation-project-sweep)|
| Michigan       | [Michigan COVID-19 Wastewater Dashboard](https://www.michigan.gov/coronavirus/stats/wastewater-surveillance/wastewater-surveillance-for-covid-19/dashboard)|
| Minnesota      | [Minnesota Wastewater Surveillance Study](https://wastewater.uspatial.umn.edu/sars-cov-2/)|
| Missouri       | [The Missouri Wastewater Surveillance Program](https://experience.arcgis.com/experience/44e9cdefa15f41648c6b6f382cdccf2d/page/COVID-19?views=Influenza-Types%2CSARS-CoV-2-Trends-Map%2CSlide6%2CTypes-Map)|
| New Hampshire  | [Wastewater Surveillance](https://wisdom.dhhs.nh.gov/wisdom/dashboard.html?topic=covid-19&subtopic=recurring-updates&indicator=wastewater-monitoring-by-infectious-disease#tabnavbarid)|
| New Mexico     | [Viral Respiratory Infection Dashboard](https://nmdoh-reports.shinyapps.io/ViralRespiratoryInfectionDashboard/)|
| New York       | [COVID-19 Wastewater Surveillance](https://coronavirus.health.ny.gov/covid-19-wastewater-surveillance)|
| North Carolina | [NCDHHS Data Behind the Dashboards](https://public.tableau.com/views/NCDHHS_COVID-19_DataDownload_Story_16220681778000/DataBehindtheDashboards?%3Aembed=y&%3AshowVizHome=no) | Directly Downloadable | Emergency Department Visits; Hospitalizations; Tests; Wastewater | North Carolina Department of Health and Human Services |
| Ohio           | [COVID-19 Reporting](https://data.ohio.gov/wps/portal/gov/data/view/covid-19-reporting)
| Oklahoma       | [COVID-19 Data](https://oklahoma.gov/health/health-education/acute-disease-service/viral-view/covid-19.html)
| Oregon         | [Oregon's RVP Wastewater Monitoring](https://public.tableau.com/app/profile/oregon.public.health.division.acute.and.communicable.disease.pre/viz/OregonsRVPWastewaterMonitoring/Mainpage)|
| Pennsylvania   | [Pennsylvania Wastewater Surveillance System (PaWSS)](https://www.pa.gov/agencies/health/programs/environmental-health/pawss.html) |
| Utah           | [Overview of COVID-19 Surveillance](https://coronavirus-dashboard.utah.gov/covid_pandash.html)|
| Virginia       | [SARS-CoV-2 in Wastewater](https://www.vdh.virginia.gov/coronavirus/sars-cov-2-in-wastewater/) |
| Washington     | [Wastewater](https://doh.wa.gov/data-and-statistical-reports/diseases-and-chronic-conditions/communicable-disease-surveillance-data/respiratory-illness-data-dashboard#WasteWater) |
| Wisconsin      | [COVID-19: Wisconsin Wastewater Monitoring Program](https://www.dhs.wisconsin.gov/covid-19/wastewater.htm) |


### Other Topics of Interest

| Location | Links | Available | Topics | Source |
|:---|:----------------|:--------|:----------------|:----------------|
| US | [NSSP Emergency Department Visits - COVID-19, Flu, RSV, Combined – by Demographic Category](https://data.cdc.gov/Public-Health-Surveillance/NSSP-Emergency-Department-Visits-COVID-19-Flu-RSV-/7xva-uux8/about_data) | Directly Downloadable | Emergency Department Visits | Centers for Disease Control and Prevention (CDC) |
| US | [NSSP Emergency Department Visit Trajectories by State and Sub State Regions- COVID-19, Flu, RSV, Combined](https://data.cdc.gov/Public-Health-Surveillance/NSSP-Emergency-Department-Visit-Trajectories-by-St/rdmq-nq56/about_data) | Directly Downloadable | Emergency Department Visits | Centers for Disease Control and Prevention (CDC) |
| US | [Rates of Laboratory-Confirmed RSV, COVID-19, and Flu Hospitalizations from the RESP-NET Surveillance Systems](https://data.cdc.gov/Public-Health-Surveillance/Rates-of-Laboratory-Confirmed-RSV-COVID-19-and-Flu/kvib-3txy/about_data) | Directly Downloadable | Hospitalizations | Centers for Disease Control and Prevention (CDC), Respiratory Virus Hospitalization Surveillance Network (RESP-NET) |
| US | [Provisional Percent of Deaths for COVID-19, Influenza, and RSV by Select Characteristics](https://data.cdc.gov/NCHS/Provisional-Percent-of-Deaths-for-COVID-19-Influen/53g5-jf7x/about_data) | Directly Downloadable | Deaths | Centers for Disease Control and Prevention (CDC), National Center for Health Statistics (NCHS) |
| US | [Percent of Tests Positive for Viral Respiratory Pathogens](https://data.cdc.gov/Public-Health-Surveillance/Percent-of-Tests-Positive-for-Viral-Respiratory-Pa/seuz-s2cv/about_data) | Directly Downloadable | Tests | Centers for Disease Control and Prevention (CDC), NREVSS |
| US | [Percent Positivity of COVID-19 Nucleic Acid Amplification Tests by HHS Region, National Respiratory and Enteric Virus Surveillance System](https://data.cdc.gov/Laboratory-Surveillance/Percent-Positivity-of-COVID-19-Nucleic-Acid-Amplif/gvsb-yw6g/about_data) | Directly Downloadable | Tests | Centers for Disease Control and Prevention (CDC) |
| US | [Weekly Respiratory Virus Vaccination Data, Children 6 Months-17 Years and Adults 18 Years and Older, National Immunization Survey](https://data.cdc.gov/Vaccinations/Weekly-Respiratory-Virus-Vaccination-Data-Children/5c6r-xi2t/about_data) | Directly Downloadable | Vaccination; Age groups | Centers for Disease Control and Prevention (CDC) |
| US | [Weekly Cumulative COVID-19 Vaccination Coverage and Intent, Overall, by Selected Demographics and Jurisdiction, Among Adults 18 Years and Older](https://data.cdc.gov/Vaccinations/Weekly-Cumulative-COVID-19-Vaccination-Coverage-an/ksfb-ug5d/about_data) | Directly Downloadable | Vaccination; Demographics | Centers for Disease Control and Prevention (CDC), National Center for Immunization and Respiratory Diseases (NCIRD) |
| US | [Weekly Parental Intent for Vaccination and Cumulative Percentage of Children 6 Months -17 Years Who are Up to date with the COVID-19 Vaccines by Season, United States](https://data.cdc.gov/Child-Vaccinations/Weekly-Parental-Intent-for-Vaccination-and-Cumulat/ker6-gs6z/about_data) | Directly Downloadable | Vaccination; Demographics | Centers for Disease Control and Prevention (CDC), National Center for Immunization and Respiratory Diseases (NCIRD) |
| US | [Weekly COVID-19 Vaccination Coverage Among Pregnant Women 18-49 Years, by Race and Ethnicity](https://data.cdc.gov/Pregnancy-Vaccination/Weekly-COVID-19-Vaccination-Coverage-Among-Pregnan/pvk6-8bzd/about_data) | Directly Downloadable | Vaccination; Demographics | Centers for Disease Control and Prevention (CDC), National Center for Immunization and Respiratory Diseases (NCIRD) |
| US | [Monthly Cumulative Number and Percent of Persons Who Received 1+ 2024-25 COVID-19 Vaccination Doses, by Age Group, and Jurisdiction, United States](https://data.cdc.gov/Vaccinations/Monthly-Cumulative-Number-and-Percent-of-Persons-W/3bmy-cyyd/about_data) | Directly Downloadable | Vaccination; Demographics | Centers for Disease Control and Prevention (CDC), National Center for Immunization and Respiratory Diseases (NCIRD) |
| US | [SARS-CoV-2 Variant Proportions](https://data.cdc.gov/Laboratory-Surveillance/SARS-CoV-2-Variant-Proportions/jr58-6ysp) | Directly Downloadable | Variants | Centers for Disease Control and Prevention (CDC), CORVD Laboratory Branch |
| US | [Detect and analyze variants of SARS-CoV-2](https://cov-spectrum.org/explore/United%20States/AllSamples/Past6M) | Directly Downloadable | Variants | GISAID |
| Alabama        | [Viral Respiratory Diseases](https://www.alabamapublichealth.gov/data/respiratory.html) | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=1826)| Emergency Department Visits | Alabama Public Health |
| Alaska*        | Respiratory Virus Snapshot | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=1747) | Lab-Confirmed Cases; Virus Variants or Types; Emergency Department Visits | Alaska Department of Health |
| Arkansas       | [COVID-19 Information](https://experience.arcgis.com/experience/3f35319c03b440d58cf402a4f4efad62/page/COVID-19?draft=true&views=COVID-19-Information) | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=1646) | Hospitalizations; Cases; Deaths; Demographics | Arkansas Department of Health |
| Arizona        | [Respiratory Illness Data](https://www.azdhs.gov/preparedness/epidemiology-disease-control/infectious-disease-epidemiology/respiratory-illness/dashboards/index.php#covid-19) | - | Cases; Age groups | Arizona Department of Health Services |
| California     | [Respiratory Virus Dashboard Metrics ](https://data.chhs.ca.gov/dataset/respiratory-virus-dashboard-metrics) | Directly Downloadable | Tests; Deaths; Hospitalizations (until April 2024) | California Department of Public Health |
| Connecticut    | [Weekly Respiratory Viral Disease Update](https://app.powerbigov.us/view?r=eyJrIjoiOWNmYzZmZWUtNjRlMy00ZDc5LWE5YzMtYTY2YzVjNmE1NGU4IiwidCI6IjExOGI3Y2ZhLWEzZGQtNDhiOS1iMDI2LTMxZmY2OWJiNzM4YiJ9) | - | Emergency Department Visits; Hospitalizations; Cases; Deaths | Connecticut Department of Public Health |
| District of Columbia* |[Current DC Covid-19 Statistics](https://dchealth.dc.gov/page/current-dc-covid-19-statistics) | - | Hospitalizations; Cases | DC Health|
| District of Columbia  | [DC COVID-19 Weekly Cases](https://opendata.dc.gov/datasets/11dc547c615249a7a0c44d28d52d9884_52/explore) | Directly Downloadable | Cases | City of Washington, DC |
| Florida        | [COVID-19 Cases](https://www.flhealthcharts.gov/ChartsDashboards/rdPage.aspx?rdReport=Covid19.Dataviewer) | Directly Downloadable | Cases; Deaths; Vaccinations | Florida Health CHARTS|
| Hawaii         | [Hawaii COVID-19 Cases and Testing](https://health.hawaii.gov/coronavirusdisease2019/current-situation-in-hawaii/) | - | Cases; Tests | Hawaii, Department of Health |
| Hawaii         | [Hawaii COVID-19 Vaccination Summary](https://health.hawaii.gov/coronavirusdisease2019/tableau_dashboard/21778/) | - | Vaccination; Demographics | Hawaii, Department of Health |
| Hawaii         | [Summary of COVID-19 Deaths](https://health.hawaii.gov/coronavirusdisease2019/tableau_dashboard/mortality-data/) | - | Deaths; Demographics | Hawaii, Department of Health |
| Hawaii         | [Weekly New COVID-19 Cases](https://health.hawaii.gov/coronavirusdisease2019/tableau_dashboard/age-trends/) | - | Cases; Age groups| Hawaii, Department of Health |
| Hawaii         | [Hawaii Hospitalization Metrics](https://health.hawaii.gov/coronavirusdisease2019/tableau_dashboard/hawaii-hospitalization-metrics/) | - | New admissions with COVID-19 | Hawaii, Department of Health |
| Indiana        | [COVID-19 Dashboard](https://www.in.gov/health/idepd/respiratory-disease/coronavirus/covid-19-dashboard/)| - | Hospitalizations; Emergency Department Visits; Deaths | Indiana Department of Health |
| Idaho          | [COVID-19 Dashboard](https://public.tableau.com/app/profile/idaho.division.of.public.health/viz/DPHIdahoCOVID-19Dashboard/Home) | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=712) | Emergency Department Visits; Hospitalizations (until May 2024); Deaths; Demographics | Idaho Department of Health and Welfare|
| Idaho          | [COVID-19 Vaccine Data Dashboard](https://public.tableau.com/app/profile/idaho.division.of.public.health/viz/COVID-19VaccineDataDashboard/LandingPage) | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=689) | Vaccination; Demographics | Idaho Division of Public Heath |
| Illinois       | [Seasonal Respiratory Illness Dashboard](https://dph.illinois.gov/topics-services/diseases-and-conditions/respiratory-disease/surveillance/respiratory-disease-report.html) | Directly Downloadable | Hospital (percent); Demographics; Emergency Department Visits; Positivity; ICU Admissions; Deaths | Illinois Department of Public Health |
| Indiana        | [COVID-19 Dashboard](https://www.in.gov/health/idepd/respiratory-disease/coronavirus/covid-19-dashboard/) | - | Hospitalizations; Emergency Department Visits; Deaths | Indiana Department of Health |
| Indiana        | [Indiana COVID-19 Vaccination Dashboard](https://www.coronavirus.in.gov/vaccine/vaccine-dashboard/) | - | Vaccinations; Demographics | Indiana Department of Health |
| Iowa           | [Respiratory Reports](https://hhs.iowa.gov/center-acute-disease-epidemiology/iowa-influenza-surveillance) | Data in PDF report | Positivity | Iowa Heath & Human Services |
| Kansas         | [Kansas Syndromic Surveillance Program](https://kshealthdata.kdhe.ks.gov/t/KDHE/views/EssenceDashboard/Respiratory?%3Aembed=y&%3AisGuestRedirectFromVizportal=y) | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=1761) | Emergency Department Visits| Kansas Department of Health and Environment |
| Kansas         | [Kansas COVID-19 Vaccine Coverage](https://kshealthdata.kdhe.ks.gov/t/KDHE/views/COVID-19VaccineDashboard/LandingPage?%3Aembed=y&%3AisGuestRedirectFromVizportal=y) | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=1812) | Vaccination; Demographics | Kansas Department of Health and Environment |
| Kentucky       | [Kentucky Respiratory Disease](https://dashboard.chfs.ky.gov/views/DPHRSP001RespiratoryDiseases/COVIDHospitalzationsandEDVisitsBySeason?%3Aembed=y&%3AisGuestRedirectFromVizportal=y)| [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=1686) | Emergency Department Visits; Hospitalizations; Deaths; Positivity | Kentucky Public Health |
| Louisiana      | [Respiratory Emergency Department Visits Data](https://ldh.la.gov/page/respiratory-emergency-department-visits-data) | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=1663) | Emergency Department Healths | Louisiana Department of Health |
| Louisiana      | [Respiratory Laboratory Surveillance Data](https://ldh.la.gov/page/respiratory-laboratory-survey-data) | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=1632) | Positivity | Louisiana Department of Health |
| Louisiana      | [Respiratory Death Data](https://ldh.la.gov/page/respiratory-death-data) | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=1653) | Deaths | Louisiana Department of Health |
| Maine          | [COVID-19: Maine Data ](https://www.maine.gov/dhhs/mecdc/infectious-disease/epi/airborne/coronavirus/data.shtml) |  Directly Downloadable | Deaths; Hospitalizations; Emergency Department Visits; Cases; Demographics | Maine Center for Disease Control & Prevention |
| Maryland       | [MD COVID-19 - MASTER Case Tracker](https://opendata.maryland.gov/Health-and-Human-Services/MD-COVID-19-MASTER-Case-Tracker/mgd3-qk8t/about_data) | Directly Downloadable | Cases; Tests; Positivity; Hospitalizations; Deaths; Demographics | Maryland Department of Health Prevention and Health Promotion Administration, MDH PHPA |
| Massachusetts  | [Viral respiratory illness reporting ](https://www.mass.gov/info-details/viral-respiratory-illness-reporting) | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=1762) | Emergency Department Visits; Cases; Deaths; Hospitalizations; Vaccinations; Demographics | Massachusetts Department of Public Health |
| Michigan       | [Michigan COVID-19 Summary Metrics](https://www.michigan.gov/coronavirus) |  Directly Downloadable | Cases; Death; Demographics; Emergency Department Visits | Michigan Department of Health and Human Services |
| Minnesota      | [Case & Variant Data](https://www.health.state.mn.us/diseases/coronavirus/stats/case.html) | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=1683) | Cases; Demographics; Variants | Minnesota Department of Health |
| Minnesota      | [Mortality (Death) Data](https://www.health.state.mn.us/diseases/coronavirus/stats/death.html) | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=1667) | Deaths; Demographics | Minnesota Department of Health |
| Minnesota      | [Vaccine Data: Influenza and COVID-19](https://www.health.state.mn.us/diseases/respiratory/stats/vaccine.html) | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=666) | Vaccination; Demographics | Minnesota Department of Health |
| Mississippi    | [COVID-19](https://msdh.ms.gov/msdhsite/_static/14,0,420.html#syndromic) | Data in PDF report  | Deaths; Demographics | Mississippi State Department of Health |
| Missouri       | - | - | - | - |
| Montana        | [COVID-19, Influenza, and RSV Dashboard](https://dphhs.mt.gov/publichealth/cdepi/diseases/Pan-Respiratory/Pan-RespiratoryDashboard) | - | Cases; Deaths; Hospitalizations; Emergency Department Visits | Montana Department of Public Health & Human Services |
| Nebraska       | [Nebraska Respiratory Illness Dashboard](https://datanexus-dhhs.ne.gov/views/RI_External_CV19_HS/CVSeasonTotalsDB?%3Aembed=y&%3Aiid=2&%3AisGuestRedirectFromVizportal=y&%3Alinktarget=_parent) | Directly Downloadable | Deaths; Hospitalizations; Emergency Department Visits; Demographics; Tests; | Nebraska Department of Health and Human Services|
| Nevada         | [Monitoring COVID-19 Nevada](https://app.powerbigov.us/view?r=eyJrIjoiNGY0NjQ4MzEtMmFlMC00MTg5LWI2OTUtZDAxMDViODIyZmIyIiwidCI6ImU0YTM0MGU2LWI4OWUtNGU2OC04ZWFhLTE1NDRkMjcwMzk4MCJ9) | Directly Downloadable | Deaths; Cases; Emergency Department Visits; Demographics | Nevada Department of Health and Human Services |
| New Hampshire  | [COVID-19 Overview](https://wisdom.dhhs.nh.gov/wisdom/dashboard.html?topic=covid-19&subtopic=recurring-updates&indicator=covid-19-overview#tabnavbarid)| - | Deaths; Demographics | New Hampshire Department of Health & Human Services |
| New Jersey     | [New Jersey Statistics: COVID-19](https://www.nj.gov/health/covid-19/information/data-and-dashboards/) | *Archived* [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=1638); [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=1673); [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=715) | Cases; Hospitalization; Deaths; Demographics; Tests| New Jersey Department of Health  |
| New Jersey     | [New Jersey Respiratory Illness Dashboard](https://www.nj.gov/health/respiratory-viruses/data-and-reports/#respiratory-illness-dashboard) | - | Emergency Department Visits; Cases; Deaths; Age groups; Hospitalization; Variants| New Jersey Department of Health  |
| New Mexico     | [Viral Respiratory Infection Dashboard](https://nmdoh-reports.shinyapps.io/ViralRespiratoryInfectionDashboard/) | - | Vaccinations; Demographics; Cases; Hospitalizations; Tests; Variants | New Mexico Department of Health |
| New York       | [COVID-19 Data in New York](https://coronavirus.health.ny.gov/covid-19-data-new-york) | Directly Downloadable | Tests; Cases; Variants; Hospitalizations; Deaths; Vaccinations; Demographics | New York State Department of Health |
| North Carolina | [NCDHHS Data Behind the Dashboards](https://public.tableau.com/views/NCDHHS_COVID-19_DataDownload_Story_16220681778000/DataBehindtheDashboards?%3Aembed=y&%3AshowVizHome=no) | Directly Downloadable | Emergency Department Visits; Hospitalizations; Tests; Wastewater | North Carolina Department of Health and Human Services |
| North Dakota*  | [Respiratory Illnesses and Prevention](https://www.hhs.nd.gov/health/respiratory-illnesses) | Available in multiple [MIDAS Catalog](https://midasnetwork.us/catalog/) entries | Cases; Demographics; Hospitalizations; Deaths; Positivity; Vaccinations | North Dakota Health & Human Services |
| Ohio           | [COVID-19 Reporting](https://data.ohio.gov/wps/portal/gov/data/view/covid-19-reporting)| Available in multiple [MIDAS Catalog](https://midasnetwork.us/catalog/) entries | Variants; Cases; Demographics; Hospitalization; Deaths  | Ohio Department of Health |
| Oklahoma       | [COVID-19 Data](https://oklahoma.gov/health/health-education/acute-disease-service/viral-view/covid-19.html)| Available in multiple [MIDAS Catalog](https://midasnetwork.us/catalog/) entries | Positivity; Variants; Wastewater | Oklahoma State Department of Health|
| Oregon         | [Oregon Health Authority COVID-19](https://public.tableau.com/app/profile/oregon.health.authority.covid.19/vizzes#%21/) | Directly Downloadable | Hospitalization; Vaccination; Variants; | Oregon Health Authority |
| Oregon         | [Oregon's Respiratory Virus Data](https://public.tableau.com/app/profile/oregon.public.health.division.acute.and.communicable.disease.pre/viz/OregonsRespiratoryVirusData/TableofContents) | Directly Downloadable |  Positivity; Wastewater; Variants; Hospitalizations; Deaths; Vaccinations| Oregon Health Authority|
| Pennsylvania*  | [Respiratory Virus Dashboard](https://www.pa.gov/agencies/health/diseases-conditions/infectious-disease/respiratory-viruses/respiratory-virus-dashboard.html) | [MIDAS Catalog](https://catalog.midasnetwork.us/?object_id=1827) | Emergency Department Visits; Hospitalization; Deaths | Commonwealth of Pennsylvania Department of Health|
| Rhode Island   | [Rhode Island COVID-19 Data Hub](https://ri-department-of-health-covid-19-data-rihealth.hub.arcgis.com/)  | Directly Downloadable | Hospitalizations; Demographics; Emergency Department; Vaccination; Variants | Rhode Island Department of Health |
| South Carolina | [Respiratory Disease Dashboard](https://dph.sc.gov/respiratory-disease-dashboard)| - | Emergency Department Visits; Demographics | South Carolina Department of Public Health |
| South Dakota   | [COVID-19 & Respiratory Virus Diseases (CORVD) Dashboard](https://doh.sd.gov/health-data-reports/data-dashboards/corvd-dashboard/) | - | Cases; Hospitalizations; Deaths; Demographics; Variants; Emergency Department Visits | South Dakota Department of Health |
| Tennessee      | [Respiratory Trends](https://www.tn.gov/health/ceds-weeklyreports/respiratory-trends.html) | - | Emergency Department Visits; Hospitalizations; Demographics | Tennessee Department of Health |
| Texas*         | [Texas Respiratory Illness Interactive Dashboard](https://texas-respiratory-illness-dashboard-txdshsea.hub.arcgis.com/)| Directly Downloadable | Hospitalization; Age groups; Emergency Department Visits; Deaths | Texas Department of Health and Human Services |
| Utah           | [Overview of COVID-19 Surveillance](https://coronavirus-dashboard.utah.gov/covid_pandash.html)| Directly Downloadable | Emergency Visits Department; Wastewater; Cases; Deaths; Demographics; Vaccination | Utah Department of Health & Human Services |
| Vermont        | [COVID-19 Data](https://www.healthvermont.gov/disease-control/covid-19/covid-19-data) | Data in PDF report | Emergency Department Visits; Vaccination; Deaths | Vermont Department of Health |
| Virginia       | [Respiratory Disease Data](https://www.vdh.virginia.gov/epidemiology/respiratory-diseases-in-virginia/data/) | Directly Downloadable | Emergency Department Visits; Deaths; Demographics; Tests; Vaccination | Virginia Department of Health |
| Washington     | [Respiratory Illness Data Dashboard](https://doh.wa.gov/data-and-statistical-reports/diseases-and-chronic-conditions/communicable-disease-surveillance-data/respiratory-illness-data-dashboard) | Directly Downloadable | Hospitalizations; Emergency Visits; Deaths; Demographics; Vaccinations | Washington State Department of Health |
| West Virginia  | [West Virginia Pan Respiratory Dashboard](https://dhhr.wv.gov/COVID-19/Pages/default.aspx) | Directly Downloadable | Tests; Emergency Department Visits; Hospitalizations; Vaccinations; Demographics | West Virginia Department of Health |
| Wisconsin      | [Immunizations: COVID-19 Vaccine Data](https://www.dhs.wisconsin.gov/immunization/covid-19-vaccine-data.htm) | Directly Downloadable | Vaccinations; Demographics | Wisconsin Department of Health Services |
| Wisconsin      | [COVID-19, Influenza, and RSV-Associated Hospitalizations](https://www.dhs.wisconsin.gov/disease/respiratory-hospitalizations.htm) | - | Hospitalizations; Age Groups | Wisconsin Department of Health Services |
| Wyoming        | [Respiratory Disease Dashboard](https://sites.google.com/wyo.gov/covid-19/home) | Directly Downloadable | Cases | Wyoming Department of Health |
| Puerto Rico    | [COVID-19 - Casos](https://datos.salud.pr.gov/covid-19/) | Directly Downloadable | Cases; Tests; Deaths; Hospitalizations; Vaccinations; Variants; Demographics | Puerto Rico Department of Health |

* **Alaska**: Archived page
* **District of Columbia**: New Hospitalization admissions set to 0 since beginning of 2024.
* **North Dakota**, **Texas**: Hospitalization available for season 2024-2025

## Location and Census Data

The folder [data-locations/](./data-locations/) contains two `csv` files:

- [locations.csv](./data-locations/locations.csv) containing
  the state and national  names, 2 letter abbreviation and fips code as used 
  in the hub. The file also contains the population size. 
- [locations_2022.csv](./data-locations/locations_2022.csv) 
  contains the population size per age group, state (and national level), from
  2022. Starting 2024, this data are used for the SMH visualizations.
  The data are coming from the US Census Bureau:
  - Annual Estimates of the Civilian Population by Single Year of Age and Sex 
  for the United States and States: April 1, 2020 to July 1, 
  2022: available 
  [here](https://www.census.gov/data/datasets/time-series/demo/popest/2020s-state-detail.html).

A python and R script are available in the [data-locations/](./data-locations/)
folder to generate the data. 

## Addtional Resources

### MIDAS Network Curated Archive

The MIDAS Network has created a 
[MIDAS Curated Archive of Global Public Health Data](https://midasnetwork.us/midas-archive) 
available via the [MIDAS Catalog](https://midasnetwork.us/catalog) for 
infectious disease modeling research including data and associated rich 
metadata.

To search the MIDAS Curated Archive of Global Public Health Data in the 
Catalog, please select:

- Collection: `"Curated Archive of Global Public Health Data"`
- Topic:
    - Hospitalization: use the topic `"hospital stay dataset"` under 
    "case counts"
    - ED visits: use the topic `"emergency department visit dataset"` under 
    "case counts"
    - Deaths: use the topic `"mortality data"` under "case counts"
    - Cases: use the topic `"case counts"`
    - Vaccination: use the topic `"vaccination administration census"` under
    "control strategy census"
    - Tests and positivity: use the topic `"Diagnostic Tests"` under 
    "case counts"
    - Wastewater: use the topic `"Wastewater"`
    - Variants: use the topic `"variant cases"` under "case counts"


