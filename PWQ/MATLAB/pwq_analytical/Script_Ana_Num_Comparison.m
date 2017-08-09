% Clear Project Space
%-------------------------------------------------------------------------------
clear; clc; close all;
% Define Testing Polygon's
%-------------------------------------------------------------------------------
p = 0;
% Reference Triangle
p = p + 1;
verts{p} = [0,0;1,0;0,1];
faces{p} = {[1,2],[2,3],[3,1]};
name{p}  = 'ref_tri';
[MVn{p},MSn{p},QVn{p},QSn{p}] = bf_cell_func_PWQNum(3,verts{p},faces{p},2,false,[1,1,1],[1,1],false);
[MVa{p},MSa{p}] = bf_cell_func_PWQAna(3,verts{p},faces{p},2,false);
% Arbitrary Triangle
p = p + 1;
verts{p} = [4,2;1,4;0,0];
faces{p} = {[1,2],[2,3],[3,1]};
name{p}  = 'ref_tri';
[MVn{p},MSn{p},QVn{p},QSn{p}] = bf_cell_func_PWQNum(3,verts{p},faces{p},2,false,[1,1,1],[1,1],false);
[MVa{p},MSa{p}] = bf_cell_func_PWQAna(3,verts{p},faces{p},2,false);
% Unit Square
% p = p + 1;
% verts{p} = [0,0;1,0;1,1;0,1];
% faces{p} = {[1,2],[2,3],[3,4],[4,1]};
% name{p}  = 'square';

% Degenerate Pentagon
% p = p + 1;
% verts{p} = [0,0;1,0;1,1;.5,1;0,1];
% faces{p} = {[1,2],[2,3],[3,4],[4,5],[5,1]};
% name{p}  = 'deg_pentagon';