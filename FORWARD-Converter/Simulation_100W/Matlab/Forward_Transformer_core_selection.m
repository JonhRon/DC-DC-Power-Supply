%% Forward Converter Transformer Design 100W
clc, clear, close all;
%% Input Parameter
Pin = 111.3; % Input Power
Vo = 24; % Output Voltage
Vd = 1; % Diode Voltage
F = 100e3; % Switching Frequency
Bm = 0.1; % Ferrite Core Flux Density
D = 0.3; % Duty Cycle
alpha = 0.5; % Regualtion
Ip_rms = 0.59; % Primary rms Current
Is_rms = 2.95; % Secodary rms Current
Vin = 310; % Input Voltage
%% Stage Calculation
% Electrical Coefficient
Ke = 0.145 * (100e3)^2 * Bm^2 * 1e-4; 
% Core Geometery 
Kg = (Pin * D) / (alpha * Ke);
%% Core EE2425 Parameter List
MPL = 7.20; % Magnetic Path Length [ cm ]
Wcore = 28; % Core Weight [ grams ]
Wcopper = 31; % Copper Weight [ grams ]
MLT = 6.4; % Mean Length Turn [ cm ]
Ac = 0.761; % Iron Core or Cross-Sectional area [ cm^2 ]
Wa = 1.419; % Window Area or Bobbin winding area[ cm^2 ]
Ap = 1.08; % Core Product [ cm^4 ]
Kg_s = 0.0517; % Core Geometry [ cm^5 ]
Ku = 0.4;  % Window Ultilization
%% Stage Calculation [ A/cm^2 ]
% Current Density
J = (2 * Pin * sqrt(D) * 1e4) / (F * Ac * Bm * Wa * Ku);
% Primary Bare Wire Area 
Apw = Ip_rms / J;
% Primary Transformer Turn
Np = (Vin * D * 1e4) / (F * Ac * Bm);
% Secondary Bare Wire Area
Asw = Is_rms / J;
% Secondary Transformer Turn
Ns = (Np * ( Vo + Vd)) / (D * Vin);
