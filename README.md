THESIS WORK AVAILABLE UNDER: https://lutpub.lut.fi/handle/10024/168086 

# ClimateSet Superemulation Reproduction Repo

Recently, [Kaltenborn et al.](https://climateset.github.io/) introduced [ClimateSet](https://climateset.github.io/), enabling ML engineers to access consistent data from climate models in the Input4MIPs and CMIP6 Archives. This data can be used for various tasks such as predicting more specific climate scenarios, downscaling, or multi-model emulation (Superemulation). Superemulation can potentially benefit climate modeling by significantly speeding up multi-model forecasting and enhancing the representation of the actual climate system through effective model combination. However, scaling up the number of climate models has led to resource problems, especially when scaling up to 36 models.

## Project Overview

This project aims to design a Climate Model Superemulation that can emulate 36 Climate Models within one machine learning model. This will be done using a Convolutional LSTM, a U-Net, and a transformer-based architecture, while profiling various performance metrics. The scaling impact of various optimization techniques will be analyzed experimentally, while also considering potential sustainability handprints and footprints involved with ML-based Climate Emulation. Performance experiments will be conducted using a 6-model Superemulation, analyzing the scaling impact before and after using various scaling techniques on a 36-model Superemulation.

## Results

The results show a drastic reduction in GPU/CPU utilization, increased accuracy, and model speed-ups of up to 70% compared to the setup used for previous Superemulations. Similar improvements were made for the environmental footprints, decreasing the overall energy used for training the models. This work enables the Superemulation of all 36 CMIP6 Climate Models included in ClimateSet, paving the way for future work on Superemulation approaches and opening a discussion on the usefulness and sustainability of ML-based Emulation approaches.

## Usage

To reproduce the experiments, simply 
1. Clone the ClimateSet repo and follow the .Readme there
2. Drop the Scaling_Experiments folder into the ClimateSet/emulator/configs/experiment/... folder
3. Execute the respective Slurm file from the ClimateSet/... folder
4. The DataScience .ipynb files are specific for the experiments run for the Superemulator Scaling experiments, If you would like to run them for one of your experiments, simply edit the first code block of the .ipynb files so that you get the data from your Wandb run through their API 
