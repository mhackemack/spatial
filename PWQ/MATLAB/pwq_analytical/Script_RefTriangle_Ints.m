% Clear Project Space
%-------------------------------------------------------------------------------
clear; clc; close all;

% Define symbolic space
%-------------------------------------------------------------------------------
syms x y

% Define linear functions
%-------------------------------------------------------------------------------
t1 = 1-x-y;
t2 = x;
t3 = y;

% Define quadratic functions
%-------------------------------------------------------------------------------
m11 = t1*t1;
m22 = t2*t2;
m33 = t3*t3;
m12 = 2*t1*t2;
m23 = 2*t2*t3;
m31 = 2*t3*t1;

b = [m11;m22;m33;m12;m23;m31];

M = int(int(b*transpose(b),x,0,1-y),y,0,1)*180
% Gx = int(int(diff(b,'x')*transpose(b),x,0,1-y),y,0,1)
% Gy = int(int(diff(b,'y')*transpose(b),x,0,1-y),y,0,1)

Mvec_40 = int(int([t1^4;t2^4;t3^4],x,0,1-y),y,0,1)*360
Mvec_22 = int(int([t1^2*t2^2;t2^2*t3^2;t1^2*t3^2],x,0,1-y),y,0,1)*360
Mvec_31 = int(int([t1^3*t2;t1^3*t3;t2^3*t1;t2^3*t3;t3^3*t1;t3^3*t2],x,0,1-y),y,0,1)*360