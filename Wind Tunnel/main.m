clc;
clear;
close all;


%% Raw Parameters

marker_size = 4;
line_width  = 1;
p_ambient = 1002.5;         %mbar
p_standard = 1013.25;       %mbar
t_dry = 24;                 %celsius
t_wet = 18;                 %celsius
v_specific = 0.856;         %m^3/kg
w_humidity = 0.0104;
area_ls = 40;               %m^2 Low Speed Section
area_hs = 16.2;             %m^2 High Speed Section
r = 1.5*0.0254;               %Radius of the objects (m)
viscosity = 1.8*10^-5;      %kg/m-s Dynamic Viscosity of Air

%% Derived Parameters

rho_air = (1/v_specific)*(1+w_humidity)*p_ambient/p_standard;
velocity_ratio_expected = (area_ls/area_hs)^2;                      %V_hs/V_ls
area_object = pi*r^2;                                               %m^2 Area of the Measured Objects
d = 2*r;                                                            %m Diameter of the Measured Objects


%% Experimental Measurements

p_dynamic = [1.90,2.75,3.75,4.95,6.27,7.75,9.30];                 %High Speed Section Dynamic Pressure inH2O
motor_frequency = [25,30,35,40,45,50,55];                         %Hz
p_dynamic_ls = [0.057, 0.087, 0.121, 0.158, 0.193, 0.224, 0.271]; %Low Speed Section Dynamic Pressure inH2O
sting_drag = [0.09, 0.13, 0.17, 0.21, 0.28, 0.34, 0.40];          %N Drag Force of the Sting
hollow_hemisphere = [0.85, 1.21, 1.67, 2.15, 2.67, 3.36, 4.03];   %N Drag Force of the Hollow Hemisphere
rough_sphere = [0.72, 1.11, 1.59, 2.14, 2.76, 3.46, 4.01];        %N Drag Force of the Rough Sphere
smooth_sphere = [0.98 1.45 2.00 2.60 3.30 4.01 4.74];             %N Drag Force of the Smooth Sphere
disk = [2.45 3.58 4.97 6.50 8.27 10.18 12.25];                    %N Drag Force of the Disk
ogive = [0.12 0.19 0.29 0.40 0.54 0.67 0.86];                     %N Drag Force of the Aerodynamic Body


%First Experiment
% rho_air = 1.171;
% p_dynamic = [1.87,2.77,3.83,4.96,6.29,7.77,9.33];
% p_dynamic_ls = [0.062,0.090,0.130,0.160,0.200,0.231,0.261];
% sting_drag =[0.11, 0.13, 0.17, 0.22, 0.30, 0.37, 0.44];
% hollow_hemisphere = [0.85 1.22 1.70 2.15 2.68 3.40 4.06];
% rough_sphere = [0.77 1.13 1.63 2.15 2.80 3.48 4.22];
% smooth_sphere = [1.01, 1.45, 2.02, 2.65, 3.35, 3.98, 4.72];
% disk = [2.45 3.58 4.96 6.52 8.26 10.24 12.26];
% ogive = [0.13 0.21 0.31 0.43 0.56 0.73 0.88];

% Subtract Sting Drag
hollow_hemisphere = hollow_hemisphere - sting_drag;
rough_sphere = rough_sphere - sting_drag;
smooth_sphere = smooth_sphere - sting_drag;
disk = disk - sting_drag;
ogive = ogive-sting_drag;


% Convert Pressure to SI Units

p_dynamic = p_dynamic * 249.174;                                  %Pa Pressure in High Speed Section
p_dynamic_ls = p_dynamic_ls*249.174;                              %Pa Pressure in Low Speed Section


%% Calibration of Flow Velocity


flow_velocity = (2*p_dynamic/rho_air).^0.5;                       %m/s for High Speed Section
%line_fit = polyfit(motor_frequency,flow_velocity,1)               %Line Fit
m = (motor_frequency*flow_velocity' / (motor_frequency*motor_frequency'));
flow_velocity_ls = (2*p_dynamic_ls/rho_air).^0.5;                 %m/s for Low Speed Section
m2 = (motor_frequency*flow_velocity_ls' / (motor_frequency*motor_frequency'));
ls_vel_an = m2*motor_frequency;                                   %Best Line Fit LS Velocity
hs_vel_an = m*motor_frequency;                                    %Best Line Fit HS Velocity
%% Drag Force, Reynold Number, Coefficient of Drag

reynolds_number = flow_velocity*rho_air*d/viscosity;
cd_hs = hollow_hemisphere./(area_object*0.5*rho_air*flow_velocity.^2);
cd_rs = rough_sphere./(area_object*0.5*rho_air*flow_velocity.^2);
cd_ss = smooth_sphere./(area_object*0.5*rho_air*flow_velocity.^2);
cd_disk = disk./(area_object*0.5*rho_air*flow_velocity.^2);
cd_ogive = ogive./(area_object*0.5*rho_air*flow_velocity.^2);

%% Plot
plots;
