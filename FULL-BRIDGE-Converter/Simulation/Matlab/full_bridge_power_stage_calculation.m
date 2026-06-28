%% Power Stage Calculation Of Full Bridge Converter
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
% Transformer Turn Ratio
T = ( 2 * Vin * D ) / ( Vout + 2 * Vd);
% Output Current
Iout = Pout / Vout;
% Load Resistance
RL = Vout^2 / Pout;
% Power Input
Pin = Pout / 0.9;
% Tansformer Primary Average Current
Ip_avg = Pout / ( n * Vin );
% Transfomer Primary Ripple Current
Delta_Ip = Ripple_I * Ip_avg;
% Transformer Primary Maximum Current
Ip_max = Ip_avg + ( Delta_Ip / 2 );
% Transformer Primary Minimum Current
Ip_min = Ip_max - ( Delta_Ip / 2 );
% Transformer Primary Side Inductance
Lp = ( Vin * D * ( 1 / Fsw )) / ( Delta_Ip );
% Transformer Secondary Side Inductance
Ls = Lp / T^2;
% Output Ripple Current
Delta_Iout = Ripple_I * Iout;
% Output Maximum Current
Iout_max = Iout + ( Delta_Iout / 2 );
% Output Minimum Current
Iout_min = Iout - ( Delta_Iout / 2);
% Output Inductance 
Lout = ( Vout * D ) / ( Fsw * Delta_Iout );
% Ripple Indutance
Delta_Vout = Ripple_V * Vout;
% Output Inductance
Cout = ( Iout * D ) / ( Fsw * Delta_Vout );