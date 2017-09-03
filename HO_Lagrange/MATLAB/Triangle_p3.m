% Clear Project Space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; close all; fclose all;

% Define Symbolic Space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms x y
ord = 3;
w = 1 - x - y;

% Set functional forms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b1  = w*(3*w-1)*(3/2*w-1);
b2  = x*(3*x-1)*(3/2*x-1);
b3  = y*(3*y-1)*(3/2*y-1);
b4  = 9/2*x*w*(3*w-1);
b5  = 9/2*x*w*(3*x-1);
b6  = 9/2*x*y*(3*x-1);
b7  = 9/2*x*y*(3*y-1);
b8  = 9/2*y*w*(3*y-1);
b9  = 9/2*y*w*(3*w-1);
b10 = 27*x*y*w;

xx = [0,0;...
      1,0;...
      0,1;...
      1/3,0;...
      2/3,0;...
      2/3,1/3;...
      1/3,2/3;...
      0,2/3;...
      0,1/3;...
      1/3,1/3];

% Test Lagrange Property
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b = [b1;b2;b3;b4;b5;b6;b7;b8;b9;b10];

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