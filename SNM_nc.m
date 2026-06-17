addpath(genpath('/Users/dgrau13/Library/CloudStorage/Box-Box/Research/dgrau_ISSM'));
addpath(genpath("/Users/dgrau13/ISSM-meltlakes"));
%%
%Loading Snow Melt Flux from Seroussi et al., 2024 and extracting necessary
%parameters
ncid = netcdf.open('surface_snow_melt_UKESM1-0-LL_1850-2300_4km.nc','NC_NOWRITE');
time = netcdf.getVar(ncid,0);
lat = netcdf.getVar(ncid,3);
lon = netcdf.getVar(ncid,1);
snm = netcdf.getVar(ncid,5);
netcdf.close(ncid);
%%
% Vectorizing and Building Snow Melt Flux Vector 
lat = lat(:);
lon = lon(:);
snm_new = nan(length(lat),length(time));
for i = 1:length(time)
    snm_temp = snm(:,:,i);
    snm_new(:,i) = snm_temp(:);
end
snm = snm_new;
clear snm_temp snm_new
%%
%Converting Latitude and Longitude to South Polar Sterographic coords.
[x,y] = ll2ps(lat,lon);
clear lat lon ncid i 
%%
%Loading Antarctic Simulation from Seroussi et al., 2024.
loadmodel('Antarctic2.RunUKESM_SSP585Calving')
% md.results.TransientSolution(1).time = 2015;
%%
%Building new vector of snow melt flux with same size as ISSM Mesh 
snm_list = snm;
clear snm
snm = zeros(length(md.mesh.x),length(time));
%%
%Building Annually inegrated snow melt vector 
for i=1:length(time)
    snm(:,i) = griddata(x,y,snm_list(:,i),md.mesh.x,md.mesh.y);
end
%%
%Converting units from mm to meters and extracting model run years
snm(isnan(snm))=0;
snm = snm./1000;
snm = snm(:,164:end);
%%
%Exporting Surface Snow Melt Mesh
save("surface_snow_melt_UKESM1-0-LL_1850-2300_ISMIP6Mesh.mat","time","snm");
