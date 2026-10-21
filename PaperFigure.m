%PAPER FIGURES PLOTTING SCRIPT
%Adding ISSM Folder and Data Folder into path 
addpath(genpath('/Users/dannigrau/Library/CloudStorage/Box-Box/Research/transient-antarctic-lakes/Model_Outputs'));
%%
%Loading Model Outputs 
load('ISMIP6_NC'); 
load('ISMIP6_DC');
load('ISMIP6_SNM');
load('ISMIP6_WD');
load('ISMIP6_WL');
load('ISMIP6_UBH');
%%
%Correcting Initial Time Step
md_wd.time(1) = 2015;
md_wl.time(1) = 2015;
md_dc.time(1) = 2015;
md_snm.time(1) = 2015;
md_nc.time(1) = 2015;
md_ub.time(1) = 2015;
%%
%Calculating Constant to convert to SLR eq. m 
time = round([md_nc.time]-md_nc.time(1));
oceans_area = (166000000+82000000+73600000+35000000+12173000)*(1000^2);
p_fw = 1000;
p_gl = 917;
c = (p_fw/p_gl)/oceans_area;
%%
%Plotting ∆Ice Volume and ∆Ice Above Floatation Volume
%Ice Volume Above Flotation 
nIDs = 4;
alphabet = ('a':'z').';
chars = num2cell(alphabet(1:nIDs));
chars = chars.';
charlbl = strcat('(',chars,')'); % {'(a)','(b)','(c)','(d)'}
fig = figure(1);
fig.Position = [1146,137,2558,734];
tiledlayout(1,3,"TileSpacing","tight")
nexttile;
hold on
plot(md_nc.time,(md_nc.IceVolumeAboveFloatation-md_nc.IceVolumeAboveFloatation(1))/1000^3,'-',LineWidth=3,Color=[.7 .7 .7])
plot(md_nc.time,(md_ub.IceVolumeAboveFloatation - md_ub.IceVolumeAboveFloatation(1))/1000^3,'k-',LineWidth=3)
fill([md_nc.time,flip(md_nc.time)],[(md_ub.IceVolumeAboveFloatation-md_ub.IceVolumeAboveFloatation(1))/1000^3,flip((md_nc.IceVolumeAboveFloatation - md_nc.IceVolumeAboveFloatation(1))/1000^3)],[1 1 1]*0.8, 'EdgeColor','none','FaceAlpha',0.5)
plot(md_nc.time,(md_dc.IceVolumeAboveFloatation-md_dc.IceVolumeAboveFloatation(1))/1000^3,LineWidth=3)
plot(md_nc.time,(md_snm.IceVolumeAboveFloatation-md_snm.IceVolumeAboveFloatation(1))/1000^3,'-.',LineWidth=3)
plot(md_nc.time,(md_wd.IceVolumeAboveFloatation-md_wd.IceVolumeAboveFloatation(1))/1000^3,':',LineWidth=3)
plot(md_nc.time,(md_wl.IceVolumeAboveFloatation-md_wl.IceVolumeAboveFloatation(1))/1000^3,LineWidth=3)

xlim([2015 2301]);
xlabel("Time (years)")
ylabel("∆ Ice Volume Above Flotation (km^3)")
% legend({'NC', 'UBH','NC-UBH', 'DC','SNM','WD','WL'},'Location','eastoutside')
yyaxis right
ylabel('Sea Level Rise (m w. eq.)')
ax2 = gca;
ax2.YAxis(2).Limits = (ax2.YAxis(1).Limits)*c*1000^3;
ax2.YAxis(2).TickValues = [-9:0.75:0];
ax2.YAxis(2).TickLabels = {9, 8.25, 7.5, 6.75, 6, 5.25, 4.5, 3.75, 3, 2.25, 1.5, 0.75, 0};
ax2.YColor = 'k';
% title('∆ Ice Volume Above Floatation (2015-2301)')
text(0.85,0.075,charlbl{1},'Units','normalized','FontSize',30,FontWeight='bold')
set(gca,fontsize=20)
hold off

