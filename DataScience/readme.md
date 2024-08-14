# Data Science 
___

# RQ 1
The statistics files for RQ1 analyze the current performance and scaling of the Superemulator when running 6 and 36 models. Specifically, they test the Null hypothesis, which states that there is no significant difference between the mean performance distributions of using 6 climate models compared to 36 climate models.

The analysis covers the following key metrics:

- Memory Usage in GB (RAM)
- CPU Utilization
- GPU Utilization
- Execution Time
- Accuracy

> **RQ 1 - Conclusion/Summary**
>
> - **CPU/GPU Utilization**: Not scaling strongly but shifting distribution towards peak values and more multimodality (more for Climax, less for U-Net and ConvLSTM).
> - **Memory Utilization (RAM)**: Strong distribution shift during scaling, leading to a wider (much wider for Climax, less wide for U-Net and ConvLSTM) distribution for 36 models while centering around higher RSS-Memory amounts.
> - **Execution Time**: Almost linear scaling, with Climax having the lowest and U-Net and ConvLSTM the highest scaling factors.
> - **Accuracy**: Accuracy decreases slightly with the number of models, which will be evaluated in the discussion section.
>
> The hypothesis for RQ1 for all models has been rejected through two non-parametric tests, as the distributions show significant differences, which is also visible in the plots shown within this subsection.


# RQ 2
## RQ 2.1 Batchsize
The statistics files for RQ 2.1 analyze the impact of different batch sizes on execution time and accuracy. Specifically, they test the Null hypothesis, which posits that there exists at least one batch size that results in a shorter execution time without decreasing accuracy by more than 1% compared to the baseline.

The analysis focuses on the following metrics:

- Execution Time
- Accuracy

These statistics files provide a detailed comparison of how different batch sizes affect these metrics, helping to identify the optimal batch size that minimizes execution time while maintaining high accuracy.

> **RQ 2.1 - Conclusion/Summary**
>
> The various models respond differently to batch sizes. While the ConvLSTM shows the highest potential speedup, increasing the batch size also reduces accuracy. Both Climax models exhibit more unstable GPU utilization, resulting in only slightly better mean utilization, yet significantly decreased runtime. The U-Net reduces RMSE and execution time with increasing batch size.
>
> - **Execution Time**: Strong speedups of up to 42.96% for the ConvLSTM, with every model benefiting from an increased batch size regarding execution time.
> - **RMSE**: Decreased for every model except the ConvLSTM (0.18% decrease), with a maximum increase of 57.63% observed for the U-Net.
>
> The null hypothesis has been accepted, indicating that for each model, there exists a batch size that reduces execution time without increasing the baseline RMSE by more than 1%. The optimal batch sizes are as follows: Climax 16, Climax Frozen 8, U-Net 32, and ConvLSTM Model 4.


## RQ 2.2 A100
The statistics files for RQ2.2 analyze the impact of switching from an RTX8000 GPU to an A100 GPU on execution time and GPU utilization. Specifically, they test the Null hypothesis, which suggests an overall decrease in GPU utilization and a reduction in execution time when moving from the RTX8000 to the A100.

The analysis focuses on the following metrics:

- Execution Time
- GPU Utilization

These statistics files provide insights into how the A100 GPU influences these performance metrics compared to the RTX8000, offering a clear evaluation of the potential benefits of upgrading to the A100.

