% Clear Project Space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; close all; fclose all;

% Define Symbolic Space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms x y z
ord = 1;
w = 1 - x - y;

% Set functional forms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b1 = w*(1-z);
b2 = x*(1-z);
b3 = y*(1-z);
b4 = w*z;
b5 = x*z;
b6 = y*z;

% Test Lagrange Property
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b = [b1;b2;b3;b4;b5;b6];

xx = [0,0,0;...
      1,0,0;...
      0,1,0;...
      0,0,1;...
      1,0,1;...
      0,1,1];

for i=1:length(b)
    for j=1:length(b)
        val_lagrange(i,j) = subs(subs(subs(b(i),'x',xx(j,1)),'y',xx(j,2)),'z',xx(j,3));
    end
end
val_lagrange

% Test Interpolation Property
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tri_mon = get_Pmonomials(2,ord);
mon = get_zproduct_monomials(tri_mon,ord);
for i=1:size(mon,1)
    aa = mon(i,1);
    bb = mon(i,2);
    cc = mon(i,3);
    a_sym = x^aa*y^bb*z^cc;
    a_ana = simplify((xx(:,1).^aa.*xx(:,2).^bb.*xx(:,3).^cc)'*b);
    val_interp(i,:) = [a_sym,a_ana,a_sym-a_ana];
end
val_interp

