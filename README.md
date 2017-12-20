# SOLO
Welcome to the repository for the SOLO artifical neural network code.

## Citation
The SOLO ANN is fully described in Hsu et al (2002) and this article should be cited whenever the SOLO ANN is used.  The full citation for this paper is:

Kuo-lin Hsu, Hoshin V. Gupta, Xiaogang Gao, Soroosh Sorooshian and Bisher Imam: Self-organising linear output map (SOLO): An artificial neural network suitable for hydrologic modelling and analysis, Water Resources Research, Vol. 38, No. 12, DOI:10.1029/2001WR000795, 2002

## Description
SOLO is a type of artifical neural network (ANN) that combines a self-organising feature map (SOFM), principle component analysis and multivariate linear regression to produce a network architecture that is robust, stable and gives predictions of high quality.  Although originally developed for applications in hydrology, SOLO has also been successfully applied to the prediction of the ecosystem fluxes of sensible heat, latent heat and CO2.

SOLO consists of 3 components:
1. SOFM - the self-organising feature map
1. SOLO - the multivariate linear regression model
1. SEQSOLO - the output module that provides the ANN predictions

The 3 components are written in C/C++.  This repository provides the source code (see the **source** directory), examples of the information files used to control the operation of each component (see the **inf** directory), examples of the input files required by each component (see the **data** directory) and some documentation for using the SOLO ANN.

## Installation
You will need to compile the source code availabloe from this repository in order to use SOLO.  Make files are provided in the source directories and have been tested using the GNU Compiler Collection (gcc V4.8.4 under Ubuntu 14.04 64 bit).

To install SOLO:
1. clone this repository using the command "git clone https://github.com/<Kuolin_user_name>/SOLO.git"
1. navigate to each of the source/sofm, source/solo and source/seqsolo directories and build the SOFM, SOLO and SEQSOLO components using the make files provided.
1. copy the executable files created to a working directory e.g. SOLO/bin.

## Using SOLO
The input files required by each of the 3 components (SOFM, SOLO and SEQSOLO) are:
1. SOFM
   1. sofm.inf - information file containing parameters controlling the operation of SOFM, the format of this file is described in notes towards the end of the file.
   1. sofm_input.csv - input data file, comma separated values, no header lines, contains **only** the driver variables (ie does not contain the target variable) and contains only records where there is valid data for all driver variables **and** the target variable (no missing data allowed in this file)
1. SOLO
   1. solo.inf - information file containing parameters controlling the operation of SOLO, the format of this file is described in notes towards the end of the file.
   1. solo_input.csv - input data file, comma separated values, no header lines, contains the driver variables in the same order as the sofm_input.csv file **and** with the target variable added as the last column, contains only records where there is valid data for all driver variables **and** the target variable (no missing data allowed in this file)
1. SEQSOLO
   1. seqsolo.inf - information file containing parameters controlling the operation of SEQSOLO, the format of this file is described in notes towards the end of the file.
   1. seqsolo_input.csv - input data file, comma separated alues, no header lines, contains the driver variables in the same order as the sofm_input.csv file **and** with the target variable added as the last column, contains records where there is valid data for all driver variables **but** the target variable may be present or missing.
   1. learningrate.inf - information file containing the learning rate for SEQSOLO (must be between 0.0 and 1.0) and the number of iterations for which to run SEQSOLO

For further information on the file formats see the readme files in SOLO/docs.

## Running SOFM, SOLO and SEQSOLO
The 3 components must be run in order: SOFM first, then SOLO and finally SEQSOLO.

The typical work flow for running the components is as follows:
1. prepare the input data file according to the rules given above;
   1. SOFM input contains only drivers, no missing data
   1. SOLO input contains drivers (same order as SOFM input) with target added as last column, no missing data
   1. SEQSOLO input contains drivers (same order as SOFM input) with target added as last column, no missing data in drivers
1. edit the information file;
   1. set the number of nodes, this must be the same in all 3 information files, note that the total number of nodes used by SOFM will be nNodes x nNodes and execution time will increase dramatically as nNodes increases.
   1. set the number of iterations
   1. set the file paths to point to the input data files
   1. set the output file paths to point to an existing directory
1. run the component with the information file name given on the command line;
   1. ./sofm sofm.inf
   1. ./solo solo.inf
   1. ./seqsolo seqsolo.inf

For further information on running the SOLO components see the readme files in SOLO/docs.
