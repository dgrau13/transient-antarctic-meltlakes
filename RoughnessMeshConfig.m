%Statistical Glacial Surgace Roughnes for ISSM 
issm_dir = '/storage/project/r-arobel3-0/dgrau7/ISSM';
addpath ([issm_dir '/lib/'],[issm_dir,'/bin/'],[issm_dir,'/src/m/dev/']);
addpath(genpath(issm_dir));
addpath(genpath('storage/home/hcoda1/4/dgrau7/scratch/ISMIP6'))
run devpath;

%Model Output from Seroussi et al., (2024)
loadmodel([issm_dir '_Runs/ISMIP6/ISMIP6Antarctic2.RunUKESM_SSP585Calving']);

%Loading necessary packages 
addpath(genpath('/storage/project/r-arobel3-0/dgrau7/ATM'));
addpath(genpath('/storage/project/r-arobel3-0/dgrau7/ATM2'));
%%
%Extracting Mesh Elements from the model
x_mesh = md.mesh.x;
y_mesh = md.mesh.y;
clear md
%%
%Loading statistical Antarctic surface roughness from Grau et al., (2025)
load Antarctica_FractalRoughness.mat %Latitude, Longitude, Hurst, Roughness Amplitude (σ)
[x_list,y_list] = ll2ps(lat_list,lon_list); %Converting Lat-Lon into South Polar Stereographic 
clear lat_list lon_list 
%%
%Interpolating surface roughness parameter into ISSM mesh 
H = griddata(x_list,y_list,H_list,x_mesh,y_mesh);
sigma = griddata(x_list,y_list,sigma_list,x_mesh,y_mesh);
%%
clear H_list x_list y_list sigma_list
%%
save("ISMIP6_RoughnessGrid_Test.mat","H","sigma","-v7.3")
