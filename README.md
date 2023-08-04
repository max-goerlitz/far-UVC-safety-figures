# Data and code to recreate the figures from "Assessing the safety of new germicidal far-UVC technologies"
Welcome to the repository for our publication "Assessing the Safety of New Germicidal Far-UVC Technologies." This repository houses all the data and R code necessary to recreate the figures featured in our publication.

In line with the principles of open science and open data, we are committed to transparency about our research process. By sharing our code and data, we aim to make our research more accessible, reproducible, and verifiable. We also acknowledge that errors can occur, and public scrutiny can help improve our work.

We warmly welcome any feedback or questions. If you identify any mistakes or improvements in our code or data, please do not hesitate to contact us (hello [at] maxgoerlitz [dot] com). 


# A guide to this repository:
- "data" contains all the necessary data files (.xls or .csv or .dat) to create the plots
- "figure scripts" contains the R code to create the plots
- "figure image files" contains the plotted .png or .svg files
- "figures edited in biorender or inkscape" contains image files that were Created with BioRender.com or were edited using Inkscape

## Figures and data sources
![Electromagnetic spectrum with Extraterrestrial and sea level solar radiation](./figures%20edited%20in%20biorender%20or%20inkscape/combined_EM_spectrum_and_solar_radiation.svg)


Figure 1: a) Far-UVC on the electromagnetic spectrum, adapted from (Blatchley et al. 2022). b) Solar radiation spectra for sea level (blue) and extraterrestrial conditions (orange) in the UV and Visible range. The sea level spectrum (blue) is derived from the ASTM G173-03 standard (NREL 2003), representing conditions on a sun-facing surface tilted at 37°, with an air mass of 1.5. The extraterrestrial spectrum (orange) comes from the ASTM E490-00a standard, which describes conditions outside of Earth's atmosphere (zero air mass) (NREL 2000). Data is sourced from the National Renewable Energy Laboratory (NREL).
- The ASTM E-490 Reference is available [here](https://www.nrel.gov/grid/solar-resource/spectra-astm-e490.html).
- The ASTM G-173 Reference is available [here](https://www.nrel.gov/grid/solar-resource/spectra-am1.5.html)

![ACGIH, erythema and NMSC action spectra](./figure%20image%20files/acgih_erythema_nmsc_one_panel.png)

Figure 2: ACGIH 2022 UV hazard action spectrum for the eyes (black, solid) and skin (black, dot-dashed) (ACGIH 2022), international standardized erythema reference action spectrum (orange, dashed) (ISO/CIE 2019), and international standardized action spectrum for non-melanoma skin cancer (NMSC) (blue, dotted) (ISO/CIE 2016). The figure is adapted from an International Commission on Illumination (CIE) technical report and has been updated to reflect the revised ACGIH guidelines (CIE 2010). The erythema action spectrum was multiplied by a factor of 0.3 and the NMSC action spectra by a factor of 0.15. This reduction by a constant allows for an accurate comparison of the action spectra, since keeping all spectra normalized to 1 would be misleading. The factor of 0.3 for the erythema action spectrum was chosen because a standard erythemal dose is equivalent to an erythemal radiant exposure of 10 mJ/cm<sup>2</sup>, which corresponds to the ACGIH TLV at 240 nm that has a relative spectral effectiveness of 0.3. As can be seen, this aligns with the 2022 ACGIH UV action spectrum for the skin in the 250-300 nm range. The factor of 0.15 for the NMSC action spectrum was chosen so that it aligns with the erythema action spectrum.
- The ACGIH TLV&reg; and BEI Documentation can be bought [here](https://portal.acgih.org/s/store#/store/browse/detail/a154W00000DqsbCQAR).
- The ISO/CIE 17166:2019 Erythema reference action spectrum and standard erythema dose Documentation can be bought [here](https://www.iso.org/standard/74167.html).
- The ISO/CIE 28077:2016 Photocarcinogenesis action spectrum (non-melanoma skin cancers) Documentation can be bought [here](https://www.iso.org/standard/69651.html).

![Protein absorption](./figure%20image%20files/protein_absorption.png)

Figure 3: Mean absorption coefficient and standard deviation for six proteins: bovine a-chymotrypsinogen, bovine immunoglobulin-c, horse hemoglobin, lysozyme, human immunoglobulin-c, and human serum albumin. Data is derived from Kreusch et al. (2003).
- Protein absorption data is available here: https://github.com/lennijusten/protein-absorbance

![Skin penetration](./figures%20edited%20in%20biorender%20or%20inkscape/skin_penetration_based_on_Guttmann_data_edited_in_biorender_v2.png)

Figure 4: Skin penetration depth of UV between 200 and 300 nm, based on a Monte Carlo ray tracing simulation using absorption & scattering coefficients derived from measurements in ex vivo human skin. The lines indicate depths where only 50%, 10%, and 1% of light intensity persists, considering absorption and scattering. The modeled epidermal thickness is 81 µm (stratum corneum: 16 µm; viable epidermis: 65 µm). Dermal-epidermal junction undulations are depicted for clarity but not included in the simulation. Data is from (Busch et al. 2023). Note: epidermal thickness varies with body region, age, sex, and other factors (Lintzeri et al. 2022).
- The figure can be copied and modified using BioRender.com [here](https://app.biorender.com/illustrations/649d49179a284fcf5b4a2e27).

![Combined eye figure](./figures%20edited%20in%20biorender%20or%20inkscape/combined_eye_figure_created_with_biorender.png)

Figure 5: Ocular anatomy, a) frontal, b) lateral, c) enlarged view of corneal anatomy, and d) tear film structure.
- The figure can be copied and modified using BioRender.com [here](https://app.biorender.com/illustrations/646ba149e8bd00ff10f9580f).

![ACGIH, erythema and NMSC action spectra in four panels](./figure%20image%20files/ACGIH_erythema_nmsc_four_panels.png)

Figure S1: a) ACGIH 2022 UV hazard action spectrum for the eyes and skin (ACGIH 2022), b) International standardized erythema reference action spectrum (ISO/CIE 2019), c) International standardized action spectrum for non-melanoma skin cancer (NMSC) (ISO/CIE 2016) on a semi-logarithmic scale, and the same on a d) linear scale.
- The ACGIH TLV and BEI Documentation can be bought [here](https://portal.acgih.org/s/store#/store/browse/detail/a154W00000DqsbCQAR).
- The ISO/CIE 17166:2019 Erythema reference action spectrum and standard erythema dose Documentation can be bought [here](https://www.iso.org/standard/74167.html).
- The ISO/CIE 28077:2016 Photocarcinogenesis action spectrum (non-melanoma skin cancers) Documentation can be bought [here](https://www.iso.org/standard/69651.html).

![Protein and DNA absorption](./figure%20image%20files/protein_and_dna_absorption.png)

Figure S2: a) Mean absorption coefficient and standard deviation for six proteins: bovine a-chymotrypsinogen, bovine immunoglobulin-c, horse hemoglobin, lysozyme, human immunoglobulin-c, and human serum albumin. Data is derived from Kreusch et al. (2003). b) UV absorption coefficients of the four primary nucleobases in DNA: adenine (A) (black, solid) cytosine (C) (blue, dotted), guanine (G) (yellow, dashed), and thymine (T) (orange, dot-dashed). Data is derived from Kowalski (2009, 26).
- Protein absorption data is available here: https://github.com/lennijusten/protein-absorbance
- DNA absorption data is available here: https://github.com/lennijusten/DNA-absorbance


## About renv:

renv is an R package that helps to make R projects more isolated, portable, and reproducible. It does this by creating an isolated, project-specific library for R packages, and by tracking the exact versions of packages that your project uses.

### Why We Use renv:

In this repository, we use renv to ensure that anyone who clones the project can easily recreate the exact R environment that was used to develop and run the code. This makes it easier to run the code on different machines and helps to avoid issues that can arise when different versions of packages have different behaviors or bugs.

### How renv Works:

When you clone this repository and open the R project for the first time, renv will recognize that it's in a project with a lockfile (renv.lock) and offer to restore the project library. If you agree, renv will install the packages and versions listed in the lockfile into the project-specific library.

When running the code, R will use the packages from this project-specific library rather than from your user- or system-wide library. This means that the versions of the packages used by the project are fixed and won't be affected by updates to packages in your personal library.

To learn more about renv, see its [documentation](https://rstudio.github.io/renv/articles/renv.html).
