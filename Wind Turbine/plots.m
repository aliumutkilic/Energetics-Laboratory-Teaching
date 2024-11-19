hfig = figure(1);
plot(pitch1_resistance,pitch1_power,'-o');
hold on;
plot(pitch2_resistance,pitch2_power,'-o');
hold on;
plot(pitch3_resistance,pitch3_power,'-o');

ylim([0 60]);
xlim([20 60]);
legend('Pitch 1', 'Pitch 2', 'Pitch 3');
box off;
grid on;
xlabel('Load Resistance (\Omega)', 'Interpreter', 'tex');
ylabel('Generated Power (W)')
title('Generated Power vs Load Resistance');

picturewidth = 20; % set this parameter and keep it forever
hw_ratio = 0.65; % feel free to play with this ratio
set(findall(hfig,'-property','FontSize'),'FontSize',15) % adjust fontsize to your document
set(findall(hfig,'-property','Box'),'Box','off') % optional

set(hfig,'Units','centimeters','Position',[3 3 picturewidth hw_ratio*picturewidth])
pos = get(hfig,'Position');
set(hfig,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])



hfig = figure(2);
subplot(2,1,1);
plot(load_resistance,generated_power,'-o');
hold on
plot(load_resistance,turbine_power,'-o');
hold on;
yline(wind_power,'LineWidth',1);
ylim([0 160]);
xlim([20 180]);
yticks(0:25:150)
box off;
grid on;
xlabel('Load Resistance (\Omega)', 'Interpreter', 'tex');
ylabel('Power (W)')
title('Power vs Load Resistance');
legend('Generated Power', 'Turbine Power', 'Wind Power','Location','East');



subplot(2,1,2);
plot(load_resistance,overall_efficiency,'-o');
hold on;
plot(load_resistance,windmill_efficiency,'-o');
hold on
plot(load_resistance,generator_efficiency,'-o');
box off;
grid on;
xlabel('Load Resistance (\Omega)', 'Interpreter', 'tex');
ylabel('Percent Efficiency')
title('System EFficiencies vs Load Resistance');
legend('Overall Efficiency', 'Windmill Efficiency', 'Generator Efficiency','Location','East');


picturewidth = 20; % set this parameter and keep it forever
hw_ratio = 0.65; % feel free to play with this ratio
set(findall(hfig,'-property','FontSize'),'FontSize',15) % adjust fontsize to your document
set(findall(hfig,'-property','Box'),'Box','off') % optional

set(hfig,'Units','centimeters','Position',[3 3 picturewidth hw_ratio*picturewidth])
pos = get(hfig,'Position');
set(hfig,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])

hfig = figure(3);
subplot(2,1,1);
wind_speed_302 = [0;wind_speed_30];
generated_power_302 = [0;generated_power_30];
wind_speed_402 = [0;wind_speed_40];
generated_power_402 = [0;generated_power_40];
k = sum(generated_power_302.*wind_speed_302.^3)./sum((wind_speed_302.^3).^2);
a = linspace(0,11,100);
k2 = sum(generated_power_402.*wind_speed_402.^3)./sum((wind_speed_402.^3).^2);
scatter(wind_speed_302,generated_power_302)


hold on;
scatter(wind_speed_402,generated_power_402)
hold on;
eq1 = sprintf('P(v) = %0.3fv^3',k);
eq2 = sprintf('P(v) = %0.3fv^3',k2);
plot(a,k*a.^3,'--','Color',	"#0072BD",'LineWidth',1.5)
hold on;
plot(a,k2*a.^3,'--','Color',	"#D95319",'LineWidth',1.5)

P_predicted = k * wind_speed_302.^3;
P = generated_power_302;
SST = sum((P - mean(P)).^2);
SSR = sum((P - P_predicted).^2);
R_squared = 1 - (SSR / SST);
eq3 = sprintf('R^2 = %0.3f',R_squared);

P_predicted = k2 * wind_speed_402.^3;
P = generated_power_402;
SST = sum((P - mean(P)).^2);
SSR = sum((P - P_predicted).^2);
R_squared2 = 1 - (SSR / SST);
eq4 = sprintf('R^2 = %0.3f',R_squared2);


xlim([0,11]);
ylim([0 90]);
xticks(0:1:11);
box off;
grid on;
xlabel('Wind Speed (m/s)');
ylabel('Generated Power (W)')
title('Generated Power vs Wind Speed');
legend('30 \Omega Load', '40 \Omega Load',['Best Fit Line: ' eq1 ' , ' eq3  ],['Best Fit Line: ' eq2 ' , ' eq4], 'Interpreter', 'tex','Location','Northwest');

subplot(2,1,2);
plot(wind_speed_30,overall_30,'-o','Color',	"#0072BD");
hold on;
plot(wind_speed_30,gen_30,'-o','Color',"#D95319");
hold on;
plot(wind_speed_30,windmill_30,'-o','Color',"#EDB120");
hold on;
plot(wind_speed_30,overall_40,'--^','Color',	"#0072BD");
hold on;
plot(wind_speed_30,gen_40,'--^','Color',	"#D95319");
hold on;
plot(wind_speed_30,windmill_40,'--^','Color',	"#EDB120");
xlim([5.988,11]);
xticks(6:1:11);
box off;
grid on;
ylim([0 100]);
xlabel('Wind Speed (m/s)');
ylabel('Percent Efficiency')
title('System Efficiencies vs Wind Speed');
legend('Overall 30 \Omega', 'Generator 30 \Omega','Windmill 30 \Omega','Overall 40 \Omega','Generator 40 \Omega','Windmill 40 \Omega','Interpreter', 'tex','NumColumns',2,'Location','best'	);

picturewidth = 20; % set this parameter and keep it forever
hw_ratio = 0.65; % feel free to play with this ratio
set(findall(hfig,'-property','FontSize'),'FontSize',15) % adjust fontsize to your document
set(findall(hfig,'-property','Box'),'Box','off') % optional

set(hfig,'Units','centimeters','Position',[3 3 picturewidth hw_ratio*picturewidth])
pos = get(hfig,'Position');
set(hfig,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])