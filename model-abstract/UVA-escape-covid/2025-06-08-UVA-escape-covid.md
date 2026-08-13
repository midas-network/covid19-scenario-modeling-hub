## Summary of results

ESCAPE-COVID is a full-population agent-based model run on the EpiHiper synthetic
population and activity-based contact network (Virginia: 7,684,795 agents). Every agent
carries its own immune clocks (last infection, last dose, dose formulation date), so
waning, immune escape and vaccine protection are per-agent and continuous rather than
compartmental. Scenarios A–E were run for 2025-05-25 → 2027-06-05 (742 daily ticks;
origin date 2025-06-08 = tick 14), 15 stochastic replicates per scenario.

**Calibration (53 weeks, 2025-06-07 → 2026-06-06, NHSN via the hub target data).** The model
reproduces the summer-2025 and winter-2025-26 waves at roughly the right size and shape:
all-age weekly admissions ratio model/observed **0.85**, MAPE 36%; deaths ratio **0.70**.
The age split is the main residual error — 0-64 is 1.12× observed and 65+ is 0.72×, i.e.
the model's admissions are too flat across age. The summer-2025 peak lands ~4 weeks early
and the model does not reproduce the late-February 2026 shoulder in the observed series.
Files: `test-output32/analysis/data/VA-*-regular-error-metrics.csv`,
`.../VA-*-regular-observed-vs-model-weekly.csv`, figures `fig02`, `fig06`, `fig24`.

**Projected dynamics.** Both projection years are dominated by a **large late-summer wave**:
the peak week is 2026-08-29 in every scenario (~224–250 admissions/week in VA), ahead of a
smaller winter 2026-27 wave (~100–174/week, peaking mid-January to early February 2027).

**Scenario effects (VA, mean over replicates, post-divergence window 2026-02-15 → 2027-06-05).**

| vs. A (no vax after mid-Feb 2026) | B usual/annual | C usual/+spring | D high/annual | E high/+spring |
|---|---|---|---|---|
| admissions | −9.2% | −10.5% | −22.1% | −25.7% |
| deaths | −9.2% | −12.2% | −24.5% | −26.7% |
| infections | −4.4% | −4.7% | −14.6% | −15.2% |

Broken out by wave (admissions vs. A): **summer 2026** B −2.9%, C −5.2%, D −9.6%, E −15.3%;
**winter 2026-27** B −17.5%, C −18.1%, D −40.1%, E −41.8%.

Two results stand out:

1. **The coverage axis dominates the frequency axis.** Moving from usual to aspirational
   coverage is worth −14.2% of post-divergence admissions (D vs. B), while adding the
   spring high-risk booster is worth −1.4% (C vs. B) or −4.7% (E vs. D).
2. **The spring booster does what it was designed to do, but the effect is small.** Its
   benefit is concentrated in the summer 2026 wave (C vs. B −2.3%, E vs. D −6.3%) and has
   essentially washed out by winter 2026-27 (C vs. B −0.8%, E vs. D −2.8%).

Peak weekly admissions are largely insensitive to scenario in summer 2026 (A 247, B 250,
C 233, D 238, E 224 — the A/B difference is within replicate noise); only E lowers the summer
peak appreciably (−9.3% vs. A). Winter 2026-27 peaks separate more cleanly (A 174, B 136,
C 141, D 103, E 100).

Sources: `test-output32/analysis/comparison/VA-scenario-reduction-vs-A.csv`,
`VA-scenario-summary.csv`, `VA-scenario-trajectories-weekly.csv`, and the plots in
`test-output32/submission/UVA-escape-covid/plots/`.

**Scope and uncertainty — read before using the intervals.** This submission covers
**Virginia (FIPS 51) only**; the input pipeline and run harness are built for 49 states
(`escape-covid19-smh/scripts/run_all_states_scnB.py`). Replicates differ **only by random
seed** — there is no parameter ensemble — so the CV of total admissions across replicates
is 0.7–1.2% and the reported quantiles are stochastic spread alone. They understate true
projection uncertainty and should not be read as predictive intervals.

## Explanation of observed dynamics given model assumptions

