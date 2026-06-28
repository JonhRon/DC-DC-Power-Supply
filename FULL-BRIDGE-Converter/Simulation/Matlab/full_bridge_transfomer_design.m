%% Transformer Design for Haft Bridge Converter
clc, clear, close all;
%% Input Parameter
Pout = 1000; % Output Power
Vin = 310; % Input Voltage
U = 1.41; % Factor for using center-tap winding 
n = 0.9; % Efficiency is 90%
Kf = 4; % Square Wave
Bm = 0.05; % Flux Density
Fsw = 100e3; % Switching Frequency
alpha = 0.5; % Regulation
Ku = 0.4; % Window utilization
D = 0.3; % Duty Cycle
Iout = 41.67; % Ouptut Current
%% Stage Calculation
% Secondary Apparent Power
Pt = (Pout / 0.9) * 1.41 + Pout * 1.41;
% The Electrical Condition
Ke = 0.145 * Kf^2 * Fsw^2 * Bm^2 * 1e-4;
% The Core Geometry
Kg = ((Pt) / (2 * Ke * alpha)) * 1.35;
%% Core Selectec [EC-70] Input Parameter
MPL = 14.10; % Magnetic Path Length [ cm ]
We = 253; % Core Weight [ grams ]
MLT = 11.7; % Mean Length Turn [ cm ]
Ac = 2.11; % Iron Core or Cross-Sectional area [ cm^2 ]
Wa = 6.177; % Window Area or Bobbin winding area[ cm^2 ]
Ap = 13.034; % Core Product [ cm^4 ]
Kgs = 0.0941; % Core Geometry [ cm^5 ]
%% Stage Calculation
% Current Density
J = (Pt * 1e4) / (Kf * Ku * Bm * Fsw * Ap);
% The Primary Turn
Np = (Vin * 1e4) / (Kf * Bm * Fsw * Ac);
% Input Current
Iin = Pout / ( Vin * 0.9 );
% Primary Bare Wire Area
Apw = (Iin * sqrt(D)) / (J);
% Secondary Voltage per Winding
Vs = (Vin) / (7.15);
% The Secondary Turn
Ns = ((Np * Vs) / (Vin)) * ( 1 + ( alpha / 100 ));
% Secondary Bare Wier Area 
Asw = (Iout * sqrt(D)) / J;