nexttile;
hold on
plot(md_nc.time,(md_nc.IceVolumeAboveFloatation-md_nc.IceVolumeAboveFloatation(1))/1000^3,'-',LineWidth=3,Color=[.7 .7 .7])
plot(md_nc.time,(md_ub.IceVolumeAboveFloatation - md_ub.IceVolumeAboveFloatation(1))/1000^3,'k-',LineWidth=3)
fill([md_nc.time,flip(md_nc.time)],[(md_ub.IceVolumeAboveFloatation-md_ub.IceVolumeAboveFloatation(1))/1000^3,flip((md_nc.IceVolumeAboveFloatation - md_nc.IceVolumeAboveFloatation(1))/1000^3)],[1 1 1]*0.8, 'EdgeColor','none','FaceAlpha',0.5)
plot(md_nc.time,(md_dc.IceVolumeAboveFloatation-md_dc.IceVolumeAboveFloatation(1))/1000^3,LineWidth=3)
plot(md_nc.time,(md_snm.IceVolumeAboveFloatation-md_snm.IceVolumeAboveFloatation(1))/1000^3,'-.',LineWidth=3)
plot(md_nc.time,(md_wd.IceVolumeAboveFloatation-md_wd.IceVolumeAboveFloatation(1))/1000^3,':',LineWidth=3)
plot(md_nc.time,(md_wl.IceVolumeAboveFloatation-md_wl.IceVolumeAboveFloatation(1))/1000^3,LineWidth=3)

xlim([2015 2301]);
xlabel("Time (years)")
ylabel("∆ Ice Volume Above Flotation (km^3)")
% legend({'NC', 'UBH','NC-UBH', 'DC','SNM','WD','WL'},'Location','eastoutside')
ylim([(-6*10^5) 0])
yyaxis right
ylabel('Sea Level Rise (m w. eq.)')
ax2 = gca;
ax2.YAxis(2).Limits = (ax2.YAxis(1).Limits)*c*1000^3;
ax2.YAxis(2).TickValues = [-9:0.5:0];
% ax2.YAxis(2).TickLabels = {2.5, 2, 1.5, 1, 0.5,0};
ax2.YColor = 'k';
% title('∆ Ice Volume Above Floatation (2015-2301)')
text(0.85,0.075,charlbl{2},'Units','normalized','FontSize',30,FontWeight='bold')
set(gca,fontsize=20)
hold off

%Floating Ice Area
nexttile;
hold on
plot(md_nc.time,md_nc.FloatingIceArea/1000^2,'-',LineWidth=3,Color=[.7 .7 .7])
plot(md_nc.time,md_ub.FloatingIceArea/1000^2,'k-',LineWidth=3)
fill([md_nc.time,flip(md_nc.time)],[md_nc.FloatingIceArea/1000^2,flip(md_ub.FloatingIceArea/1000^2)],[1 1 1]*0.8, 'EdgeColor','none','FaceAlpha',0.5);
plot(md_nc.time,md_dc.FloatingIceArea/1000^2,LineWidth=3)
plot(md_nc.time,md_snm.FloatingIceArea/1000^2,LineWidth=3)
plot(md_nc.time,md_wd.FloatingIceArea/1000^2,LineWidth=3)
plot(md_nc.time,md_wl.FloatingIceArea/1000^2,LineWidth=3)
xlim([2015 2301]);
xlabel("Time (years)")
ylabel("Floating Ice Area (km^2)")
legend({'NC','UBH','NC-UBH','DC','SNM','WD','WL'},'Location','eastoutside')
text(0.85,0.075,charlbl{3},'Units','normalized','FontSize',30,FontWeight='bold')
set(gca,fontsize=20)
hold off
%%
%Calculating changes in ice volume and floating ice area for each model realization
%∆Ice Volume Above Flotation 
IceVolAbFlo.nc = ((md_nc.IceVolumeAboveFloatation(end)-md_nc.IceVolumeAboveFloatation(1))*c);
IceVolAbFlo.dc = ((md_dc.IceVolumeAboveFloatation(end)-md_dc.IceVolumeAboveFloatation(1))*c);
IceVolAbFlo.snm = ((md_snm.IceVolumeAboveFloatation(end)-md_snm.IceVolumeAboveFloatation(1))*c);
IceVolAbFlo.wd = ((md_wd.IceVolumeAboveFloatation(end)-md_wd.IceVolumeAboveFloatation(1))*c);
IceVolAbFlo.wl = ((md_wl.IceVolumeAboveFloatation(end)-md_wl.IceVolumeAboveFloatation(1))*c);
IceVolAbFlo.ub = ((md_ub.IceVolumeAboveFloatation(end)-md_ub.IceVolumeAboveFloatation(1))*c);