**Why vaccination effects are modest.** In this population immunity is overwhelmingly
infection-derived. At t=0, 57.6% of agents carry an infection in the reconstruction window
against 17.6% carrying a dose, and the model then generates a ~31%/year attack rate
(`VA-B-regular-attack-rate.csv`). A vaccination campaign therefore adds protection on top of a
large, continuously refreshed pool of infection-derived immunity, and its marginal effect on
transmission is correspondingly small. The effect on *severe outcomes* is larger than on
infections (−9.2% admissions vs. −4.4% infections for B) because doses are concentrated in
the 65+ and high-risk strata that carry the hospitalization risk.

**Why the spring booster helps the summer wave and not the winter wave.** Realized
vaccine protection in the model wanes to ~0 by 9–12 months post-dose
(`fig21-observed-vaccine-effectiveness`), so by August 2026 the fall-2025 dose is spent. A
February–August 2026 booster is therefore fresh going into the summer wave — but it reaches
only high-risk agents at half the fall coverage, and it carries the *prior* formulation, so
it refreshes the waning clock without any immune-escape benefit. It is also largely waned
again by January 2027. Hence a visible summer-2026 effect and a near-null winter effect.

**Why coverage beats frequency.** The D-vs-B contrast changes how many people are dosed in
*both* seasons and in every stratum, while the C/E spring campaign changes only the timing
of a second dose in one stratum. With per-dose protection short-lived, dose count wins.

**Why the summer wave dominates.** Seasonal forcing is a state-specific two-wave (summer +
winter) function fitted to NHSN admissions; for Virginia the summer component is the larger
of the two, and it is further amplified relative to winter by `winter_seasonality_scale = 0.7`,
a calibration lever adopted because the unattenuated fit over-produced the winter wave.

**Known biases.** (i) Admissions are too flat across age. A 4096-point Sobol sweep over seven
parameters (`covid19-round20/notebooks/sweep/`, run `test-output31`) showed the age tilt is
structural — no swept parameter moved it (|Spearman ρ| ≤ 0.06) because none of them touched
`hosp_prob` — which motivated the `hosp_prob_65p_scale` lever now in the model.
(ii) Infections are concentrated in school-age children (5-17: 1.35 infections/person/year,
88% ever infected over two years) because the contact network is activity-based; this is why
the severity ladder is fit against the model's own realized infection age-distribution rather
than against population. (iii) Deaths run ~30% below observed.

## Model assumptions: please describe:

### Number/type of immune classes considered
None in the compartmental sense. Disease states are `S, V, E, I, A, H, D, R` (V is a one-tick
vaccination event, not a protected class; A = asymptomatic infectious). Protection is a
continuous per-agent function of three clocks — `last_infection_tick`, `last_vax_tick`,
`last_vax_formulation_tick` — combining a waning term and an escape term, evaluated at every
susceptibility and severity decision. E is infectious (relative infectivity 0.4; I = 1.0,
A = 0.5). R is a temporary refractory pool with a Normal(35, 7)-day dwell before returning to
S, which puts a ~39-day floor on reinfection.

### Initial distribution of susceptibility (if available)
Reconstructed per agent, then loaded from `covid19-round20/data/person/VA-person.parquet`
(9 columns, built by `escape-covid19-smh/analyses/immune_history/run_person_parquets.py`).
At tick 0 in VA: 57.6% have an infection in the reconstruction window (median 435 days
before start), 17.6% a dose (median 211 days), and 34.9% neither. By time since the most
recent immunizing event: 0-3 mo 5.0%, 3-6 mo 12.3%, 6-9 mo 16.1%, 9-12 mo 3.9%, >12 mo 27.7%,
none 34.9%. Agents are also placed mid-episode rather than all in S: 88,494 in R, 4,957 in
E/I/A, 15 in H, 88 in D (`current_state.py`; the H census is anchored to the observed NHSN
census, 13–15 against an NHSN-derived estimate of ~11).

### Initial variant characteristics (transmissibility of variants at t=0, and how uncertainty or non-identifiability was handled)
No explicit variants. A single circulating strain with continuous antigenic drift represented
by the immune-escape term. Transmissibility is a single per-contact parameter,
`tau = baseline_tau + tau_seasonality_scale × cur_seasonality`, applied through a Wells-Riley
dose response on per-edge contact duration (`cdose = 3.198e-04`). Non-identifiability between
transmissibility and escape was handled by **fixing escape at the round's suggested midpoint
(35%/year)** and fitting `baseline_tau`. The Sobol sweep confirmed `baseline_tau` is the
dominant parameter (importance 1.96 vs. ≤0.058 for everything else) and pinned it to
0.0108–0.0145; production uses 0.014.

