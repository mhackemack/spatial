% Clear Project Space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; close all; fclose all;

% Define Symbolic Space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms x y z
ord = 1;

% Define 1D functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x1 = 0/1; x2 = 1/1;
y1 = 0/1; y2 = 1/1;
z1 = 0/1; z2 = 1/1;

bx1 = x - x1; bx2 = x - x2;
by1 = y - y1; by2 = y - y2;
bz1 = z - z1; bz2 = z - z2;

% b1  = 
% b2  = 
% b3  = 
% b4  = 
% b5  = 
% b6  = 
% b7  = 
% b8  = 

% Build Space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b = [b1;b2;b3;b4;b5;b6;b7;b8];
g = [diff(b,'x'), diff(b,'y', diff(b,'z'))];

xx = [0,0,0;...
      1,0,0;...
      1,1,0;...
      0,1,0;...
      0,0,1;...
      1,0,1;...
      1,1,1;...
      0,1,1];

% Test Lagrange Property
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:length(b)
    for j=1:length(b)
        val_lagrange(i,j) = subs(subs(subs(b(i),'x',xx(j,1)),'y',xx(j,2)),'z',xx(j,3));
    end
end
val_lagrange

% Test Interpolation Property
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mon = get_Qmonomials(3,ord);
for i=1:size(mon,1)
    aa = mon(i,1); bb = mon(i,2); cc = mon(i,3);
    a_sym = x^aa*y^bb*y^cc;
    a_ana = simplify((xx(:,1).^aa.*xx(:,2).^bb.*xx(:,3).^cc)'*b);
    val_interp(i,:) = [a_sym,a_ana,a_sym-a_ana];
end
val_interp