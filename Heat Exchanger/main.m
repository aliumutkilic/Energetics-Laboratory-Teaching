clc;
clear;
close all;




filename = 'heat_exchanger.xlsx';

%% Measured Data

parallel_cold_flow = xlsread(filename,'C3:C18');
%parallel_cold_flow = unique(parallel_cold_flow);

parallel_hot_flow = xlsread(filename,'E3:E18');
parallel_tho = xlsread(filename,'F3:F18');
parallel_thi= xlsread(filename,'G3:G18');
parallel_chi = xlsread(filename,'H3:H18');
parallel_cho = xlsread(filename,'I3:I18');

counter_cold_flow = xlsread(filename,'C20:C35');
counter_hot_flow = xlsread(filename,'E20:E35');
counter_thi = xlsread(filename,'F20:F35');
counter_tho = xlsread(filename,'G20:G35');
counter_chi = xlsread(filename,'H20:H35');
counter_cho = xlsread(filename,'I20:I35');


%% Raw Data 

surface_area = 0.02011;

%% Derived Data

parallel_avg_th = (parallel_thi + parallel_tho)/2;
counter_avg_th = (counter_thi + counter_tho)/2;

parallel_avg_rho_hot = xlsread(filename,'L3:L18');
counter_avg_rho_hot = xlsread(filename,'L20:L35');


parallel_cph = xlsread(filename,'M3:M18');
counter_cph = xlsread(filename,'M20:M35');


parallel_avg_tc = (parallel_chi + parallel_cho)/2;
counter_avg_tc = (counter_chi + counter_cho)/2;

parallel_avg_rho_cold = xlsread(filename,'O3:O18');
counter_avg_rho_cold = xlsread(filename,'O20:O35');

parallel_cpc = xlsread(filename,'P3:P18');
counter_cpc =  xlsread(filename,'P20:P35');

parallel_delta_t1 = parallel_tho - parallel_cho;
counter_delta_t1 = counter_thi-counter_cho;

parallel_delta_t2 = parallel_thi - parallel_chi;
counter_delta_t2 = counter_tho - counter_chi;

parallel_tlm = (parallel_delta_t2-parallel_delta_t1)./(log(parallel_delta_t2./parallel_delta_t1));
counter_tlm = (counter_delta_t2-counter_delta_t1)./(log(counter_delta_t2./counter_delta_t1));

parallel_min_flow = min(parallel_cold_flow.*parallel_avg_rho_cold.*parallel_cpc/60 ,parallel_hot_flow.*parallel_avg_rho_hot.*parallel_cph/60 );
counter_min_flow = min(counter_cold_flow.*counter_avg_rho_cold.*counter_cpc/60 ,counter_hot_flow.*counter_avg_rho_hot.*counter_cph/60 );

parallel_qh = parallel_hot_flow.*parallel_avg_rho_hot.*parallel_cph.*(parallel_thi-parallel_tho)/60;
counter_qh =  counter_hot_flow.*counter_avg_rho_hot.*counter_cph.*(counter_thi-counter_tho)/60;

parallel_qc = parallel_cold_flow.*parallel_avg_rho_cold.*parallel_cpc.*(parallel_cho-parallel_chi)/60;
counter_qc = counter_cold_flow.*counter_avg_rho_cold.*counter_cpc.*(counter_cho-counter_chi)/60;

parallel_u = 0.5*(parallel_qh+parallel_qc)./(surface_area*parallel_tlm);
counter_u = 0.5*(counter_qh+counter_qc)./(surface_area*counter_tlm);

parallel_ntu = parallel_u*surface_area./parallel_min_flow;
counter_ntu = counter_u*surface_area./counter_min_flow;

parallel_e = 100*0.5*(parallel_qh+parallel_qc)./(parallel_min_flow.*(parallel_thi-parallel_chi));
counter_e = 100*0.5*(counter_qh+counter_qc)./(counter_min_flow.*(counter_thi-counter_chi));

line_fit_parallel = sum(parallel_ntu.*parallel_e) / (sum(parallel_ntu.^2));
line_fit_counter = sum(counter_ntu.*counter_e) / (sum(counter_ntu.^2));

plots;