### Details about calibration of immunity at t=0 (calibration period considered, assumptions about/fitting of past immune escape and waning immunity, is the same calibration process used for all scenarios?)
The initial condition is reconstructed, not fitted as free parameters, and it is **identical
for all five scenarios** (one person file per state), so scenarios are paired at t=0.
- *Infection history* (`escape-covid19-smh/analyses/immune_history/infection_history.py`):
  NHSN weekly admissions back to 2023 are converted to infections through a fitted age-band
  IHR and assigned to individual agents as a last-infection date. The 2024-05→2024-11 NHSN
  reporting gap is repaired in three tiers (surviving NHSN observation / state backfill
  rescaled onto the NHSN level / imputed from a national donor curve) with per-week provenance.
- *Vaccination history* (`.../vax_history.py`): the Round-20 scenario-A coverage curve shifted
  back 364 days to stand in for the 2024-25 season, sampled by state × age × risk. Known
  one-sided bias: 2025-26 uptake was ~25% below 2024-25, so pre-simulation vaccine-derived
  immunity is understated.
- *Natural history at t=0* (`.../current_state.py`): each recent infection is forward-simulated
  through the same state machine the simulator uses, so agents start mid-episode.
Past escape and waning are not fitted; they use the same forward-model parameters below,
applied to the reconstructed dates.

