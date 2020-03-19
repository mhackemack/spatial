% Reset matlab
clear all; clc; format short; close all;
addpath('../src')

% Get surface quadratures
%-------------------------------------------------------------------------------
[rqx,rqw] = lgwt(12,0,1); nx = length(rqw);
% Edge 1
qx1 = repmat([-1,-1],nx,1) + rqx*[2,0];
qw1 = 2*rqw;

% Edge 2
qx2 = repmat([-1,1],nx,1) + rqx*[2,-2];
qw2 = sqrt(8)*rqw;

% Edge 3
qx3 = repmat([-1,1],nx,1) + rqx*[0,-2];
qw3 = 2*rqw;

% Test Edge 1 mass matrix
%-------------------------------------------------------------------------------
np = 15;
[b1,g1] = func_hierarchical_tri(4,qx1);
M1 = b1'*(repmat(qw1,1,np).*b1);