%% Inductor Design Equation
clc, clear
%% Inductor Design Parameter
rho = 1.724e-6; % Resistivity of copper (Ohm-cm) at room temperature
Imax = 5; % Peak winding current (A)
L = 47e-6; % Desired inductance (H)
R = 0.1; % Maximum allowable winding resistance (Ohms)
Ku = 0.4; % Window utilization factor (fill factor)
Bmax = 0.3; % Maximum flux density (T)
Pcu = 0.75; % Allowed total copper loss (W)
mu0 = 4 * pi * 1e-7; % Permeability of free space (H/m)
%% Core Geometry Constants (Example: PQ 20/16 core)
Ac = 0.62; % Core cross-sectional area (cm^2)
Wa = 0.256; % Core window area (cm^2)
MLT = 4.4; % Mean length per turn (cm)
%% Kg Method
Kg_required = (rho * L^2 * Imax )* 1e8 / (R * Ku* Bmax^2) ; % in cm^5
fprintf('Required Core Geometrical Constant (Kg): %.2e cm^5\n', Kg_required);
%% Air Gap Length
lg = (mu0 * L * Imax^2) / (Bmax^2 * Ac) * 1e4; % in meters
fprintf('Air Gap Length (lg): %.2f mm\n', lg * 1e3);