### Details about modeling of immune escape after t=0 (including what is the level of immune escape considered, whether a stepwise or continuous escape was considered and how immune escape affects infection- and vaccine-induced immunity)
Continuous, constant-rate escape at **35% per year** (`immune_escape_per_day = 0.9988205`,
the midpoint of the round's 20–50% range). Escape multiplies both susceptibility protection
and severity protection: `ve *= (1 − immune_escape)`. The escape clock is
`max(last_infection_tick, last_vax_formulation_tick)` — a natural infection resets escape to
the infection date, while a dose only resets it to that formulation's date. Formulations are
annual (2025-06-01 for the 2025-26 fall campaign, 2026-06-01 for 2026-27), so a dose given in
January is already discounted by escape accrued since the previous June. The C/E spring 2026
booster is assigned the **2025-06-01** formulation, so it refreshes waning but confers no
escape benefit — matching the round specification.

### Assumptions regarding waning immunity against infection and symptoms (including values used for the duration and level of protection against infection or symptomatic disease, whether a point estimate was used or a range, and distribution used)
Exponential, half-life **5 months** (`infection_waning_per_day = 0.9953897`), applied to the
`max(last_infection_tick, last_vax_tick)` clock. A **point estimate**, not sampled; identical
for vaccine- and infection-derived immunity, as the round requests. Susceptibility is
`1 − infection_ve × (1 − waning) × (1 − escape)`. Note a deviation from the round's guidance:
waning is continuous **to zero** rather than to a 40–60% plateau; the median waning time is
within the requested 3–10 month window.

### Assumptions regarding waning immunity against severe disease (including whether immunity against severe disease, conditional on infection, is fixed vs declines over time; and if it wanes, specify how)
It declines, on a separate and slower clock: exponential with half-life **10 months**
(`hosp_waning_per_day = 0.9976922`), exactly half the infection-waning rate, applied to the
`hosp_ve` term inside `hosp_prob()`. Same functional form and same clock source; escape is
applied on top.

### Assumptions regarding boosting effect from multiple infections
No explicit boosting or dose-response accumulation. A new infection resets both the waning and
the escape clocks to full protection dated at that infection, so repeated infection maintains
protection but does not raise its ceiling. Only the most recent immunizing event counts (the
model takes `max(...)` of the infection and vaccination clocks). Reinfection is additionally
blocked for ~39 days by the E→I/A→R→S pathway.

### Is vaccination assumed to prevent infection and/or transmissibility?
Yes to infection: `infection_ve` reduces per-agent susceptibility, so vaccination prevents
infection and therefore reduces onward transmission indirectly (and produces indirect
protection for the unvaccinated). There is **no** separate reduction of infectiousness given
a breakthrough infection — a vaccinated agent that is infected transmits like anyone else in
the same state. Protection against hospitalization given infection is a separate multiplier
(`hosp_ve`) inside `hosp_prob()`. Configured values are `infection_ve = 0.75` and
`hosp_ve = 0.10`; these are model *inputs*, deliberately set above the round's stated targets
so that the **realized** effectiveness matches them. Measured inside a scenario-B run by an
exposure-matched cohort analysis (`fig21`), realized VE in the first months after a dose is
~54% against infection and ~55% against hospitalization, decaying to ~0 by 9–12 months —
i.e. on target at campaign start (46% infection / 55% hospitalization) and waning thereafter.

### How is re-vaccination of individuals handled in scenarios where high-risk individuals can be vaccinated twice a year (eg, is a spring dose only given to individuals who had a prior fall dose)?
Doses are campaign-tagged (`last_vax_campaign`), and an agent can receive at most one dose per
campaign; there is no within-campaign double dosing (audited by `check_vaccination()`, results
in `VA-*-regular-vaccination-check.json`). **The spring dose is *not* conditioned on a prior
fall dose.** The spring campaign draws from high-risk agents in the target age band who are in
S or A and have not yet been dosed in campaign 2, independent of their fall-campaign status.
This is a deviation from the round text ("only individuals already vaccinated during the main
campaign receiving a second dose") and, if anything, spreads the spring doses over a slightly
broader group than intended, since fall and spring uptake are modelled as uncorrelated.
Implementation: `escape-covid19-smh/analyses/vaccination/vax_schedule.py`, `vaccinate_nodes()`
in the ESL.

### Are vaccination curves used as provided, or was there any adjustment made?
Used as provided, converted to schedulable events. The hub's weekly cumulative coverage curves
(state × age × risk) are differenced on the *rounded cumulative* value (so realized cumulative
coverage tracks the target with no rounding drift) and multiplied by **synthetic-population**
stratum denominators rather than census denominators to match the synthetic population used which 
is slightly out of sync with current census figures.  Fall campaigns use the overall age bands; the spring campaign uses the
`18-49 highrisk`, `50-64 highrisk` and `65+` curves. Doses apply to agents in S or A (asymptomatic)
so realized doses undershoot the schedule slightly when prevalence is high. Realized coverage
is audited per run (`VA-*-regular-vaccination-check.csv`).

### Was there any adjustment made to scenario specifications beyond vaccine coverage?
No changes to the scenario axes. Three implementation choices are worth stating:
(i) the high-risk flag is synthesized as `(age ≥ 65) OR Bernoulli(state chronic-condition rate,
~0.18–0.25)`, because the synthetic population carries no comorbidity flag — it reproduces the
right marginal but is independent of age-within-band, household and network position;
(ii) the spring dose is uncorrelated with fall uptake (above);
(iii) VE inputs are set so that realized VE, not nominal VE, matches the round's targets (above).

### How are projections generated for the retrospective period (June 2025-May 2026)?
Identically to the prospective period — one continuous simulation from 2025-05-25 to
2027-06-05, with no re-anchoring or nudging to observed data mid-run. All five scenarios
share the observed 2025-26 campaign, so they are identical in expectation until 2026-02-15
and differ only by stochastic seed over the retrospective year (visible in the table above:
scenario differences over 2025-26 are ≤1.5% and within replicate noise). The retrospective
year is what the model calibration targets; ticks 0–13 are a burn-in dropped before the
origin date, during which pre-scheduled burn-in infections (9,807 agents in VA) keep the
E→I→H pipeline fed and infectivity is scaled by a ramp.

### Describe the process used to set or calibrate disease severity, ie P(hosp given current infection) and P(death given current infection) details. What are the datasets used for calibration of the death targets?
- **P(hospitalization)** is implemented as a CHR = P(hosp | symptomatic case), applied at the
  I→H transition (past the 50/50 E→I/A split), so P(hosp | infection) = 0.5 × CHR. It is a
  continuous 5-year-band age ladder (0.000512 at 0-4 up to 0.109021 at 85+) built by
  `escape-covid19-smh/analyses/immune_history/outcome_probs.py`: the CDC-2023 age
  rate-ratio **shape**, distributed inside a coarse 0-64/65+ total anchored to the observed
  NHSN 65+ admission share (0.67), against the model's **own realized infection
  age-distribution** (necessary because the contact network puts ~half of infections in 5-17).
  Adults 18-64 are split by risk at RR = 3 (`hosp_prob_hr_high = 2.099`,
  `hosp_prob_hr_low = 0.700`, population-weighted mean 1); 65+ are all high-risk in the
  synthetic population. Two calibration levers sit on top: `hosp_prob_scale` (level) and
  `hosp_prob_65p_scale` (age gradient), both 1.0 in this run.
- **P(death)** is implemented as a CFR = P(death | hospitalization), so deaths follow
  admissions with a fitted 3–14 day hospital-to-death delay distribution. The level is
  time-varying by state, month and age bucket, read from
  `covid19-round20/data/death-prob/{STATE}-death-prob.parquet`, produced by a two-stage
  Bayesian hierarchical model of the hospitalization:death ratio
  (`escape-covid19-smh/analyses/hosp_death_ratios/run_hosp_death.py`: stage A a national age
  contrast, stage B a partially-pooled state ratio with an annual trend). A fine within-bucket
  age factor from the CDC death/hosp ratio is applied multiplicatively, normalized so the
  bucket mean is preserved.
- **Death calibration datasets**: the hub's `target-data/time-series.csv` (`inc death`,
  all-age — there is no state-level age split for deaths), plus
  `covid19-round20/data/fluview/fluview_deaths_state.csv` and
  `fluview_deaths_national_by_age.csv` for the national age contrast (65+ ≈ 88% of COVID
  deaths). Realized fit: 0.70× observed deaths over the 53-week overlap
  (`VA-B-regular-observed-vs-model-deaths-weekly.csv`).

### Describe seasonality implementation, e.g., whether seasonality varies by geography, what is the function used to model seasonal forcing, and which datasets are used to fit seasonal parameters
Seasonality is **state-specific** and additive on transmissibility:
`tau = baseline_tau + tau_seasonality_scale × cur_seasonality(t)`, with `cur_seasonality(t)`
a daily [0,1] shape supplied per state in `covid19-round20/data/seasonality/{STATE}-seasonality.parquet`
(all 742 ticks present; a missing tick would silently fall through to the trough).
The shape comes from a **two-wave (summer + winter) seasonal model**, analytic in day-of-year,
fitted hierarchically to NHSN weekly admissions across 51 jurisdictions
(`escape-covid19-smh/analyses/two_wave_forcing/`, converted by `seasonality_parquet.py`). Two
design points: only the seasonal *shape* is carried across — the ~45%/year decline in
hospitalizations is a severity trend the ABM generates endogenously and must not be
double-counted in transmissibility — and the min-max normalization reference is computed
**across all regions**, so a single global `tau_seasonality_scale` preserves the 1.21×–1.38×
between-state amplitude heterogeneity the hierarchical fit estimated (VA spans ~[0.12, 0.82]).
Amplitude is therefore a calibrated ESL config, not a property of the file. A winter-window
lever, `winter_seasonality_scale = 0.7` over ticks 150–374 and again +365 days, damps the
winter wave without refitting the parquet. The Sobol sweep found `tau_seasonality_scale` pressed
against the top of its swept range (0.01); production uses 0.0125, above that range.

### What is the calibration period used to fit the model? Are there any adjustments made to the reported NHSN hospitalization data?
**2025-06-08 → 2026-06-06 (53 epiweeks)**, against the hub's `target-data/time-series.csv`
`inc hosp` series for all-age (`0-130`) plus the `0-64` / `65-130` split, keyed by FIPS
through `auxiliary-data/data-locations/locations.csv`. Objective: relative RMSE on weekly
admissions, evaluated jointly on all-age, 0-64 and 65+. Calibration proceeded in two stages —
a manual sequence of single-parameter runs (`covid19-round20/test-output-versions.md` is the
version-by-version log) followed by a 4096-point Sobol sweep over 7 parameters
(`covid19-round20/notebooks/sweep/`, `sweep_extract.py` → `sweep_score.py` → `sweep_explore.py`,
run archived as `test-output31`).

**No adjustment is made to reported NHSN data in the fitting.** The only repair anywhere in the
pipeline is in the *initial-condition reconstruction*, which needs weekly hospitalizations back
to 2023 and therefore has to cross the 2024-05→2024-11 reporting-gap; those weeks are filled
tier-wise (state-authority backfill rescaled onto the NHSN level where available, otherwise a
national donor curve scaled to the state's own level) with per-week provenance recorded.

### Details about modeling of age-specific outcomes, including assumptions on age-specific parameters (e.g., susceptibility, infection hospitalization risk or fatality risk, VE)
- **Susceptibility**: no age term. Age heterogeneity in infection comes entirely from the
  activity-based contact network (contact counts and durations), which concentrates infection
  in school-age children.
- **Hospitalization risk**: 5-year-band age ladder as described above (~1,300× from the
  5-17 minimum to 85+).
- **Fatality risk**: age-bucketed CFR level (0-64 / 65+, time-varying by state and month) with
  a fine within-bucket CDC-derived age factor (0.08 at 0-4 → 1.52 at 85+).
- **VE**: **not** age-differentiated, per the round's recommendation.
- Realized run (scenario B, VA, two years): admissions/100k of 36 (0-4), 11 (5-17), 53 (18-49),
  95 (50-64), 437 (65+); hospital fatality 0.04% (0-4) to 9.0% (65+); 65+ = 58.7% of admissions
  against ~69% observed over the calibration window (`VA-B-regular-by-age-totals.csv`).

### Details about modeling of high-risk individuals, e.g., susceptibility and infection hospitalization risk or infection fatality risk, VE
High risk is defined as the round defines it: `(age ≥ 65) OR chronic condition`, with the
chronic-condition component drawn as an independent Bernoulli at the state rate read off the
hub's own high/low-risk curve populations (~0.18–0.25), because the synthetic population
carries no comorbidity flag. Consequences: 100% of 65+ are high risk; ~21.5% of adults 18-64
are. High-risk adults 18-64 carry a hospitalization multiplier of 2.099 against 0.700 for low
risk (RR = 3, the low end of the CDC 3–6× underlying-conditions range), with the
population-weighted mean held at 1 so the band total is unchanged. Susceptibility, infectivity
and VE are **not** differentiated by risk. The flag is used for scenario targeting (the C/E
spring booster and the 65+ campaign rows). Limitation: because the draw is independent of age,
household and network position, it reproduces the right marginal and nothing else.

### Is empirical data on human mobility or contact patterns used in the model?
Yes. The model runs on the EpiHiper synthetic population and activity-based contact network,
v2.4.0 (`/project/bii_nssac/EpiHiperSynPop/v2.4.0/from-alt-project/usa_va/`), which is built
from census microdata, activity surveys and land-use/location data; each contact edge carries
a **duration**, and transmission uses a Wells-Riley dose response on that duration. No
real-time mobility time series (e.g. cell-phone-derived) is used, and the network is static
over the projection period.

### Is there a background level of non pharmaceutical interventions?
No. No NPIs are represented, and no behavioural change is imposed over the projection period.
The only time-varying transmission terms are seasonality and accumulated population immunity.

### Is importation from other countries considered?
Not explicitly. A constant background introduction process stands in for all external seeding:
from tick 22 onward, each susceptible agent is infected with probability
`baseline_seed_prob = 1e-5` per day (in VA ≈ 74 infections/day, ~1% of all infection events).
It is uniform over the state — a spatial analysis (`covid19-round20/notebooks/spatial_spread_analysis.ipynb`)
found this continuous seeding partially homogenizes spatial spread, leaving regional peaks
~3 weeks apart rather than the wider fan-out a single early introduction would produce.

### Other updates in model assumptions from previous rounds (e.g., demographic dynamics, immune escape, severity)
This is a **new model for UVA's SMH participation** — previous rounds (through Round 19,
`UVA-adaptive`) used the PatchSim metapopulation compartmental model. Round 20 is the first
submission from ESCAPE-COVID, a full agent-based model on the synthetic population. What is
new relative to that lineage:
- Individual-level immune bookkeeping: per-agent infection, dose and formulation clocks, with
  waning and escape evaluated continuously rather than through discrete immune compartments.
- A reconstructed, per-agent initial condition (infection history, vaccination history and
  mid-episode disease state at t=0) rather than a fitted initial compartment split.
- Age-continuous severity (5-year-band CHR and a CFR age factor) fitted against the model's own
  realized infection age-distribution, replacing flat age-band hospitalization rates.
- A time-varying, state- and age-specific hospitalization:death ratio from a Bayesian
  hierarchical fit, replacing a recent-3-week death:hospitalization rescale.
- Explicit dose-level vaccination with campaign tagging, formulation-anchored immune escape,
  and per-agent dose timing.
No demographic dynamics (births, deaths from other causes, ageing) are modelled over the
two-year horizon.
