% Clear Project Space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; close all; fclose all;

% Define Symbolic Space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms x y
ord = 2;
w = 1 - x - y;

% Set functional forms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b1  = w*(2*w-1);
b2  = x*(2*x-1);
b3  = y*(2*y-1);
b4  = 4*w*x;
b5  = 4*x*y;
b6  = 4*y*w;

xx = [0,0;...
      1,0;...
      0,1;...
      1/2,0;...
      1/2,1/2;...
      0,1/2];

% Test Lagrange Property
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b = [b1;b2;b3;b4;b5;b6];
g = [diff(b,'x'), diff(b,'y')];

for i=1:length(b)
    for j=1:length(b)
        val_lagrange(i,j) = subs(subs(b(i),'x',xx(j,1)),'y',xx(j,2));
    end
end
val_lagrange

% Test Interpolation Property
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mon = get_Pmonomials(2,ord);
for i=1:size(mon,1)
    aa = mon(i,1);
    bb = mon(i,2);
    a_sym = x^aa*y^bb;
    a_ana = simplify((xx(:,1).^aa.*xx(:,2).^bb)'*b);
    val_interp(i,:) = [a_sym,a_ana,a_sym-a_ana];
end
val_interp