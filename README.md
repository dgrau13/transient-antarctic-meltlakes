# transient-antarctic-meltlakes

Code to reproduce Grau et al. (2026) Preprint.  Danielle K. Grau, Mattia Poinelli, Nicole Jeane Schlegel, Helene Seroussi, and Alexander A. Robel Accelerated Antarctic Ice Loss in Simulations with Calving Driven by Hydrofracture under Supraglacial Melt Lakes, 22 June 2026, PREPRINT (Version 1) available at TBD.

## [Grau2025-SGLParams](https://github.com/dgrau13/transient-antarctic-meltlakes/tree/main/Grau2025_SGLParams)

MATLAB functions for the supraglacial melt lake parameterizations from [Grau et al., (2025) *Nature Communications*](https://www.nature.com/articles/s41467-025-61798-8)

[wd_param.m](https://github.com/dgrau13/transient-antarctic-meltlakes/blob/main/Grau2025_SGLParams/wd_param.m)

[wl_param](https://github.com/dgrau13/transient-antarctic-meltlakes/blob/main/Grau2025_SGLParams/wl_param.m)


## [ISSM_Runs](https://github.com/dgrau13/transient-antarctic-meltlakes/tree/main/ISSM_Runs)

[ISMIP6_DC.m](https://github.com/dgrau13/transient-antarctic-meltlakes/blob/main/ISSM_Runs/ISMIP6_DC.m) - ISSM Run Script for Dry Crevasse Calving Scenario

[ISMIP6_KF.m](https://github.com/dgrau13/transient-antarctic-meltlakes/blob/main/ISSM_Runs/ISMIP6_KF.m) - ISSM Run Script for Kill Floating Ice Calving Scenario

[ISMIP6_NC.m](https://github.com/dgrau13/transient-antarctic-meltlakes/blob/main/ISSM_Runs/ISMIP6_NC.m) - ISSM Run Script for Negligible Calving Scenario

[ISMIP6_SNM.m](https://github.com/dgrau13/transient-antarctic-meltlakes/blob/main/ISSM_Runs/ISMIP6_SNM.m) - ISSM Run Script for Snow Melt Forcing Scenario

[ISMIP6_WD.m](https://github.com/dgrau13/transient-antarctic-meltlakes/blob/main/ISSM_Runs/ISMIP6_WD.m) - ISSM Run Script for Mean Supraglacial Meltwater Depth Calving Scenario

[ISMIP6_WL.m](https://github.com/dgrau13/transient-antarctic-meltlakes/blob/main/ISSM_Runs/ISMIP6_WL.m) - ISSM Run Script for Mean Supraglacial Melt Lake Depth Calving Scenario

## Other 

[SNM_nc.m](https://github.com/dgrau13/transient-antarctic-meltlakes/blob/main/SNM_nc.m) - Integrated Snow Melt Flux from [Trusel et al., (2015)](https://www.nature.com/articles/ngeo2563) and [Seroussi et al., (2024)](https://agupubs.onlinelibrary.wiley.com/doi/10.1029/2024EF004561) spatial interpolated to ISSM Mesh. 

[RoughnessMeshConfig.m](https://github.com/dgrau13/transient-antarctic-meltlakes/blob/main/RoughnessMeshConfig.m) - Statistical surface roughness parameters from [Grau et al., (2025)](https://www.nature.com/articles/s41467-025-61798-8) spatially interpolated to ISSM Mesh.

[SGL_Params.m](https://github.com/dgrau13/transient-antarctic-meltlakes/blob/main/SGLParams.m) - Calculating statistical supraglacial meltwater depth and lake depth forcings

[ISMIP6_ModelOutputs.m](https://github.com/dgrau13/transient-antarctic-meltlakes/blob/main/ISMIP6_ModelOutputs.m) - Compiling and extracting model outputs (from [ISSM_Runs](https://github.com/dgrau13/transient-antarctic-meltlakes/tree/main/ISSM_Runs)) necessary for plotting 

[PaperFigure.m](https://github.com/dgrau13/transient-antarctic-meltlakes/blob/main/PaperFigure.m) - Plotting model outputs 

