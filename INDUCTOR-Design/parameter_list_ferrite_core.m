%% Core Parameter Needed Calculation with Kg method
clc, clear, close all;
%% Input Parameter of EE22 ferrite Core
MPL = 3.96; % Magnetic Path Length [ cm ]
We = 8.81; % Core Weight [ grams ]
MLT = 3.99; % Mean Length Turn [ cm ]
Ac = 0.41; % Iron Core [ cm^2 ]
Wa = 0.196; % Window Area [ cm^2 ]
Ap = Ac * Wa; % Core Product [ cm^4 ]
Kg = 0.00826; % Core Geometry [ cm^5 ]
%At = 69.9; % Surface Area [ cm^2 ]
%Al = 3295; % Millihenrys-per-1k [ mh ]
%G = 2.84; % Winding Length [ cm ]
%% 
E = 8.464e-04; % energy-handling capability [ watt-seconds ] 
Io = 5; % DC Current[A]
Delta_I = 1.5; % AC Current[A]
Bm = 0.22; % Operating flux density [Tesla]
Ku = 0.4; % Window utilization
L = 51.2e-6; % Inductor[H]
%% Calculation Stage
% Current Density [ amps-per-cm^2 ]
J = (2 * E * 1e4) / (Bm * Ap * Ku);
% Calculate the rms current, Irms
Irms = sqrt(Io^2 + Delta_I^2);
% Calculate bare wier area [ cm^2 ]
Aw = Irms / J;
% Calculate The effective window are [ cm^2 ]
S3 = 0.75;
Waeff = Wa * S3;
% Calculate the number of turn
S2 = 0.6;
Aws = 0.003; % Insulate Aws [ cm^2 ]
N = (Waeff * S2) / Aws;
% Calculate the requred gab [ cm ]
mu_0 = 2500; % Material Permeability
Lg = ((0.4 * pi * N^2 * Ac * 1e-8) / L) - ( MPL / mu_0 );
