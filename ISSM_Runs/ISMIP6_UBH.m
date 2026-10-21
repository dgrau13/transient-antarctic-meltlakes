step = 1;loadonly=0;
issm_dir = '/storage/project/r-arobel3-0/dgrau7/ISSM-meltlakes';
addpath([issm_dir '/bin'], [issm_dir '/lib']);
codepath = [issm_dir '/bin'];
execpath = [issm_dir '/execution'];
etcpath = [issm_dir, '/etc'];
%addpath([issm_dir]);
org = organizer('repository','ISMIP6','prefix','ISMIP6','steps',step);
%addpath(['storage/home/hcoda1/4/dgrau7/scratch/ISMIP6'])
addpath(['/storage/project/r-arobel3-0/dgrau7/ISSM-Runs'])

numnodes = 1;
coresrequested =12;
memrequested = 16; %GB
timesrequested = 60*24*1; %minutes
mycluster = pace('numnodes',numnodes,'np',coresrequested,'login','dgrau7','codepath',codepath,'executionpath',execpath,'mem',memrequested,'time',timesrequested);

if perform(org,'ISMIP6Crevasse_UpperBound1cm')
md = loadmodel(org,'Antarctic2.RunUKESM_SSP585Calving');
load("/storage/project/r-arobel3-0/dgrau7/ISSM-Runs/surface_snow_melt_UKESM1-0-LL_1850-2300_ISMIP6Mesh.mat");
md.timestepping.time_step = 1/12.;
md.settings.output_frequency = 12;
md.calving = calvingcrevassedepth();
md.calving.crevasse_threshold =1;
md.calving.crevasse_opening_stress = 1;
md.calving.water_height = snm;
%md.timestepping.interp_forcing =1;
md.settings.solver_residue_threshold = 1000;
md.levelset.reinit_frequency = 1;
md.miscellaneous.name = 'UpperBound_CrevaseDepth1cm';
md.cluster = mycluster;
md = solve(md,'tr','runtimename',false,'loadonly',loadonly);

if loadonly
    md=loadresultsfromcluster(md);
    savemodel(org,md);
end
end
