%MODEL OUTPUT COMPILER
%Adding ISSM Folder andn Data Folder into path 
addpath(genpath('/Users/dgrau13/Library/CloudStorage/Box-Box/Research/dgrau_ISSM'));
addpath(genpath("/Users/dgrau13/ISSM-meltlakes-fork"));
%%
%Compiling all necessary data for all calving scenarios from each model
%realization
%DC - Dry Crevasse
loadmodel('ISMIP6TransientCrevasse');
md_dc.IceVolume = [md.results.TransientSolution(:).IceVolume];
md_dc.time = [md.results.TransientSolution(:).time];
md_dc.IceVolumeAboveFloatation = [md.results.TransientSolution(:).IceVolumeAboveFloatation];
md_dc.FloatingIceArea = [md.results.TransientSolution(:).FloatingArea];
md_dc.Thickness = [md.results.TransientSolution(:).Thickness];
md_dc.mask = md.mask.ice_levelset;
md_dc.icelevelset = [md.results.TransientSolution(:).MaskIceLevelset];
md_dc.oceanlevelset = [md.results.TransientSolution(:).MaskOceanLevelset];
md_dc.BasalForcingsFloatingIceMeltRate = [md.results.TransientSolution(:).BasalforcingsFloatingiceMeltingRate];
md_dc.SMB = [md.results.TransientSolution(:).SmbMassBalance];
md_dc.surface = [md.results.TransientSolution(:).Surface];
md_dc.base = [md.results.TransientSolution(:).Base];
md_dc.time_step = md.timestepping.time_step;
md_dc.water_height = md.calving.water_height;
clear md
save("ISMIP6_DC.mat","md_dc","-v7.3")

%KF - Kill Floating 
loadmodel('ISMIP6BasalForcing500m');
md_kf.IceVolume = [md.results.TransientSolution(:).IceVolume];
md_kf.time = [md.results.TransientSolution(:).time];
md_kf.IceVolumeAboveFloatation = [md.results.TransientSolution(:).IceVolumeAboveFloatation];
md_kf.Thickness = [md.results.TransientSolution(:).Thickness];
md_kf.FloatingIceArea = [md.results.TransientSolution(:).FloatingArea];
md_kf.mask = md.mask.ice_levelset;
md_kf.icelevelset= [md.results.TransientSolution(:).MaskIceLevelset];
md_kf.oceanlevelset = [md.results.TransientSolution(:).MaskOceanLevelset];
md_kf.BasalForcingsFloatingIceMeltRate = [md.results.TransientSolution(:).BasalforcingsFloatingiceMeltingRate];
md_kf.SMB = [md.results.TransientSolution(:).SmbMassBalance];
md_kf.surface = [md.results.TransientSolution(:).Surface];
md_kf.base = [md.results.TransientSolution(:).Base];
md_kf.time_step = md.timestepping.time_step;
clear md
save("ISMIP6_KF.mat","md_kf","-v7.3")

%SNM - Snow Melt Flux
loadmodel('ISMIP6TransientSNM_dynamic');
md_snm.IceVolume = [md.results.TransientSolution(:).IceVolume];
md_snm.time = [md.results.TransientSolution(:).time];
md_snm.IceVolumeAboveFloatation = [md.results.TransientSolution(:).IceVolumeAboveFloatation];
md_snm.Thickness = [md.results.TransientSolution(:).Thickness];
md_snm.FloatingIceArea = [md.results.TransientSolution(:).FloatingArea];
md_snm.mask = md.mask.ice_levelset;
md_snm.icelevelset= [md.results.TransientSolution(:).MaskIceLevelset];
md_snm.oceanlevelset = [md.results.TransientSolution(:).MaskOceanLevelset];
md_snm.BasalForcingsFloatingIceMeltRate = [md.results.TransientSolution(:).BasalforcingsFloatingiceMeltingRate];
md_snm.SMB = [md.results.TransientSolution(:).SmbMassBalance];
md_snm.water_height = md.calving.water_height;
md_snm.surface = [md.results.TransientSolution(:).Surface];
md_snm.base = [md.results.TransientSolution(:).Base];
md_snm.time_step = md.timestepping.time_step;
md_snm.water_height = md.calving.water_height;
save("ISMIP6_SNM.mat","md_snm","-v7.3")
clear md

