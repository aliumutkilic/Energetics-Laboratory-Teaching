clc;
clear;
close all;



filename = 'Wind Turbine Template4.xlsx';
sheetName = 'Experiment1';
sheetName2 = 'Experiment2';
sheetName3 = 'Experiment3';
opts = detectImportOptions(filename, 'Sheet', sheetName);  
opts.DataRange = 'A1';
opts2 = detectImportOptions(filename, 'Sheet', sheetName2);  
opts2.DataRange = 'A1'; 
opts3 = detectImportOptions(filename, 'Sheet', sheetName3);  
opts3.DataRange = 'A1';
w=warning('off','MATLAB:table:ModifiedAndSavedVarnames');       % turn off annoying warning, save state
data = readtable(filename, opts);
data2 = readtable(filename, opts2);
data3 = readtable(filename, opts3);


rho_air = 1.1679;
velocity = 9.7768;

pitch1_resistance = data.Var3(2:10);
pitch1_rmsvoltage = data.Var4(2:10);
pitch1_power = pitch1_rmsvoltage.^2 ./ pitch1_resistance;

pitch2_resistance = data.Var3(11:19);
pitch2_rmsvoltage = data.Var4(11:19);
pitch2_power = pitch2_rmsvoltage.^2 ./ pitch2_resistance;

pitch3_resistance = data.Var3(20:28);
pitch3_rmsvoltage = data.Var4(20:28);
pitch3_power = pitch3_rmsvoltage.^2 ./ pitch3_resistance;


load_resistance = data2.LoadResistance_RL_W_(2:end);
electrical_freq = data2.ElectricalFrequency_Hz_(2:end);
shaft_freq = electrical_freq/8;
rms_volt = data2.RMSVoltage_ERMS_V_(2:end);
rotational_speed = shaft_freq*60;
generated_power = rms_volt.^2./load_resistance;
power_loss = (2*10^(-9))*rotational_speed.^3 - (8*10^(-6))*rotational_speed.^2 + 0.012*rotational_speed - 1.1;
turbine_power = generated_power + power_loss;
wind_power = 0.5*rho_air*pi*0.25*0.58^2*velocity^3;
overall_efficiency = generated_power./wind_power *100;
generator_efficiency = generated_power./turbine_power *100;
windmill_efficiency = turbine_power ./ wind_power * 100;


generated_power_30 = data3.GeneratedPower_P0_W_(3:8);
generated_power_40 = data3.GeneratedPower_P0_W_(9:14);
wind_speed_30 = data3.LowSpeedTestSectionVelocity_V_m_s_(3:8);
wind_speed_40 = data3.LowSpeedTestSectionVelocity_V_m_s_(9:14);

overall_30 = data3.OverallEfficiency_H0___ (3:8);
gen_30 = data3.GeneratorEfficiency_Hgen___(3:8);
windmill_30 = data3.WindmillEfficiency_Hwindmill___(3:8);
overall_40 = data3.OverallEfficiency_H0___ (9:14);
gen_40 = data3.GeneratorEfficiency_Hgen___(9:14);
windmill_40 = data3.WindmillEfficiency_Hwindmill___(9:14);


plots;

