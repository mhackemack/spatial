% Reset matlab
%-------------------------------------------------------------------------------
clear; clc; format short; close all;
addpath('../src')

% Get reference quadrature
%-------------------------------------------------------------------------------
[rqx,rqw] = TriGaussPoints(8); nx = length(rqw);
x0 = [1,1]/2;
J  = [1,0;0,1]/2;
qx = (J\(rqx - repmat(x0,nx,1))')';
qw = 4*rqw;

% Test volumetric p=2
%-------------------------------------------------------------------------------
np = 6;
[b2,g2] = func_hierarchical_tri(2,qx);
M2 = b2'*(repmat(qw,1,np).*b2);

% Test volumetric p=3
%-------------------------------------------------------------------------------
np = 10;
[b3,g3] = func_hierarchical_tri(3,qx);
M3 = b3'*(repmat(qw,1,np).*b3);

% Test volumetric p=4
%-------------------------------------------------------------------------------
np = 15;
[b4,g4] = func_hierarchical_tri(4,qx);
M4 = b4'*(repmat(qw,1,np).*b4);

