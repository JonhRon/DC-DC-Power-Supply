%% Transformer Design for Push-Pull Converter
clc, clear, close all;
%% Input Parameter
Pout = 500; % Output Power
Vin = 310; % Input Voltage
U = 1.41; % Factor for using center-tap winding 
n = 0.9; % Efficiency is 90%
Kf = 4; % Square Wave
Bm = 0.05; % Flux Density
Fsw = 100e3; % Switching Frequency
alpha = 0.5; % Regulation
Ku = 0.4; % Window utilization
D = 0.3; % Duty Cycle
Iout = 20.83; % Ouptut Current
%% Stage Calculation
% Secondary Apparent Power
Pt = (Pout / 0.9) * 1.41 + Pout * 1.41;
% The Electrical Condition
Ke = 0.145 * Kf^2 * Fsw^2 * Bm^2 * 1e-4;
% The Core Geometry
Kg = ((Pt) / (2 * Ke * alpha)) * 1.35;
%% Core Selectec [] Input Parameter
MPL = 7.46; % Magnetic Path Length [ cm ]
We = 55; % Core Weight [ grams ]
MLT = 6.7; % Mean Length Turn [ cm ]
Ac = 1.61; % Iron Core or Cross-Sectional area [ cm^2 ]
Wa = 1.496; % Window Area or Bobbin winding area[ cm^2 ]
Ap = 2.409; % Core Product [ cm^4 ]
Kgs = 0.2326; % Core Geometry [ cm^5 ]
%% Stage Calculation
% Current Density
J = (Pt * 1e4) / (Kf * Ku * Bm * Fsw * Ap);
% The Primary Turn
Np = (Vin * 1e4) / (Kf * Bm * Fsw * Ac);
% Input Current
Iin = Pout / Vin * 0.9;
% Primary Bare Wire Area
Apw = (Iin * sqrt(D)) / (J);
% Secondary Voltage per Winding
Vs = (Vin) / (7.15);
% The Secondary Turn
Ns = ((Np * Vs) / (Vin)) * ( 1 + ( alpha / 100 ));
% Secondary Bare Wier Area 
Asw = (Iout * sqrt(D)) / J;