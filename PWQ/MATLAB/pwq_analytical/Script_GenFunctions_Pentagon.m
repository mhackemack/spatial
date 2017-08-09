%                                  
%                          1        
%                        / |\       
%                       /  | \    
%                      /   |  \        
%                     /    |   \    
%                    /  1  | 5  \     
%                   /      |     \   
%                  2 ------c----- 5
%                   \  2  / \  4  /     
%                    \   /   \   /     
%                     \ /  3  \ /       
%                      3-------4
%
% Clear Project Space
%-------------------------------------------------------------------------------
clear; clc; close all;
% Define symbolic space
%-------------------------------------------------------------------------------
syms t1 t2 t3 t4 t5 tc a x y
syms c11_13 c11_14 c11_24 c11_25 c11_35
syms c22_13 c22_14 c22_24 c22_25 c22_35
syms c33_13 c33_14 c33_24 c33_25 c33_35
syms c44_13 c44_14 c44_24 c44_25 c44_35
syms c55_13 c55_14 c55_24 c55_25 c55_35
syms c12_13 c12_14 c12_24 c12_25 c12_35
syms c23_13 c23_14 c23_24 c23_25 c23_35
syms c34_13 c34_14 c34_24 c34_25 c34_35
syms c45_13 c45_14 c45_24 c45_25 c45_35
syms c51_13 c51_14 c51_24 c51_25 c51_35
% Zero out appropriate functions
t1 = 0;
t4 = 0;
t5 = 0;
% Define linear functions
%-------------------------------------------------------------------------------
% b1 = a*tc;
% b2 = a*tc;
% b3 = a*tc;
% b4 = a*tc;
% b5 = a*tc;
bb1 = t1;
bb2 = t2;
bb3 = t3;
bb4 = t4;
bb5 = t5;
b1 = t1 + a*tc;
b2 = t2 + a*tc;
b3 = t3 + a*tc;
b4 = t4 + a*tc;
b5 = t5 + a*tc;
% Define quadratic functions
%-------------------------------------------------------------------------------
% interior functions
m13 = b1*b3;
m14 = b1*b4;
m24 = b2*b4;
m25 = b2*b5;
m35 = b3*b5;
mm13 = bb1*bb3;
mm14 = bb1*bb4;
mm24 = bb2*bb4;
mm25 = bb2*bb5;
mm35 = bb3*bb5;
% vertex functions
% m11 = b1*b1 + c11_13*m13 + c11_14*m14 + c11_24*m24 + c11_25*m25 + c11_35*m35;
% m22 = b2*b2 + c22_13*m13 + c22_14*m14 + c22_24*m24 + c22_25*m25 + c22_35*m35;
% m33 = b3*b3 + c33_13*m13 + c33_14*m14 + c33_24*m24 + c33_25*m25 + c33_35*m35;
% m44 = b4*b4 + c44_13*m13 + c44_14*m14 + c44_24*m24 + c44_25*m25 + c44_35*m35;
% m55 = b5*b5 + c55_13*m13 + c55_14*m14 + c55_24*m24 + c55_25*m25 + c55_35*m35;
m11 = b1*b1;
m22 = b2*b2;
m33 = b3*b3;
m44 = b4*b4;
m55 = b5*b5;
mm11 = bb1*bb1;
mm22 = bb2*bb2;
mm33 = bb3*bb3;
mm44 = bb4*bb4;
mm55 = bb5*bb5;
% edge functions
% m12 = b1*b2 + c12_13*m13 + c12_14*m14 + c12_24*m24 + c12_25*m25 + c12_35*m35;
% m23 = b2*b3 + c23_13*m13 + c23_14*m14 + c23_24*m24 + c23_25*m25 + c23_35*m35;
% m34 = b3*b4 + c34_13*m13 + c34_14*m14 + c34_24*m24 + c34_25*m25 + c34_35*m35;
% m45 = b4*b5 + c45_13*m13 + c45_14*m14 + c45_24*m24 + c45_25*m25 + c45_35*m35;
% m51 = b5*b1 + c51_13*m13 + c51_14*m14 + c51_24*m24 + c51_25*m25 + c51_35*m35;
m12 = b1*b2;
m23 = b2*b3;
m34 = b3*b4;
m45 = b4*b5;
m51 = b5*b1;
mm12 = bb1*bb2;
mm23 = bb2*bb3;
mm34 = bb3*bb4;
mm45 = bb4*bb5;
mm51 = bb5*bb1;


b   = [m11;m22;m33;m44;m55;2*m12;2*m23;2*m34;2*m45;2*m51];
bb  = [mm11;mm22;mm33;mm44;mm55;2*mm12;2*mm23;2*mm34;2*mm45;2*mm51];


M   = b*transpose(b);
MM  = bb*transpose(bb);


I   = a^4*tc^4*ones(5);
M_I = expand(simplify(M - [I,2*I;2*I,4*I] - MM))
% M_I = expand(simplify(M - [I,2*I;2*I,4*I]))



