#  Geriatric Prescribing Cascade & PIM Screening Engine

This repository contains algorithmic logic for screening medication lists in older adults admitted to general medical wards, utilizing criteria from our 2026 polypharmacy review.

##  High-Alert Geriatric Prescribing Cascades
The screening engine targets classic prescribing cascades where a side effect is misidentified as a new medical condition:

1. **The NSAID Cascade:** NSAID usage ➡️ Elevated Blood Pressure ➡️ Addition of an Antihypertensive (e.g., Amlodipine).
2. **The Metoclopramide Cascade:** Metoclopramide usage ➡️ Drug-Induced Parkinsonism ➡️ Addition of Levodopa.
3. **The Cholinesterase Inhibitor Cascade:** Donepezil usage ➡️ Urinary Incontinence ➡️ Addition of Oxybutynin (Anticholinergic 🚫 - directly counteracts Alzheimer's therapy).

##  Repository Contents
* `README.md` - Clinical rationale and cascade definitions.
* `geriatric_screen.R` - *(Next Step)* R script executing screening logic.# geriatric-prescribing-cascade
Automated screening engine applying Beers Criteria (2023) and STOPP/START v3 logic to identify potentially inappropriate medications and prescribing cascades in geriatric general wards.
