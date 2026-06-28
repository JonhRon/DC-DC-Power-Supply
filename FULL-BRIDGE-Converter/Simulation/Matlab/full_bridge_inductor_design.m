%% Inductor Design using Kg method
clc, clear, close all;
%% Input Parameter for ferrite core selection using Kg method
L = 5.76e-6; % Inductor[H]
Io = 41.6667; % DC Current[A]
Delta_I = 12.5; % AC Current[A]
Po = 1000; % Output Power[W]
alpha = 1; % Regulation[%]
Fs = 100e3; % Ripple Frequency[Hz]
Bm = 0.25; % Operating flux density [Tesla]
Ku = 0.4; % Window utilization
Tr = 25; % Temperature rise goal
%% Calculation Block
% Calculate the peak current Ipk
Ipk = Io + ( Delta_I / 2 );
% Calculate The energy-handling capability
E = (L * Ipk^2 ) / 2;
% Calculate the electrical condition coeffcient Ke
Ke = 0.145 * Po * Bm^2 * 1e-4;
% Calculate the core geometry coefficient Kg
Kg = E^2 / (Ke * alpha);
%% Input Parameter of [PC-43622] ferrite Core
MPL = 4.50; % Magnetic Path Length [ cm ]
We = 34; % Core Weight [ grams ]
MLT = 6.3; % Mean Length Turn [ cm ]
Ac = 1.36; % Iron Core or Cross-Sectional area [ cm^2 ]
Wa = 0.748; % Window Area or Bobbin winding area[ cm^2 ]
Ap = 0.9717; % Core Product [ cm^4 ]
Kgs = 0.080; % Core Geometry [ cm^5 ]
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
Aws = 0.04; % Insulate Aws [ cm^2 ]
N = (Waeff * S2) / Aws;
% Calculate the requred gab [ mm ]
mu_0 = 2500; % Material Permeability
Lg = (((0.4 * pi * N^2 * Ac * 1e-8) / L) - ( MPL / mu_0 ));