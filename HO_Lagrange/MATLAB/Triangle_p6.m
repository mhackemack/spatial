% Clear Project Space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; close all; fclose all;

% Define Symbolic Space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms x y
ord = 6;
w = 1 - x - y;

% Define 1D functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fx1 = x;       fy1 = y;       fw16 = 1/6 - x - y;
fx2 = 1/6 - x; fy2 = 1/6 - y; fw26 = 2/6 - x - y;
fx3 = 2/6 - x; fy3 = 2/6 - y; fw36 = 3/6 - x - y;
fx4 = 3/6 - x; fy4 = 3/6 - y; fw46 = 4/6 - x - y;
fx5 = 4/6 - x; fy5 = 4/6 - y; fw56 = 5/6 - x - y;
fx6 = 5/6 - x; fy6 = 5/6 - y; fw66 = 6/6 - x - y;
fx7 = 5/6 - x; fy7 = 5/6 - y;

% Set functional forms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b1  = 324/5*fw16*fw26*fw36*fw46*fw56*fw66;
b2  = -324/5*fx1*fx2*fx3*fx4*fx5*fx6;
b3  = -324/5*fy1*fy2*fy3*fy4*fy5*fy6;
b4  = 1944/5*fx1*fw66*fw26*fw36*fw46*fw56;
b5  = -972*fx1*fw66*fx2*fw36*fw46*fw56;
b6  = 1296*fx1*fw66*fx2*fx3*fw46*fw56;
b7  = -972*fx1*fw66*fx2*fx3*fx4*fw56;
b8  = 1944/5*fx1*fw66*fx2*fx3*fx4*fx5;
b9  = 1944/5*fx1*fy1*fx2*fx3*fx4*fx5;
b10 = 972*fx1*fy1*fx2*fx3*fx4*fy2;
b11 = 1296*fx1*fy1*fx2*fx3*fy3*fy2;
b12 = 972*fx1*fy1*fx2*fy4*fy3*fy2;
b13 = 1944/5*fx1*fy1*fy5*fy4*fy3*fy2;
b14 = 1944/5*fy1*fw66*fy2*fy3*fy4*fy5;
b15 = -972*fy1*fw66*fy2*fy3*fy4*fw56;
b16 = 1296*fy1*fw66*fy2*fy3*fw46*fw56;
b17 = -972*fy1*fw66*fy2*fw36*fw46*fw56;
b18 = 1944/5*fy1*fw66*fw26*fw36*fw46*fw56;
b19 = 1944*fx1*fy1*fw66*fw36*fw46*fw56;
b20 = -1944*fx1*fy1*fw66*fx2*fx3*fx4;
b21 = -1944*fx1*fy1*fw66*fy2*fy3*fy4;
b22 = -3888*fx1*fy1*fw66*fx2*fw46*fw56;
b23 = 3888*fx1*fy1*fw66*fx2*fx3*fw56;
b24 = -3888*fx1*fy1*fw66*fx2*fy2*fx3;
b25 = -3888*fx1*fy1*fw66*fx2*fy2*fy3;
b26 = 3888*fx1*fy1*fw66*fy2*fw56*fy3;
b27 = -3888*fx1*fy1*fw66*fy2*fw56*fw46;
b28 = 5832*fx1*fy1*fw66*fx2*fy2*fw56;

xx = [0,0;...
      1,0;...
      0,1;...
      1/6,0;...
      2/6,0;...
      3/6,0;...
      4/6,0;...
      5/6,0;...
      5/6,1/6;...
      4/6,2/6;...
      3/6,3/6;...
      2/6,4/6;...
      1/6,5/6;...
      0,5/6;...
      0,4/6;...
      0,3/6;...
      0,2/6;...
      0,1/6;...
      1/6,1/6;...
      4/6,1/6;...
      1/6,4/6;...
      2/6,1/6;...
      3/6,1/6;...
      3/6,2/6;...
      2/6,3/6;...
      1/6,3/6;...
      1/6,2/6;...
      2/6,2/6];

% Test Lagrange Property
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b = [b1;b2;b3;b4;b5;b6;b7;b8;b9;b10;b11;b12;b13;b14;b15;b16;b17;b18;b19;b20;b21;b22;b23;b24;b25;b26;b27;b28];
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