%Floating Ice Area @ t = 2301
FloatArea.nc = md_nc.FloatingIceArea(end)/1000^2;
FloatArea.dc = md_dc.FloatingIceArea(end)/1000^2;
FloatArea.snm = md_snm.FloatingIceArea(end)/1000^2;
FloatArea.wd = md_wd.FloatingIceArea(end)/1000^2;
FloatArea.wl = md_wl.FloatingIceArea(end)/1000^2;
FloatArea.ub = md_ub.FloatingIceArea(end)/1000^2;

%%
%∆Ice Thickness (t=2301) from DC
isoline(md,md_snm.icelevelset(:,end),'value',0,'output','SNM_IceFront2301.exp');
isoline(md,md_wd.icelevelset(:,end),'value',0,'output','WD_IceFront2301.exp');
isoline(md,md_wl.icelevelset(:,end),'value',0,'output','WL_IceFront2301.exp');
isoline(md,md_ub.icelevelset(:,end),'value',0,'output','UB_IceFront2301.exp');

%%
plotmodel(md,'figure',3,'data',(md_snm.Thickness(:,end)-md_dc.Thickness(:,end)),'colormap',flipud(cmocean('balance')),'caxis#1',[-1000 1000],'title','SNM','colorbarYlabel','∆ Ice Thickness (m)', 'fontsize',20, 'axis','off', 'scaleruler',[-1.5e6 -2e6 500e3 0.25e5 1], 'expdisp','SNM_IceFront2301.exp','expstyle','g.','figposition','fullscreen'); 
 set(gca,fontsize=20); set(gcf,"Position",[1863,-178,1236,925]);
plotmodel(md,'figure',4,'data',(md_wd.Thickness(:,end)-md_dc.Thickness(:,end)),'colormap',flipud(cmocean('balance')),'caxis#1',[-1000 1000],'title','WD','colorbarYlabel','∆ Ice Thickness (m)', 'fontsize',20, 'axis','off', 'scaleruler',[-1.5e6 -2e6 500e3 0.25e5 1], 'expdisp','WD_IceFront2301.exp','expstyle','g.','figposition','fullscreen');
 set(gca,fontsize=20);set(gcf,"Position",[1863,-178,1236,925]);
plotmodel(md,'figure',5,'data',(md_wl.Thickness(:,end)-md_dc.Thickness(:,end)),'colormap',flipud(cmocean('balance')),'caxis#1',[-1000 1000],'title','WL','colorbarYlabel','∆ Ice Thickness (m)', 'fontsize',20, 'axis','off', 'scaleruler',[-1.5e6 -2e6 500e3 0.25e5 1], 'expdisp','WL_IceFront2301.exp','expstyle','g.','figposition','fullscreen');
 set(gca,fontsize=20);set(gcf,"Position",[1863,-178,1236,925]);
plotmodel(md,'figure',6,'data',(md_ub.Thickness(:,136)-md_dc.Thickness(:,136)),'colormap',flipud(cmocean('balance')),'caxis#1',[-1000 1000],'title','UBH','colorbarYlabel', '∆ Ice Thickness (m)','fontsize',20, 'axis','off', 'scaleruler',[-1.5e6 -2e6 500e3 0.25e5 1], 'expdisp','UB_IceFront2301.exp','expstyle','g.','figposition','fullscreen');
 set(gca,fontsize=20);set(gcf,"Position",[1863,-178,1236,925]);
