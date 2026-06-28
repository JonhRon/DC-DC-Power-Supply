%% Forward Convert Design 
clc, clear, close all;
%% Input Parameter
Vin = 310; % Input Voltage 
Vout = 24; % Output Voltage
Vd = 1; % Diode Voltage
Pout = 500; % Output Power
D = 0.3; % Duty Cycle
Fsw = 100e3; % Switching Frequecy
Ripple_I = 0.3; % Ripple Current Rate
Ripple_V = 0.01; % Ripple Voltage Rate
n = 0.9; % Effeciency
%% Power Stage Calculation
% Transformer Turn Ratio ( Np/Ns )
T = (Vin * D) / (Vout + Vd);
% Output Current
Iout = Pout / Vout;
% Load Resistance
RL = Vout / Iout;
% Input Power 
Pin = Pout / n;
% Primary average Current
Ip_avg = (Pin) / (Vin);
% Primary Ripple Current
Delta_Ip = Ripple_I * Ip_avg;
% Primary rms Current
Ip_rms = (Pin) /(Vin * sqrt(D));
% Primary Inductance
Lp = (Vin * D) / (Delta_Ip * Fsw);
% Reset Winding Inductance
Lreset = Lp;
% Secondary Inductance
Ls = Lp * (1/(T))^2;
% Secondary Average Current
Is_avg = Iout;
% Secondary RMS Current
Is_rms = (Iout) / (sqrt(2));
% Output Ripple Current
Delta_Iout = Ripple_I * Iout;
% Maximum Output Current
Iout_max = Iout + (Delta_Iout/2);
% Minimum Ouput Current
Iout_min = Iout - (Delta_Iout/2);
% Ouptu Inductance
Lout = ((Vout + Vd) * (1 - D)) / (Delta_Iout * Fsw);
% Output Ripple Voltage
Delta_Vout = Ripple_V * Vout;
% Output Capacitor
Cout = (Iout * D) / (Fsw * Delta_Vout);

