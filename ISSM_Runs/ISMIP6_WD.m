%MEAN SUPRAGLACIAL MELTWATER DEPTH (WD)----ISSM RUN Script 
%Steps & Load Only: 0 - Run Simulation, 1 - Compile Model Output 
step = 1;loadonly=1;

%Loading Directories and Configuring ISSM 
issm_dir = '/storage/project/r-arobel3-0/dgrau7/ISSM';
addpath([issm_dir '/bin'], [issm_dir '/lib']);
codepath = [issm_dir '/bin'];
execpath = [issm_dir '/execution'];
org = organizer('repository','ISMIP6','prefix','ISMIP6','steps',step);
addpath(['/storage/project/r-arobel3-0/dgrau7/ISSM_Runs'])

%PACE Calbriation and Job Specs
numnodes = 1;
coresrequested =12;
memrequested = 16; %GB
timesrequested = 60*24*1; %minutes
mycluster = pace('numnodes',numnodes,'np',coresrequested,'login','dgrau7','codepath',codepath,'executionpath',execpath,'mem',memrequested,'time',timesrequested);

if perform(org,'ISMIP6_WD')
md = loadmodel(org,'Antarctic2.RunUKESM_SSP585Calving');
load("/storage/project/r-arobel3-0/dgrau7/ISSM_Runs/ISMIP6_SGLParams.mat")
md.timestepping.time_step = 1/12.;
md.settings.output_frequency = 12;
md.calving = calvingcrevassedepth();
md.calving.crevasse_threshold =1;
md.calving.crevasse_opening_stress = 1;
md.calving.water_height = mean_wd;
md.settings.solver_residue_threshold = 1000;
md.levelset.reinit_frequency = 1;
md.miscellaneous.name = 'TransientParams_WD';
md.cluster = mycluster;
md = solve(md,'tr','runtimename',false,'loadonly',loadonly);

if loadonly
    md=loadresultsfromcluster(md);
    savemodel(org,md);
end
end