> **RQ 2.2  - Conclusion/Summary**
>
> The analysis reveals performance differences between A100 and RTX8000 GPUs. Despite a counterintuitive reduction in CPU utilization with the A100, there is a noticeable trend towards acceleration and an overall increase in GPU utilization. The U-Net model shows the most significant distribution shifts, whereas other models experience less pronounced changes. The use of the A100 architecture alters fundamental training behaviors, and reproducible results are not guaranteed across different PyTorch releases, individual commits, or platforms ([PyTorch Randomness Documentation](https://pytorch.org/docs/stable/notes/randomness.html)).
>
> - **Execution Time**: Generally reduced per epoch, with the U-Net showing the most significant speedup.
> - **A100 Utilization Integrals**: The utilization over time generally decreases when switching to the A100 GPU, with the strongest decrease observed for the U-Net.
>
> The null hypothesis has been rejected for the ConvLSTM model, as execution time increases slightly when changing the hardware architecture, although GPU utilization decreases. For all other models, the A100 clearly improves performance for both metrics, leading to the acceptance of the null hypothesis.


## RQ 2.3 - Mixed Precision Training  
The statistics files for RQ2.3 assess the impact of FP and Brain Floating Point (BFLOAT) Mixed Precision Training (MPT) on accuracy, memory utilization, and execution time. They specifically test the Null hypothesis that there is no significant difference in GPU memory usage, execution time, or accuracy when using FP/BFLOAT16 precision compared to the Control Group using FP32 precision.

The analysis includes the following metrics:

- Memory Utilization (RAM)
- Execution Time
- Accuracy

These statistics files evaluate the effectiveness and potential trade-offs of Mixed Precision Training with BFLOAT16, offering detailed insights into how it compares with standard FP32 precision.

> **RQ 2.3 - Conclusion/Summary**
>
> Switching to Mixed Precision Training results in increased RSS-Memory and GPU-Memory usage during training, yet reduces the overall memory footprint, possibly due to conversions between FP16 and FP32. Processing unit utilization decreases significantly, and while runtime improves, the RMSE shows only a minimal increase.
>
> - **GPU Memory Integral**: Slight decrease for Climax and U-Net, with a slight increase for Climax Frozen and ConvLSTM. The Climax Frozen model uses the least GPU memory for training.
> - **Training Time per Epoch**: Decreases for all models, with the U-Net experiencing the strongest relative speedup.
> - **Validation RMSE**: Slight increase for all models except the U-Net, which shows a slight decrease.
>
> The null hypotheses have been rejected as the values and integrals clearly change in both directions, except for the RMSE value for ConvLSTM, which remains roughly the same.


## RQ 2.4 - Pin Memory
The statistics files for RQ2.4 examine the effects of pinning memory on execution time and processing unit utilization. The analysis tests the Null hypothesis that pinning memory does not lead to a significant difference in CPU utilization or changes in execution time.

The metrics analyzed include:

- CPU Utilization
- Execution Time

These statistics files provide an evaluation of how memory pinning influences computational efficiency and resource usage, offering insights into its impact on overall performance.

> **RQ 2.4 - Conclusion/Summary**
>
> Pinning the memory leads to minor changes in mean CPU utilization, generally within 5% of the baseline, with the exception of the U-Net, which shows a 7.1% reduction. GPU utilization consistently increases with memory pinning, particularly for the Convolutional LSTM with a significant 15.62% increase. Other performance metrics such as RSS-Memory, GPU-Memory, and overall runtime are minimally affected, with a more positive impact observed on the U-Net and ConvLSTM models, and a less positive effect on the Climax models regarding runtime.
>
> - **CPU Utilization Integrals**: Increase for the Climax and U-Net models, while decreasing for Climax Frozen and ConvLSTM. The decrease is significant only for the ConvLSTM, with an 8% reduction.
> - **Per Epoch Training Execution Time**: Increases for the Climax-based models and decreases for the other two models, with a significant decrease of roughly 19% observed for the ConvLSTM model.
>
> The hypothesis has been accepted for all models except the ConvLSTM, where both CPU Utilization integrals and execution time show significant decreases after pinning the memory.


## RQ 2.5 - Number of Workers
The statistics files for RQ2.5 assess the impact of the number of workers on execution time while ensuring memory requirements are met. The analysis investigates the Null hypothesis that a specific number of worker processes can minimize execution time compared to the control group.

The metrics analyzed include:

- Memory Utilization (RAM)
- GPU Utilization
- Execution Time

These statistics files evaluate how varying the number of worker processes affects execution time and resource usage, providing insights into optimizing data loading processes.

> **RQ 2.5 - Conclusion/Summary**
>
> Adjusting the number of worker processes for data loading affects various performance metrics. Generally, the optimal number of workers is fewer than the number of available CPUs (four in this case). Increasing the number of workers reduces CPU utilization but does not significantly impact runtime, except for the Climax model with Frozen weights and the Convolutional LSTM, which benefit from parallelized data loading.
>
> - **Memory Utilization**: Not significantly affected by changing the number of workers, except for the ConvLSTM.
> - **GPU Utilization**: Remains roughly the same but generally increases slightly with more data loading processes.
> - **Execution Time**: Decreases most notably for the ConvLSTM and slightly for the Climax Frozen model, while increasing for the other two models.
>
> The hypothesis has been rejected for the U-Net and Climax model. However, performance improves for the Climax Frozen and ConvLSTM models when changing from 0 to 2 workers. All models remained within the specified memory requirements.


# RQ 3 - Scaling Impact
The statistics files for RQ3 examine how different models—ConvLSTM, UNET, and ClimaX—perform after the optimization process for 36 models. This analysis tests the Null hypothesis that there are no significant differences in the mean values of the given metrics between the baseline performance and the performance following the implementation of all treatments.

The metrics analyzed include:

- Memory Utilization (RAM)
- CPU Utilization
- GPU Utilization
- Execution Time
- Accuracy

These statistics files provide insights into the effectiveness of the optimization process on various models, assessing improvements in resource utilization and performance metrics.

> **RQ 3 - Conclusion/Summary**
>
> After implementing optimization techniques, CPU utilization decreased by approximately 80% across all models. GPU utilization decreased variably: Climax models saw a reduction of 75%, while ConvLSTM experienced only a 4% decrease. Runtimes significantly decreased, with Climax models reducing from 21 to 10 hours and U-Net from 8.3 to 2.5 hours. Validation accuracy notably increased for the U-Net, and RMSE values for other models decreased by around 50%. RSS-Memory increased as expected due to the multi-processing of the dataset.
>
> - **Memory Utilization (RAM)**: Increased significantly while maintaining a similar overall memory footprint.
> - **CPU Utilization**: Reduced by roughly 80% due to changes in GPU and precision.
> - **GPU Utilization**: Decreased most significantly for both Climax models and the U-Net, with no significant shift observed for ConvLSTM.
> - **Execution Time**: Reduced drastically, with the U-Net achieving the largest speed-up of 69%.
> - **Accuracy**: Improved significantly, with validation RMSE decreasing by 51-72%.
>
> The overall hypothesis has been rejected, as there are strong distribution shifts in both directions for each of the tested performance metrics.

# RQ 4 - Sustainability Assessment

The statistics files for RQ4 address the sustainability impacts associated with scaling the Superemulator, specifically evaluating the environmental footprints versus handprints. This analysis tests the Null hypothesis that there are no significant differences in the mean values of the given metrics between the baseline performance and the scaled implementation.

The metrics analyzed include:

- GPU Energy Consumption (Watts)
- CO2 Emissions (KG)

These statistics files provide a comprehensive assessment of the environmental impact of scaling the Superemulator, examining energy usage and carbon footprint to understand the sustainability implications.

> **RQ 4 - Conclusion/Summary**
>
> The analysis indicates that while A100 GPUs generally consume more power compared to RTX8000 GPUs, they result in a slightly lower GPU energy footprint due to their lower utilization and increased training time. Notably, reductions in KWHs are observed, particularly for the U-Net model, which consumes only about a quarter of the energy compared to baseline runs. Overall CO2 emissions were significantly reduced: 54% for Climax, 38.9% for Climax Frozen, 22.5% for ConvLSTM, and 71.3% for U-Net. Specifically, U-Net's optimization results in saving the equivalent of 117 sheets of paper or reducing tree sequestration time by 9 days. Mixed Precision Training showed the most improvement in energy and carbon footprint compared to other optimization techniques. Given that the Mila Cluster operates on hydro energy, the actual environmental footprints are minimal. However, using a standard energy mix would result in over 22 kg of CO2 emissions, equivalent to the annual absorption capacity of a mature tree.
>
> - **GPU Energy Consumption**: Decreases for all models, primarily due to changes in GPU architecture, increased training time (e.g., through batch size adaptation), and reduced GPU load (e.g., through mixed precision training).
> - **CO2 Consumption**: Shows a significant reduction, averaging a 46.675% decrease in emissions.



___
If you like to create an environment or you have any versioning problems, please use the Requirements.txt for the correct packages.