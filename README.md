# Data and code to recreate the figures from "Assessing the safety of new germicidal far-UVC technologies"
Welcome to the repository for our publication "Assessing the Safety of New Germicidal Far-UVC Technologies." This repository houses all the data and R code necessary to recreate the figures featured in our publication.

In line with the principles of open science and open data, we are committed to transparency about our research process. By sharing our code and data, we aim to make our research more accessible, reproducible, and verifiable. We also acknowledge that errors can occur, and public scrutiny can help improve our work.

We warmly welcome any feedback or questions. If you identify any mistakes or improvements in our code or data, please do not hesitate to contact us. 

# A guide to this repository:
- "data" contains all the necessary data files (.xls or .csv) to create the plots
- "figure scripts" contains the R code to create the plots
- "figure image files" contains the plotted .png or .svg files

## Figures and data sources
![Figure 1: b) Solar radiation spectra for sea level (blue) and extraterrestrial conditions (orange) in the UV and Visible range. The sea level spectrum (blue) is derived from the ASTM G173-03 standard (NREL 2003), representing conditions on a sun-facing surface tilted at 37°, with an air mass of 1.5. The extraterrestrial spectrum (orange) comes from the ASTM E490-00a standard, which describes conditions outside of Earth's atmosphere (zero air mass) (NREL 2000). Data is sourced from the National Renewable Energy Laboratory (NREL).](./figure image files/combined_solarplot.svg)


## About renv:

renv is an R package that helps to make R projects more isolated, portable, and reproducible. It does this by creating an isolated, project-specific library for R packages, and by tracking the exact versions of packages that your project uses.

### Why We Use renv:

In this repository, we use renv to ensure that anyone who clones the project can easily recreate the exact R environment that was used to develop and run the code. This makes it easier to run the code on different machines and helps to avoid issues that can arise when different versions of packages have different behaviors or bugs.

### How renv Works:

When you clone this repository and open the R project for the first time, renv will recognize that it's in a project with a lockfile (renv.lock) and offer to restore the project library. If you agree, renv will install the packages and versions listed in the lockfile into the project-specific library.

When running the code, R will use the packages from this project-specific library rather than from your user- or system-wide library. This means that the versions of the packages used by the project are fixed and won't be affected by updates to packages in your personal library.

To learn more about renv, see its [documentation](https://rstudio.github.io/renv/articles/renv.html).
