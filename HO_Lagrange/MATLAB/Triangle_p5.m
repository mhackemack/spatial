% Clear Project Space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; close all; fclose all;

% Define Symbolic Space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms x y
ord = 5;
w = 1 - x - y;

% Define 1D functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fx1 = x;       fy1 = y;       fw15 = 1/5 - x - y;
fx2 = 1/5 - x; fy2 = 1/5 - y; fw25 = 2/5 - x - y;
fx3 = 2/5 - x; fy3 = 2/5 - y; fw35 = 3/5 - x - y;
fx4 = 3/5 - x; fy4 = 3/5 - y; fw45 = 4/5 - x - y;
fx5 = 4/5 - x; fy5 = 4/5 - y; fw55 = 1 - x - y;
fx6 = 5/5 - x; fy6 = 5/5 - y;

% Set functional forms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b1  = 625/24*fw15*fw25*fw35*fw45*fw55;
b2  = 625/24*fx1*fx2*fx3*fx4*fx5;
b3  = 625/24*fy1*fy2*fy3*fy4*fy5;
b4  = 3125/24*fx1*fw55*fw25*fw35*fw45;
b5  = -3125/12*fx1*fw55*fx2*fw35*fw45;
b6  = 3125/12*fx1*fw55*fw45*fx2*fx3;
b7  = -3125/24*fx1*fw55*fx2*fx3*fx4;
b8  = -3125/24*fx1*fy1*fx2*fx3*fx4;
b9  = -3125/12*fx1*fy1*fx2*fx3*fy2;
b10 = -3125/12*fx1*fy1*fy2*fy3*fx2;
b11 = -3125/24*fx1*fy1*fy2*fy3*fy4;
b12 = -3125/24*fy1*fw55*fy2*fy3*fy4;
b13 = 3125/12*fy1*fw55*fw45*fy2*fy3;
b14 = -3125/12*fy1*fw55*fw35*fw45*fy2;
b15 = 3125/24*fy1*fw55*fw25*fw35*fw45;
b16 = 3125/6*fx1*fy1*fw55*fw35*fw45;
b17 = 3125/6*fx1*fy1*fw55*fx2*fx3;
b18 = 3125/6*fx1*fy1*fw55*fy2*fy3;
b19 = -3125/4*fx1*fy1*fw55*fx2*fw45;
b20 = 3125/4*fx1*fy1*fw55*fy2*fx2;
b21 = -3125/4*fx1*fy1*fw55*fw45*fy2;

xx = [0,0;...
      1,0;...
      0,1;...
      1/5,0;...
      2/5,0;...
      3/5,0;...
      4/5,0;...
      4/5,1/5;...
      3/5,2/5;...
      2/5,3/5;...
      1/5,4/5;...
      0,4/5;...
      0,3/5;...
      0,2/5;...
      0,1/5;...
      1/5,1/5;...
      3/5,1/5;...
      1/5,3/5;...
      2/5,1/5;...
      2/5,2/5;...
      1/5,2/5];

% Test Lagrange Property
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b = [b1;b2;b3;b4;b5;b6;b7;b8;b9;b10;b11;b12;b13;b14;b15;b16;b17;b18;b19;b20;b21];
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