%% Inductor Design Secode Kg method
clc, clear, close all;
%% Inductor Design Parameter
rho = 1.724e-6; % Wire resistivity (Ohm-cm)
Lm = 1;%Magnetizing Inductance ( H )
Itot = 1;%total rms winding currents ( A )
Im = 1;%Peak Magnetizing Current ( A )
Bmax = 1;%Core Maximum flux density ( T )
Pcu = 1;%Allowed copper loss ( W )
Ku = 1;%Winding field factor
%% Determine core size using Kg method
Kg = ((rho * Lm^2 * Itot^2 * Im^2) / (Bmax^2 * Pcu * Ku))*1e8;