%% Power Stage Calculation Of Push Pull Converter
clc, clear, close all;
%% Input Parameter
Vin = 310; % Input Voltage 
Vout = 24; % Output Voltage
Vd = 1; % Diode Voltage
Pout = 1000; % Output Power
D = 0.3; % Duty Cycle
Fsw = 100e3; % Switching Frequecy
Ripple_I = 0.3; % Ripple Current Rate
Ripple_V = 0.01; % Ripple Voltage Rate
n = 0.9; % Effeciency
%% Power Stage Calculation
% Transformer Turn Ratio (Np/Ns)
T = (2 * Vin * D) / (Vout + 2* Vd);
% Output Current
Iout = Pout / Vout;
% Load Resistance
RL = Vout^2 / Pout;
% Input Power 
Pin = Pout / n;
% Primary Voltage
Vpri = Vin;
% Primary Average Current
Ip_avg = Pin / ( 2 * 310 );
% Primary Ripple
Delta_Ip = Ripple_I * Ip_avg;
% Primary Inductance
Lp = ( Vin * D * (1 / Fsw)) / (Delta_Ip);
% Secondary Inductance
Ls = Lp / T^2;
% Secondary Voltage
Vs = Vin / T;
% Output Ripple Current
Delta_Iout = Ripple_I * Iout;
% Output Maximum Current
Iout_max = Iout + Delta_Iout / 2;
% Output Minimum Current
Iout_min = Iout - Delta_Iout / 2;
% Output Inductance
Lout  = (24 * ( 1 - 2 * D ) * ( 1 / Fsw )) / ( Delta_Iout );
% Output Ripple Voltage
Delta_Vout = Ripple_V * Vout;
% Output Capacitor
Cout = (Delta_Iout * ( 1 / Fsw )) / ( 8 * Delta_Vout );