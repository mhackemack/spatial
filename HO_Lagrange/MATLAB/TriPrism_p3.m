% Clear Project Space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; close all; fclose all;

% Define Symbolic Space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms x y z
ord = 3;
w = 1 - x - y;

% Set functional forms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b1  = w*(3*w-1)*(3/2*w-1)*(1-z)*(3*z-1)*(3/2*z-1);
b2  = x*(3*x-1)*(3/2*x-1)*(1-z)*(3*z-1)*(3/2*z-1);
b3  = y*(3*y-1)*(3/2*y-1)*(1-z)*(3*z-1)*(3/2*z-1);
b4  = 9/2*x*w*(3*w-1)*(1-z)*(3*z-1)*(3/2*z-1);
b5  = 9/2*x*w*(3*x-1)*(1-z)*(3*z-1)*(3/2*z-1);
b6  = 9/2*x*y*(3*x-1)*(1-z)*(3*z-1)*(3/2*z-1);
b7  = 9/2*x*y*(3*y-1)*(1-z)*(3*z-1)*(3/2*z-1);
b8  = 9/2*y*w*(3*y-1)*(1-z)*(3*z-1)*(3/2*z-1);
b9  = 9/2*y*w*(3*w-1)*(1-z)*(3*z-1)*(3/2*z-1);
b10 = 27*x*y*w       *(1-z)*(3*z-1)*(3/2*z-1);
b11 = w*(3*w-1)*(3/2*w-1)*z*(3*z-1)*(3/2*z-1);
b12 = x*(3*x-1)*(3/2*x-1)*z*(3*z-1)*(3/2*z-1);
b13 = y*(3*y-1)*(3/2*y-1)*z*(3*z-1)*(3/2*z-1);
b14 = 9/2*x*w*(3*w-1)*    z*(3*z-1)*(3/2*z-1);
b15 = 9/2*x*w*(3*x-1)*    z*(3*z-1)*(3/2*z-1);
b16 = 9/2*x*y*(3*x-1)*    z*(3*z-1)*(3/2*z-1);
b17 = 9/2*x*y*(3*y-1)*    z*(3*z-1)*(3/2*z-1);
b18 = 9/2*y*w*(3*y-1)*    z*(3*z-1)*(3/2*z-1);
b19 = 9/2*y*w*(3*w-1)*    z*(3*z-1)*(3/2*z-1);
b20 = 27*x*y*w*           z*(3*z-1)*(3/2*z-1);
b21 = 9*w*(3*w-1)*(3/2*w-1)*z*(z-1)*(3/2*z-1);
b22 = 9*x*(3*x-1)*(3/2*x-1)*z*(z-1)*(3/2*z-1);
b23 = 9*y*(3*y-1)*(3/2*y-1)*z*(z-1)*(3/2*z-1);
b24 = 81/2*x*w*(3*w-1)*    z*(z-1)*(3/2*z-1);
b25 = 81/2*x*w*(3*x-1)*    z*(z-1)*(3/2*z-1);
b26 = 81/2*x*y*(3*x-1)*    z*(z-1)*(3/2*z-1);
b27 = 81/2*x*y*(3*y-1)*    z*(z-1)*(3/2*z-1);
b28 = 81/2*y*w*(3*y-1)*    z*(z-1)*(3/2*z-1);
b29 = 81/2*y*w*(3*w-1)*    z*(z-1)*(3/2*z-1);
b30 = 243*x*y*w*           z*(z-1)*(3/2*z-1);
b31 = 9/2*w*(3*w-1)*(3/2*w-1)*z*(1-z)*(3*z-1);
b32 = 9/2*x*(3*x-1)*(3/2*x-1)*z*(1-z)*(3*z-1);
b33 = 9/2*y*(3*y-1)*(3/2*y-1)*z*(1-z)*(3*z-1);
b34 = 81/4*x*w*(3*w-1)*    z*(1-z)*(3*z-1);
b35 = 81/4*x*w*(3*x-1)*    z*(1-z)*(3*z-1);
b36 = 81/4*x*y*(3*x-1)*    z*(1-z)*(3*z-1);
b37 = 81/4*x*y*(3*y-1)*    z*(1-z)*(3*z-1);
b38 = 81/4*y*w*(3*y-1)*    z*(1-z)*(3*z-1);
b39 = 81/4*y*w*(3*w-1)*    z*(1-z)*(3*z-1);
b40 = 243/2*x*y*w*           z*(1-z)*(3*z-1);

% Test Lagrange Property
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b = [b1 ;b2 ;b3 ;b4 ;b5 ;b6 ;b7 ;b8 ;b9 ;b10;...
     b11;b12;b13;b14;b15;b16;b17;b18;b19;b20;...
     b21;b22;b23;b24;b25;b26;b27;b28;b29;b30;...
     b31;b32;b33;b34;b35;b36;b37;b38;b39;b40];

xx = [0,0,0;...
      1,0,0;...
      0,1,0;...
      1/3,0,0;...
      2/3,0,0;...
      2/3,1/3,0;...
      1/3,2/3,0;...
      0,2/3,0;...
      0,1/3,0;...
      1/3,1/3,0;...
      
      0,0,1;...
      1,0,1;...
      0,1,1;...
      1/3,0,1;...
      2/3,0,1;...
      2/3,1/3,1;...
      1/3,2/3,1;...
      0,2/3,1;...
      0,1/3,1;...
      1/3,1/3,1;...
      
      0,0,1/3;...
      1,0,1/3;...
      0,1,1/3;...
      1/3,0,1/3;...
      2/3,0,1/3;...
      2/3,1/3,1/3;...
      1/3,2/3,1/3;...
      0,2/3,1/3;...
      0,1/3,1/3;...
      1/3,1/3,1/3;...
      
      0,0,2/3;...
      1,0,2/3;...
      0,1,2/3;...
      1/3,0,2/3;...
      2/3,0,2/3;...
      2/3,1/3,2/3;...
      1/3,2/3,2/3;...
      0,2/3,2/3;...
      0,1/3,2/3;...
      1/3,1/3,2/3];

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
