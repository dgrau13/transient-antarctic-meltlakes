%Necessary Directories and Paths
addpath(genpath('/Users/dgrau13/Library/CloudStorage/Box-Box/Research/dgrau_ISSM'));
addpath(genpath("/Users/dgrau13/ISSM-meltlakes"));
%%
%Loading Glacial Surface Roughness Statistics and Surface Snow Melt
%configured from ISSM Antarctic Mesh
load('/Users/dgrau13/Library/CloudStorage/Box-Box/Research/dgrau_ISSM/Output/251003/ISMIP6_RoughnessGrid.mat')
load('/Users/dgrau13/Library/CloudStorage/Box-Box/Research/dgrau_ISSM/Output/251001/surface_snow_melt_UKESM1-0-LL_1850-2300_ISMIP6Mesh.mat')
%%
%Calculating Mean Supraglacial Water Depth and Lake Depth 
mean_wl = wl_param(H,sigma,snm(1:end-1,:));
mean_wd = wd_param(H,sigma,snm(1:end-1,:));

%Adding Additional Row for Model Time Steps
mean_wl = [mean_wl; time];
mean_wd = [mean_wd; time];
%%
%Test Plots for Calculated Supraglacial Melt Water and Lake Depth
%Calculations
loadmodel('Antarctic2.RunUKESM_SSP585Calving')
plotmodel(md,'data',mean_wl(1:end-1,1),'colormap',cmocean('ice'),'colorbarYlabel','Mean Lake Depth (m)','caxis#1',[0 1], ...
    'data',mean_F(1:end-1,1),'colormap',cmocean('ice'),'colorbarYlabel','Mean Area Fraction','caxis#2',[0 0.15], ...
    'data',mean_wd(1:end-1,1),'colormap',cmocean('ice'),'colorbarYlabel','Mean Water Depth (m)','caxis#3',[0 1])
%%
%Export Calculated Supraglacial Melt Lake Parameters
save("ISMIP6_SGLParams","mean_wl","mean_wd");
