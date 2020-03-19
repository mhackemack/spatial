% Clear Project Space
%-------------------------------------------------------------------------------
clear; clc; close all; fclose all;

% Define functions
%-------------------------------------------------------------------------------
syms x;
ntot = 10;
b = sym([1;x;zeros(ntot-1,1)]);
for n=2:ntot
    b(n+1) = ((2*n-1)*x*b(n) - (n-1)*b(n-1))/(n);
end
g = diff(b,'x');