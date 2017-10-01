% Clear Project Space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; close all; fclose all;

% Define Symbolic Space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms x y
ord = 4;
w = 1 - x - y;

% Define 1D functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fx1 = x;       fy1 = y;       fw14 = 1/4 - x - y;
fx2 = 1/4 - x; fy2 = 1/4 - y; fw24 = 2/4 - x - y;
fx3 = 2/4 - x; fy3 = 2/4 - y; fw34 = 3/4 - x - y;
fx4 = 3/4 - x; fy4 = 3/4 - y; fw44 = 1 - x - y;
fx5 = 4/4 - x; fy5 = 4/4 - y;

% Set functional forms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b1  = 32/3*fw14*fw24*fw34*fw44;
b2  = -32/3*fx1*fx2*fx3*fx4;
b3  = -32/3*fy1*fy2*fy3*fy4;
b4  = 128/3*fx1*fw44*fw24*fw34;
b5  = -64*fx1*fw44*fw34*fx2;
b6  = 128/3*fx1*fw44*fx2*fx3;
b7  = 128/3*fx1*fy1*fx2*fx3;
b8  = 64*fx1*fy1*fx2*fy2;
b9  = 128/3*fx1*fy1*fy2*fy3;
b10 = 128/3*fy1*fw44*fy2*fy3;
b11 = -64*fy1*fw44*fy2*fw34;
b12 = 128/3*fy1*fw44*fw24*fw34;
b13 = 128/1*x*y*fw44*fw34;
b14 = -128*x*y*fw44*fx2;
b15 = -128*x*y*fw44*fy2;

xx = [0,0;...
      1,0;...
      0,1;...
      1/4,0;...
      2/4,0;...
      3/4,0;...
      3/4,1/4;...
      2/4,2/4;...
      1/4,3/4;...
      0,3/4;...
      0,2/4;...
      0,1/4;...
      1/4,1/4;...
      2/4,1/4;...
      1/4,2/4];

% Test Lagrange Property
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b = [b1;b2;b3;b4;b5;b6;b7;b8;b9;b10;b11;b12;b13;b14;b15];
g = [diff(b,'x'), diff(b,'y')];

for i=1:length(b)
    for j=1:length(b)
        val_lagrange(i,j) = subs(subs(b(i),'x',xx(j,1)),'y',xx(j,2));
    end
end
sym(val_lagrange)

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