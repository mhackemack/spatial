function A = get_A_matrix(verts, faces)
nverts = size(verts,1);
[ser_verts, ser_nodes] = get_serendipity_nodes(verts, faces);
qp = get_quad_pairings(nverts);
dp = get_diag_pairings(nverts, qp);
A = get_quad_pairing_transformation(ser_verts, ser_nodes, qp, dp);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ser_verts, ser_nodes] = get_serendipity_nodes(verts, faces)
[nverts,dim] = size(verts);
ser_verts = zeros(2*nverts, dim);
ser_nodes = zeros(2*nverts, 2); ser_nodes(1:nverts,:) = [(1:nverts)',(1:nverts)'];
ser_verts(1:nverts,:) = verts;
for f=1:length(faces)
    fv = faces{f};
    ser_verts(nverts+f,:) = (verts(fv(1),:) + verts(fv(2),:))/2;
    ser_nodes(nverts+f,:) = fv;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function out = get_diag_pairings(nv, qps)
nq = nv*(nv-3)/2;
out = zeros(nq,6);
d = 2*nv;
for i=1:nq
    d = d + 1;
    tqp = qps(d,:);
    out(i,1:2) = tqp;
    % 1st vertex
    if tqp(1) == 1
        out(i,3) = 2*nv;
    else
        out(i,3) = nv + tqp(1) - 1;
    end
    out(i,4) = nv + tqp(1);
    % second vertex
    if tqp(2) == 1
        out(i,5) = 2*nv;
    else
        out(i,5) = nv + tqp(2) - 1;
    end
    out(i,6) = nv + tqp(2);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function A = get_quad_pairing_transformation(verts, ser_nodes, quad_pairs, diag_pairs)
nnodes = size(verts,1); nqp = size(diag_pairs,1); nv = nnodes/2;
A = zeros(nnodes, size(quad_pairs,1)); A(1:nnodes,1:nnodes) = eye(nnodes);
L = zeros(6,nnodes);
% Loop through vertex nodes
for j=1:nv
    vv = verts(j,:);
    % c-constraint
    L(1,j) = 1;
    % x-constraint
    L(2,j) = vv(1);
    % y-constraint
    L(3,j) = vv(2);
    % x_x-constraint
    L(4,j) = vv(1)*vv(1);
    % y_y-constraint
    L(5,j) = vv(2)*vv(2);
    % x_y-constraint
    L(6,j) = vv(1)*vv(2);
end
% Loop through all edge nodes
for j=(nv+1):nnodes
    v1 = verts(ser_nodes(j,1),:); v2 = verts(ser_nodes(j,2),:);
    t = v1'*v2 + v2'*v1;
    % c-constraint
    L(1,j) = 2;
    % x-constraint
    L(2,j) = 2*verts(j,1);
    % y-constraint
    L(3,j) = 2*verts(j,2);
    % x_x-constraint
    L(4,j) = t(1,1);
    % y_y-constraint
    L(5,j) = t(2,2);
    % x_y-constraint
    L(6,j) = t(1,2);
end
% Loop through interior diagonal pairs
d = nnodes;
for i=1:nqp
    d = d + 1;
    va = verts(quad_pairs(d,1),:);
    vb = verts(quad_pairs(d,2),:);
    % Apply right-hand side
    q = [2;(va(1)+vb(1));(va(2)+vb(2));2*va(1)*vb(1);2*va(2)*vb(2);(va(1)*vb(2)+va(2)*vb(1))];
    t = L'*((L*L')\q); t(abs(t) < 1e-14) = 0;
    A(:,d) = t;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%