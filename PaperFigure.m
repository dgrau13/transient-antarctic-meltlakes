%PAPER FIGURES PLOTTING SCRIPT
%Adding ISSM Folder andn Data Folder into path 
addpath(genpath('/Users/dgrau13/Library/CloudStorage/Box-Box/Research/dgrau_ISSM'));
addpath(genpath("/Users/dgrau13/ISSM-meltlakes-fork"));
%%
%Loading Model Outputs 
load('ISMIP6_NC');
load('ISMIP6_KF'); 
load('ISMIP6_DC');
load('ISMIP6_SNM');
load('ISMIP6_WD');
load('ISMIP6_WL');
%%
%Correcting Initial Time Step
md_kf.time(1) = 2015;
md_wd.time(1) = 2015;
md_wl.time(1) = 2015;
md_dc.time(1) = 2015;
md_snm.time(1) = 2015;
md_nc.time(1) = 2015;
%%
%Calculating Constant to convert to SLR eq. m 
time = round([md_nc.time]-md_nc.time(1));
oceans_area = (166000000+82000000+73600000+35000000+12173000)*(1000^2);
p_fw = 1000;
p_gl = 917;
c = (p_fw/p_gl)/oceans_area;
%%
%Plotting ∆Ice Volume and ∆Ice Above Floatation Volume
%∆Ice Volume
nIDs = 4;
alphabet = ('a':'z').';
chars = num2cell(alphabet(1:nIDs));
chars = chars.';
charlbl = strcat('(',chars,')'); % {'(a)','(b)','(c)','(d)'}
fig = figure(1);
fig.Position = [1,1,1077,2000];
tiledlayout(3,1,"TileSpacing","tight")
nexttile;
hold on;
plot(md_nc.time,(md_nc.IceVolume-md_nc.IceVolume(1))/1000^3,'k-',LineWidth=3)
plot(md_nc.time,(md_kf.IceVolume-md_kf.IceVolume(1))/1000^3,'k--',LineWidth=3)
fill([md_nc.time,flip(md_nc.time)],[(md_kf.IceVolume-md_kf.IceVolume(1))/1000^3,flip((md_nc.IceVolume - md_nc.IceVolume(1))/1000^3)],[1 1 1]*0.8, 'EdgeColor','none','FaceAlpha',0.5)
plot(md_nc.time,(md_dc.IceVolume-md_dc.IceVolume(1))/1000^3,LineWidth=3)
plot(md_nc.time,(md_snm.IceVolume-md_snm.IceVolume(1))/1000^3,'-.',LineWidth=3)
plot(md_nc.time,(md_wd.IceVolume-md_wd.IceVolume(1))/1000^3,'--',LineWidth=3)
plot(md_nc.time,(md_wl.IceVolume-md_wl.IceVolume(1))/1000^3,LineWidth=3)
legend({'NC', 'KF', 'NC-KF', 'DC','SNM','WD','WL'},'Location','eastoutside')
xlabel("Time (years)")
xlim([2015 2301]);
ylabel("∆ Ice Volume (km^3)")
text(0.925,0.9,charlbl{1},'Units','normalized','FontSize',30,FontWeight='bold')
set(gca,fontsize=20)
hold off

%Ice Volume Above Floatation 
nexttile;
hold on
plot(md_nc.time,(md_nc.IceVolumeAboveFloatation-md_nc.IceVolumeAboveFloatation(1))/1000^3,'k-',LineWidth=3)
plot(md_nc.time,(md_kf.IceVolumeAboveFloatation - md_kf.IceVolumeAboveFloatation(1))/1000^3,'k--',LineWidth=3)
fill([md_nc.time,flip(md_nc.time)],[(md_kf.IceVolumeAboveFloatation-md_kf.IceVolumeAboveFloatation(1))/1000^3,flip((md_nc.IceVolumeAboveFloatation - md_nc.IceVolumeAboveFloatation(1))/1000^3)],[1 1 1]*0.8, 'EdgeColor','none','FaceAlpha',0.5)
plot(md_nc.time,(md_dc.IceVolumeAboveFloatation-md_dc.IceVolumeAboveFloatation(1))/1000^3,LineWidth=3)
plot(md_nc.time,(md_snm.IceVolumeAboveFloatation-md_snm.IceVolumeAboveFloatation(1))/1000^3,'-.',LineWidth=3)
plot(md_nc.time,(md_wd.IceVolumeAboveFloatation-md_wd.IceVolumeAboveFloatation(1))/1000^3,':',LineWidth=3)
plot(md_nc.time,(md_wl.IceVolumeAboveFloatation-md_wl.IceVolumeAboveFloatation(1))/1000^3,LineWidth=3)
xlim([2015 2301]);
xlabel("Time (years)")
ylabel("∆ Ice Volume Above Flotation (km^3)")
legend({'NC', 'KF','NC-KF', 'DC','SNM','WD','WL'},'Location','eastoutside')
yyaxis right
ylabel('Sea Level Rise (m w. eq.)')
ax2 = gca;
ax2.YAxis(2).Limits = (ax2.YAxis(1).Limits)*c*1000^3;
ax2.YAxis(2).TickValues = [-2.5:0.5:0];
ax2.YAxis(2).TickLabels = {2.5, 2, 1.5, 1, 0.5,0};
ax2.YColor = 'k';
% title('∆ Ice Volume Above Floatation (2015-2301)')
text(0.925,0.9,charlbl{2},'Units','normalized','FontSize',30,FontWeight='bold')
set(gca,fontsize=20)
hold off

