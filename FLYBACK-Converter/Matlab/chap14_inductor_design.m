%% Inductor Design first Kg method
clc, clear, close all;
%% Parameter for Inductor Design
rho = 1.724e-6; % Wire resistivity (Ohm-cm)
Imax = 4.79; % Peak winding current (A)
L = 0.528e-3; % Inductance (H)
R = 0.1; % Winding resistance (Ohm)
Ku =0.4; % Winding fill factor
Bmax =0.35; % Core maximum flux density (T)
mu0 = 4 * pi * 1e-7; % Permeability of free space (H/m)
%% Step 1: Determine Core Size
Kg = ((rho * L^2 * Imax) / (Bmax^2 * R * Ku)) * 1e8; % Required Kg (cm^5)
fprintf('Kg: %.2e cm^5\n', Kg);
%% Selected Core Parameter EE-375
Ac = 0.821;%core cross-sectional area (cm^2)
Wa = 1.539;%Core window area (cm^2)
MLT = 6.6;%Mean Length per turn (cm)
%% Step 2: Gap Length
Lg = ((mu0 * L * Imax^2 ) / (Bmax^2 * Ac)) * 1e4;
fprintf('Lg: %.2e m\n', Lg);
%% Step 3: Number of turns
n = ((L * Imax) / (Bmax * Ac)) * 1e4;
fprintf('n: %.2e \n', n);
%% Step 4: Wire size
Aw = ((Ku * Wa) / n) * 1e2;
fprintf('Aw: %.2e mm^2\n', Aw);