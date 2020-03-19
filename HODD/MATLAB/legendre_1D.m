function [b,g] = legendre_1D(ord,x)
nx = size(x,1);
if ord == 0
    b = ones(nx,1);
    g = zeros(nx,1);
elseif ord == 1
    b = x;
    g = ones(nx,1);
elseif ord == 2
    
elseif ord == 3
    
elseif ord == 4
    
elseif ord == 5
    
elseif ord == 6
    
elseif ord == 7
    
elseif ord == 8
    
elseif ord == 9
    
elseif ord == 10
    
else
    
end
% Normalize functions
b = b * sqrt((2*ord+1)/2);