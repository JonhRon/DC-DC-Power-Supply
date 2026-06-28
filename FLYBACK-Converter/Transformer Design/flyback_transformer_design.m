%% Flyback Transformer Design
clc, clear, close all;
%% Input Parameter
L = 2.955e-3; % Inductance [ H ]
Vo = 24; % Output Voltage [ V ]
Ip_pk = 1.374; % Inductance Primary Peak Current [ A ] 
Ip_rms = 1.21; % Primary RMS Current
Is_rms = 5.33; % Secondart RMS Current
Po = 100; % Ouput Power [ W ]
Bm = 0.25; % Ferrite Core Flux Density
alpha = 1; % Regualtion
Vd = 1; % Diode Drop Voltage
D = 0.3; % Duty Cycle
Dw = 0.1; % Dewell Time Ratio
Ku = 0.4; %  Window Ultilization
Vi = 310; % Input Voltage
F = 100e3; % Switching Frequency
%% Stage Calculation Flyback Transformer Design
% Skin Depth [ cm ]
absilon = 6.62 / sqrt(F);
% Wire Diameter [ cm ]
Wd = 2 * absilon;
% The Bare Wire Area [ cm^2 ]
Aw = (pi * Wd^2) / (4);
% Select Bare Wire Area
Aws = 0.01;
% Energy-Handling Capability [ Ws ]
E = (L * Ip_pk^2) / 2 ;
% Electrical Condtion
Ke = 0.145 * Po * Bm^2 * 1e-4;
% Core Geometry
Kg = (E^2) / (Ke * alpha);
%% Selected Core [EE21] and Claim Parameter
MPL = 7.75; % Magnetic Path Length [ cm ]
Wcore = 57; % Core Weight [ grams ]
Wcopper = 47.3; % Copper Weight [ grams ]
MLT = 8.1; % Mean Length Turn [ cm ]
Ac = 1.490; % Iron Core or Cross-Sectional area [ cm^2 ]
Wa = 1.643; % Window Area or Bobbin winding area[ cm^2 ]
Ap = 2.448; % Core Product [ cm^4 ]
Kg_s = 0.1802; % Core Geometry [ cm^5 ]
%% Calculate Needed Parameter for Transformer 
% Current Density [ A/cm^2 ]
J = (2 * E * 1e4) / (Bm * Ap * Ku);
% Primary Wire Area [ cm^2 ]
Apw = Ip_rms / J;
% Required Number of Primary Strands, Snp
Snp = Apw / Aws;
% Calculate Number of Primary Turn
Wap = Wa / 2;
Np = (Ku * Wap) / (3 * Aws);
% Calculate Required Gap Length
mu_0 = 2500; % Material Permeability
Lg = abs(((0.4 * pi * Np^2 * Ac * 1e-8) / L) - (MPL/mu_0));
% Calculate The Secondary Turn
Ns = (Np * (Vo + Vd) * (1 - D - Dw)) / (Vi * D);
% Secodary Wire Area
Asw = Is_rms / J;


