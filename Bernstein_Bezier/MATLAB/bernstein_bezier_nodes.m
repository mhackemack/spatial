function out = bernstein_bezier_nodes(verts, faces, order)
dim = size(verts,2);
if dim == 2
    out = get_2d_nodes(verts, order);
elseif dim == 3
    out = get_3d_nodes(verts, faces, order);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function out = get_2d_nodes(verts, order)
nv = size(verts,1);
out = verts;
for i=1:nv
    ii = mod(i,nv) + 1;
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function out = get_3d_nodes(verts, faces, order)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%