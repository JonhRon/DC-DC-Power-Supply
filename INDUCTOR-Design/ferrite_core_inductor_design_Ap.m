%% Inductor Design using Ap method
clc, clear, close all;
%% Input Parameter for ferrite core selection using Ap method
L = 0.0025; % Inductor[H]
Io = 1.5; % DC Current[A]
Delta_I = 0.2; % AC Current[A]
Po = 100; % Output Power[W]
alpha = 1; % Regulation[%]
Fs = 200e3; % Ripple Frequency[Hz]
Bm = 0.22; % Operating flux density [Tesla]
Ku = 0.4; % Window utilization
Tr = 25; % Temperature rise goal
J = 250; % Current Density [ amps-per-cm^2 ]
%% Calculation Block
% Calculate the peak current Ipk
Ipk = Io + ( Delta_I / 2 );
% Calculate The energy-handling capability
E = (L * Ipk^2 ) / 2;
% Calculate the electrical condition coeffcient Ke
Ke = 0.145 * Po * Bm^2 * 1e-4;
% Calculate the core geometry coefficient Ap
Ap = (2 * E * 1e4) / (Bm * J * Ku);