%Floating Ice Area
nexttile;
hold on
plot(md_nc.time,md_nc.FloatingIceArea/1000^2,'k-',LineWidth=3)
plot(md_nc.time,md_kf.FloatingIceArea/1000^2,'k--',LineWidth=3)
fill([md_nc.time,flip(md_nc.time)],[md_nc.FloatingIceArea/1000^2,flip(md_kf.FloatingIceArea/1000^2)],[1 1 1]*0.8, 'EdgeColor','none','FaceAlpha',0.5);
plot(md_nc.time,md_dc.FloatingIceArea/1000^2,LineWidth=3)
plot(md_nc.time,md_snm.FloatingIceArea/1000^2,LineWidth=3)
plot(md_nc.time,md_wd.FloatingIceArea/1000^2,LineWidth=3)
plot(md_nc.time,md_wl.FloatingIceArea/1000^2,LineWidth=3)
xlim([2015 2301]);
xlabel("Time (years)")
ylabel("Floating Ice Area (km^2)")
legend({'NC','KF','NC-KF','DC','SNM','WD','WL'},'Location','eastoutside')
% title('Floating Ice Area (2015-2301)')
text(0.925,0.9,charlbl{3},'Units','normalized','FontSize',30,FontWeight='bold')
set(gca,fontsize=20)
hold off
%%
%Calculating changes in ice volume and floating ice area for each model realization
%∆Ice Volume
IceVol.nc = ((md_nc.IceVolume(end)-md_nc.IceVolume(1)))/1000^3;
IceVol.dc = ((md_dc.IceVolume(end)-md_dc.IceVolume(1)))/1000^3;
IceVol.snm = ((md_snm.IceVolume(end)-md_snm.IceVolume(1)))/1000^3;
IceVol.wd = ((md_wd.IceVolume(end)-md_wd.IceVolume(1)))/1000^3;
IceVol.wl = ((md_wl.IceVolume(end)-md_wl.IceVolume(1)))/1000^3;
IceVol.kf = ((md_kf.IceVolume(end)-md_kf.IceVolume(1)))/1000^3;

%∆Ice Volume Above Flotation 
IceVolAbFlo.nc = ((md_nc.IceVolumeAboveFloatation(end)-md_nc.IceVolumeAboveFloatation(1))*c);
IceVolAbFlo.dc = ((md_dc.IceVolumeAboveFloatation(end)-md_dc.IceVolumeAboveFloatation(1))*c);
IceVolAbFlo.snm = ((md_snm.IceVolumeAboveFloatation(end)-md_snm.IceVolumeAboveFloatation(1))*c);
IceVolAbFlo.wd = ((md_wd.IceVolumeAboveFloatation(end)-md_wd.IceVolumeAboveFloatation(1))*c);
IceVolAbFlo.wl = ((md_wl.IceVolumeAboveFloatation(end)-md_wl.IceVolumeAboveFloatation(1))*c);
IceVolAbFlo.kf = ((md_kf.IceVolumeAboveFloatation(end)-md_kf.IceVolumeAboveFloatation(1))*c);

%Floating Ice Area @ t = 2301
FloatArea.nc = md_nc.FloatingIceArea(end)/1000^2;
FloatArea.dc = md_dc.FloatingIceArea(end)/1000^2;
FloatArea.snm = md_snm.FloatingIceArea(end)/1000^2;
FloatArea.wd = md_wd.FloatingIceArea(end)/1000^2;
FloatArea.wl = md_wl.FloatingIceArea(end)/1000^2;
FloatArea.kf = md_kf.FloatingIceArea(end)/1000^2;

%%
%∆Ice Thickness (t=2301) from DC
 plotmodel(md,'figure',3,'data',(md_snm.Thickness(:,end)-md_dc.Thickness(:,end)),'colormap',flipud(cmocean('balance')),'caxis#1',[-1000 1000],'title','SNM','colorbarYlabel','∆ Ice Thickness (m)', 'fontsize',20, 'axis','off', 'scaleruler',[-1.5e6 -2e6 500e3 0.25e5 1], 'expdisp','SNM_GroundingLine.exp','expstyle','k-','figposition','fullscreen'); 
 set(gca,fontsize=20);
 plotmodel(md,'figure',4,'data',(md_wd.Thickness(:,end)-md_dc.Thickness(:,end)),'colormap',flipud(cmocean('balance')),'caxis#1',[-1000 1000],'title','WD','colorbarYlabel','∆ Ice Thickness (m)', 'fontsize',20, 'axis','off', 'scaleruler',[-1.5e6 -2e6 500e3 0.25e5 1], 'expdisp','WD_GroundingLine.exp','expstyle','k-','figposition','fullscreen');
 set(gca,fontsize=20);
 plotmodel(md,'figure',5,'data',(md_wl.Thickness(:,end)-md_dc.Thickness(:,end)),'colormap',flipud(cmocean('balance')),'caxis#1',[-1000 1000],'title','WL','colorbarYlabel','∆ Ice Thickness (m)', 'fontsize',20, 'axis','off', 'scaleruler',[-1.5e6 -2e6 500e3 0.25e5 1], 'expdisp','WL_GroundingLine.exp','expstyle','k-','figposition','fullscreen');
 set(gca,fontsize=20);
 plotmodel(md,'figure',6,'data',(md_kf.Thickness(:,end)-md_dc.Thickness(:,end)),'colormap',flipud(cmocean('balance')),'caxis#1',[-1000 1000],'title','KF','colorbarYlabel', '∆ Ice Thickness (m)','fontsize',20, 'axis','off', 'scaleruler',[-1.5e6 -2e6 500e3 0.25e5 1], 'expdisp','KF_GroundingLine.exp','expstyle','k-','figposition','fullscreen');