%WL - Mean Lake Depth 
loadmodel('ISMIP6TransientParams_dynamic');
md_wl.IceVolume = [md.results.TransientSolution(:).IceVolume];
md_wl.time = [md.results.TransientSolution(:).time];
md_wl.IceVolumeAboveFloatation = [md.results.TransientSolution(:).IceVolumeAboveFloatation];
md_wl.Thickness = [md.results.TransientSolution(:).Thickness];
md_wl.FloatingIceArea = [md.results.TransientSolution(:).FloatingArea];
md_wl.icelevelset = [md.results.TransientSolution(:).MaskIceLevelset];
md_wl.oceanlevelset = [md.results.TransientSolution(:).MaskOceanLevelset];
md_wl.mask = md.mask.ice_levelset;
md_wl.BasalForcingsFloatingIceMeltRate = [md.results.TransientSolution(:).BasalforcingsFloatingiceMeltingRate];
md_wl.SMB = [md.results.TransientSolution(:).SmbMassBalance];
md_wl.water_height = md.calving.water_height;
md_wl.surface = [md.results.TransientSolution(:).Surface];
md_wl.base = [md.results.TransientSolution(:).Base];
md_wl.time_step = md.timestepping.time_step;
md_wl.water_height = md.calving.water_height;
save("ISMIP6_WL.mat","md_wl","-v7.3")
clear md

%WD - Mean Water Depth 
loadmodel('ISMIP6TransientParams_wd');
md_wd.IceVolume = [md.results.TransientSolution(:).IceVolume];
md_wd.time = [md.results.TransientSolution(:).time];
md_wd.IceVolumeAboveFloatation = [md.results.TransientSolution(:).IceVolumeAboveFloatation];
md_wd.Thickness = [md.results.TransientSolution(:).Thickness];
md_wd.FloatingIceArea = [md.results.TransientSolution(:).FloatingArea];
md_wd.mask = md.mask.ice_levelset;
md_wd.icelevelset= [md.results.TransientSolution(:).MaskIceLevelset];
md_wd.oceanlevelset = [md.results.TransientSolution(:).MaskOceanLevelset];
md_wd.BasalForcingsFloatingIceMeltRate = [md.results.TransientSolution(:).BasalforcingsFloatingiceMeltingRate];
md_wd.SMB = [md.results.TransientSolution(:).SmbMassBalance];
md_wd.water_height = md.calving.water_height;
md_wd.surface = [md.results.TransientSolution(:).Surface];
md_wd.base = [md.results.TransientSolution(:).Base];
md_wd.time_step = md.timestepping.time_step;
md_wd.water_height = md.calving.water_height;
save("ISMIP6_WD.mat","md_wd","-v7.3")
clear md

%NC - No Calving 
loadmodel('Antarctic2.RunUKESM_SSP585Calving');
md_nc.IceVolume = [md.results.TransientSolution(:).IceVolume];
md_nc.time = [md.results.TransientSolution(:).time];
md_nc.IceVolumeAboveFloatation = [md.results.TransientSolution(:).IceVolumeAboveFloatation];
md_nc.Thickness = [md.results.TransientSolution(:).Thickness];
md_nc.FloatingIceArea = [md.results.TransientSolution(:).FloatingArea];
md_nc.mask = md.mask.ice_levelset;
md_nc.icelevelset= [md.results.TransientSolution(:).MaskIceLevelset];
md_nc.oceanlevelset = [md.results.TransientSolution(:).MaskOceanLevelset];
md_nc.BasalForcingsFloatingIceMeltRate = [md.results.TransientSolution(:).BasalforcingsFloatingiceMeltingRate];
md_nc.SMB = [md.results.TransientSolution(:).SmbMassBalance];
md_nc.surface = [md.results.TransientSolution(:).Surface];
md_nc.base = [md.results.TransientSolution(:).Base];
md_nc.time_step = md.timestepping.time_step;
save("ISMIP6_NC.mat","md_nc","md","-v7.3")