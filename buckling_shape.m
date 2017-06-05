clear; clc;

% buckling shape
 
% -----------------------------parameter-----------------------------------
% modulus of elasticity (GPa)
E=40;
% lenth/depth (mm)
l=100;
% width (mm)
b=5;
% height (mm)
h=2;
% flexual rigidity (N*m^2)
EI=12*b*h^3/12*E/(10^3);
% area (m^2)
A=b*h*10^-6