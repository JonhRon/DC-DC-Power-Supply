%% Core Parameter Needed Calculation with Kg method
clc, clear, close all;
%% Input Parameter of EE16 ferrite Core
MPL = 4.54; % Magnetic Path Length [ cm ]
We = 15; % Core Weight [ grams ]
MLT = 4.4; % Mean Length Turn [ cm ]
Ac = 0.62; % Iron Core or Cross-Sectional area [ cm^2 ]
Wa = 0.658; % Window Area or Bobbin winding area[ cm^2 ]
Ap = 0.408; % Core Product [ cm^4 ]
Kg = 0.0227; % Core Geometry [ cm^5 ]
%At = 69.9; % Surface Area [ cm^2 ]
%Al = 3295; % Millihenrys-per-1k [ mh ]
%G = 2.84; % Winding Length [ cm ]
%% 
E = 0.0014; % energy-handling capability [ watt-seconds ] 
Io = 4.17; % DC Current[A]
Delta_I = 0.1251; % AC Current[A]
Bm = 0.25; % Operating flux density [Tesla]
Ku = 0.4; % Window utilization
L = 160e-6; % Inductor[H]
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
Aws = 0.01; % Insulate Aws [ cm^2 ]
N = (Waeff * S2) / Aws;
% Calculate the requred gab [ mm ]
mu_0 = 2500; % Material Permeability
Lg = (((0.4 * pi * N^2 * Ac * 1e-8) / L) - ( MPL / mu_0 ));
