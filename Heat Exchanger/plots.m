
subplot(3,2,1);
plot(parallel_cold_flow(1:4:13),parallel_u(1:4:13),'-o');
hold on;
plot(parallel_cold_flow(2:4:14),parallel_u(2:4:14),'-o');
hold on;
plot(parallel_cold_flow(3:4:15),parallel_u(3:4:15),'-o');
hold on;
plot(parallel_cold_flow(4:4:16),parallel_u(4:4:16),'-o');
xlim([0.5, 2.1]);
ylim([400,1500]);
xticks([0.5:0.2:2.1]);
xtickangle(0);
yticks([400:200:1500]);
grid on;
title('U vs Cold Side Flow Rate - Parallel Flow');
xlabel('Cold Side Flow Rate (L/min)')
ylabel('U(W/m K)');
legend('$V_h = 0.5$ L/min','$V_h = 1.0$ L/min','$V_h = 1.5$ L/min','$V_h = 2.0$ L/min','interpreter','latex');
legend('location','northwest')

subplot(3,2,2);
plot(counter_cold_flow(1:4:13),counter_u(1:4:13),'-o');
hold on;
plot(counter_cold_flow(2:4:14),counter_u(2:4:14),'-o');
hold on;
plot(counter_cold_flow(3:4:15),counter_u(3:4:15),'-o');
hold on;
plot(counter_cold_flow(4:4:16),counter_u(4:4:16),'-o');
xlim([0.5, 2.1]);
ylim([400,1500]);
xticks([0.5:0.2:2.1]);
xtickangle(0);
yticks([400:200:1500]);
grid on;
title('U vs Cold Side Flow Rate - Counter Flow');
xlabel('Cold Side Flow Rate (L/min)')
ylabel('U(W/m K)');
legend('$V_h = 0.5$ L/min','$V_h = 1.0$ L/min','$V_h = 1.5$ L/min','$V_h = 2.0$ L/min','interpreter','latex');
legend('location','northwest')

subplot(3,2,3);
plot(parallel_cold_flow(1:4:13),parallel_qh(1:4:13),'-o');
hold on
plot(parallel_cold_flow(2:4:14),parallel_qh(2:4:14),'-o');
hold on
plot(parallel_cold_flow(3:4:15),parallel_qh(3:4:15),'-o');
hold on
plot(parallel_cold_flow(4:4:16),parallel_qh(4:4:16),'-o');
hold on


scatter(parallel_cold_flow(1:4:13),parallel_qc(1:4:13),'MarkerEdgeColor',"#0072BD");
hold on
plot(parallel_cold_flow(1:4:13),parallel_qc(1:4:13),'--','color',"#0072BD");
hold on

scatter(parallel_cold_flow(1:4:13),parallel_qc(2:4:14),'MarkerEdgeColor',"#D95319");
hold on
plot(parallel_cold_flow(2:4:14),parallel_qc(2:4:14),'--','color',"#D95319");
hold on;

scatter(parallel_cold_flow(3:4:15),parallel_qc(3:4:15),'MarkerEdgeColor',"#EDB120");
hold on
plot(parallel_cold_flow(3:4:15),parallel_qc(3:4:15),'--','color',"#EDB120");
hold on

scatter(parallel_cold_flow(4:4:16),parallel_qc(4:4:16),'MarkerEdgeColor',	"#7E2F8E");
hold on
plot(parallel_cold_flow(4:4:16),parallel_qc(4:4:16),'--','color',	"#7E2F8E");
hold on
yline(0,'--');
hold on;
yline(0);

xlim([0.5, 2.1]);
ylim([200,1200]);
xticks([0.5:0.2:2.1]);
xtickangle(0);
yticks([200:200:1200]);
grid on;
legend('$V_h = 0.5$ L/min','$V_h = 1.0$ L/min','$V_h = 1.5$ L/min','$V_h = 2.0$ L/min','','$V_h = 0.5$ L/min','','$V_h = 1.0$ L/min','','$V_h = 1.5$ L/min','','$V_h = 2.0$ L/min','$Q_{Cold}$','$Q_{hot}$','interpreter','latex');
xlabel('Cold Side Flow Rate (L/min)')
ylabel('Q(W)');
title('Q vs Cold Side Flow Rate - Parallel Flow');

subplot(3,2,4);
plot(counter_cold_flow(1:4:13),counter_qh(1:4:13),'-o');
hold on
plot(counter_cold_flow(2:4:14),counter_qh(2:4:14),'-o');
hold on
plot(counter_cold_flow(3:4:15),counter_qh(3:4:15),'-o');
hold on
plot(counter_cold_flow(4:4:16),counter_qh(4:4:16),'-o');
hold on


scatter(counter_cold_flow(1:4:13),counter_qc(1:4:13),'MarkerEdgeColor',"#0072BD");
hold on
plot(counter_cold_flow(1:4:13),counter_qc(1:4:13),'--','color',"#0072BD");
hold on

scatter(counter_cold_flow(1:4:13),counter_qc(2:4:14),'MarkerEdgeColor',"#D95319");
hold on
plot(counter_cold_flow(2:4:14),counter_qc(2:4:14),'--','color',"#D95319");
hold on;

scatter(counter_cold_flow(3:4:15),counter_qc(3:4:15),'MarkerEdgeColor',"#EDB120");
hold on
plot(counter_cold_flow(3:4:15),counter_qc(3:4:15),'--','color',"#EDB120");
hold on

scatter(counter_cold_flow(4:4:16),counter_qc(4:4:16),'MarkerEdgeColor',	"#7E2F8E");
hold on
plot(counter_cold_flow(4:4:16),counter_qc(4:4:16),'--','color',	"#7E2F8E");
hold on

xlim([0.5, 2.1]);
ylim([200,1200]);
xticks([0.5:0.2:2.1]);
xtickangle(0);
yticks([200:200:1200]);
grid on;
legend('$V_h = 0.5$ L/min','$V_h = 1.0$ L/min','$V_h = 1.5$ L/min','$V_h = 2.0$ L/min','','$V_{hcold} = 0.5$ L/min','','$V_h = 1.0$ L/min','','$V_h = 1.5$ L/min','','$V_h = 2.0$ L/min','interpreter','latex');
xlabel('Cold Side Flow Rate (L/min)')
ylabel('Q(W)');
title('Q vs Cold Side Flow Rate - Counter Flow');


subplot(3,2,[5 6]);
scatter(parallel_ntu,parallel_e);
hold on;
scatter(counter_ntu,counter_e,"^");
hold on;
plot(parallel_ntu,parallel_ntu*line_fit_parallel,'color',"#0072BD");
hold on;
plot(counter_ntu,counter_ntu*line_fit_counter,'color',"#D95319");
xlim([0 0.65]);
ylim([0 40]);
yticks([0:10:40]);
grid on;
title('Effectiveness vs NTU');
eq1 = sprintf('f(x) = %0.2fx',line_fit_parallel);
eq2 = sprintf('f(x) = %0.2fx',line_fit_counter);

legend('Parallel','Counter',['Best Fit Line: Parallel ' eq1],['Best Fit Line Counter: ' eq2]);
xlabel('NTU');
ylabel('$\epsilon$','interpreter','latex')