hfig = figure(1);
subplot(2,2,1);
plot(motor_frequency,flow_velocity,'LineWidth',line_width);
xlabel('Motor Frequency(Hz)');
ylabel('Flow Velocity (m/s)');
hold on;
plot(motor_frequency,m*motor_frequency,'LineWidth',line_width);
title("Motor Speed vs Flow Speed");
eq1 = sprintf('f(x) = %0.2fx',m);
legend('Measured Data',['Best Fit Line: ' eq1]);


subplot(2,2,2);
scatter(motor_frequency,hs_vel_an./ls_vel_an,'MarkerFaceColor',	"#0072BD",'MarkerEdgeColor',	"#0072BD");
hold on;
yline(velocity_ratio_expected,'LineWidth',line_width);
ylabel("$V_1/V_2$",'interpreter','Latex');
xlabel('Motor Frequency (Hz)')
ylim([0 10]);
legend('Measured Velocity Ratio','Theoretical Velocity Ratio');
title("Verifying Continuity")

subplot(2,2,3);
plot(reynolds_number,cd_rs,'-o','LineWidth',line_width);
hold on;
plot(reynolds_number,cd_ss,'-o','LineWidth',line_width);
hold on;
plot(reynolds_number,cd_ogive,'-o','LineWidth',line_width);
hold on;
plot(reynolds_number,cd_disk,'-o','LineWidth',line_width);
hold on;
plot(reynolds_number,cd_hs,'-o','LineWidth',line_width);

legend('Rough Sphere','Smooth Sphere','Ogive','Disk','Hemisphere');
ylabel('$C_D$','interpreter','latex');
xlabel('$Re_D$','interpreter','latex')
title("Coefficient of Drag vs Reynolds Number")


subplot(2,2,4);
plot(reynolds_number,rough_sphere,'-o','LineWidth',line_width);
hold on;
plot(reynolds_number,smooth_sphere,'-o','LineWidth',line_width);
hold on;
plot(reynolds_number,ogive,'-o','LineWidth',line_width);
hold on;
plot(reynolds_number,disk,'-o','LineWidth',line_width);
hold on;
plot(reynolds_number,hollow_hemisphere,'-o','LineWidth',line_width);

legend('Rough Sphere','Smooth Sphere','Ogive','Disk','Hemisphere');
ylabel('$F_D (N)$','interpreter','latex');
xlabel('$Re_D$','interpreter','latex')
title('Drag Force vs Reynolds Number')

picturewidth = 20; % set this parameter and keep it forever
hw_ratio = 0.65; % feel free to play with this ratio
set(findall(hfig,'-property','FontSize'),'FontSize',10) % adjust fontsize to your document
set(findall(hfig,'-property','Box'),'Box','off') % optional
set(findall(hfig,'-property','Interpreter'),'Interpreter','latex') 
set(findall(hfig,'-property','TickLabelInterpreter'),'TickLabelInterpreter','latex')
set(hfig,'Units','centimeters','Position',[3 3 picturewidth hw_ratio*picturewidth])
pos = get(hfig,'Position');
set(hfig,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])
%print(hfig,fname,'-dpdf','-painters','-fillpage')
