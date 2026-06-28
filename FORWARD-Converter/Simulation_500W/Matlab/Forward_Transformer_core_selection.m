%% Forward Converter Transformer Design 100W
clc, clear, close all;
%% Input Parameter
Pin = 555.55; % Input Power
Vo = 24; % Output Voltage
Vd = 1; % Diode Voltage
F = 100e3; % Switching Frequency
Bm = 0.1; % Ferrite Core Flux Density
D = 0.3; % Duty Cycle
alpha = 0.5; % Regualtion
Ip_rms = 3.27; % Primary rms Current
Is_rms = 14.73; % Secodary rms Current
Vin = 310; % Input Voltage
%% Stage Calculation
% Electrical Coefficient
Ke = 0.145 * (100e3)^2 * Bm^2 * 1e-4; 
% Core Geometery 
Kg = (Pin * D) / (alpha * Ke);
%% Core EE2425 Parameter List
MPL = 10.30; % Magnetic Path Length [ cm ]
Wcore = 94; % Core Weight [ grams ]
Wcopper = 93.2; % Copper Weight [ grams ]
MLT = 9.4; % Mean Length Turn [ cm ]
Ac = 1.742; % Iron Core or Cross-Sectional area [ cm^2 ]
Wa = 2.785; % Window Area or Bobbin winding area[ cm^2 ]
Ap = 4.852; % Core Product [ cm^4 ]
Kg_s = 0.3595; % Core Geometry [ cm^5 ]
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
