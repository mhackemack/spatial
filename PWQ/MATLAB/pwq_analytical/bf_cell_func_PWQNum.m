%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Title:          PWQ Main Generation Function
%
%   Author:         Michael W. Hackemack
%   Institution:    Texas A&M University
%   Year:           2016
%
%   Description:    MATLAB script to produce the elementary volume and
%                   surface matrices, along with the appropriate quadrature
%                   set outputs for the PWQ basis functions.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Input Space:    1) Number of geometric vertices
%                   2) Vertices
%                   3) Face Vertices
%                   4) FEM Order
%                   5) FEM Lumping Boolean
%                   6) Volumetric Matrix Flags
%                   7) Surface Matrix Flags
%                   8) Quadrature boolean
%                   9) Quadrature Order (Optional)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function varargout = bf_cell_func_PWQNum( varargin )
% Collect Input/Output Arguments
% ------------------------------------------------------------------------------
nout = nargout;
nverts = varargin{1};
verts = varargin{2}(1:nverts,:);
faces = varargin{3}; nf = length(faces);
order = varargin{4};
lump_bool = varargin{5};
v_flags = varargin{6};
s_flags = varargin{7};
q_bool = varargin{8};
q_ord = order+2;
if nargin > 8
    if ~isempty(varargin{9}),q_ord = varargin{9};end
end
% Prepare Vertices and Dimensional Space
% ------------------------------------------------------------------------------
[mv,nv] = size(verts); 
if nv > mv, verts = verts'; end
[nv,dim] = size(verts);
ntot = get_num_serendipity_points( dim, nverts, length(faces), order);
% Quick Error Checking
% ------------------------------------------------------------------------------
if order ~= 2, error('PWQ only defined for 2nd order.'); end
if dim ~= 2, error('PWQ only defined for 2D at this time.'); end
if nv ~= nverts, error('Something is not properly defined.'); end
% Allocate Matrix Space
% ------------------------------------------------------------------------------
znv = zeros(ntot);
M = znv;
K = znv;
G = cell(dim, 1);
for d=1:dim, G{d} = znv; end
IV = [];
MM = cell(nf, 1);
G2 = cell(nf, 1);
F  = cell(nf, 1);
for f=1:nf
    MM{f} = zeros(length(faces{f}) + (order-1));   % 2D only...
    F{f}  = zeros(length(faces{f}) + (order-1));
    for d=1:dim, G2{f}{d} = znv; end
end
% Collect all Matrices and Quadratures
% ------------------------------------------------------------------------------
f_dofs = get_face_dofs(nv, faces, order);
% Calculate quadrature points and basis function values
[qx_v, qw_v] = get_general_volume_quadrature(verts, faces, q_ord, true); nqx = length(qw_v);
[bmv, gmv] = PWLD_O2_basis_functions(verts, qx_v, faces, order, nverts);
% mass matrix
for q=1:nqx
    bt = bmv(q,:);
    M = M + qw_v(q) * (bt'*bt);
end
if lump_bool, M = diag(sum(M)); end
% stiffness matrix
if v_flags(2)
    for q=1:nqx
        bg = gmv(:,:,q);
        K = K + qw_v(q) * (bg*bg');
    end
end
% gradient matrix
if v_flags(3)
    for q=1:nqx
        bt = bmv(q,:);
        bg = gmv(:,:,q);
        for d=1:dim
            G{d} = G{d} + qw_v(q) * (bg(:,d)*bt)';
        end
    end
end
% Face-Wise Values
[qx_s, qw_s, bms, gms] = get_surface_values(verts, faces, order, q_ord, s_flags(2));
% surface matrices
for f=1:nf
    nqx = length(qw_s{f});
    fv = f_dofs{f};
    tbmsf = bms{f};
    for q=1:nqx
        bt = tbmsf(q,:);
        MM{f} = MM{f} + qw_s{f}(q) * (bt'*bt);
        if s_flags(2)
            gt = gms{f};
            for d=1:dim
                G2{f}{d}(:,fv) = G2{f}{d}(:,fv) + qw_s{f}(q) * gt(:,d,q)*bt;
            end
        end
    end
end
% Process Output Structures
% ------------------------------------------------------------------------------
% Volume Matrices
varargout{1} = {M, K, G, IV};
% Surface Matrices
varargout{2} = {MM, G2, F};
% Quadrature Structures
varargout{3} = {qx_v, qw_v, bmv, gmv};
varargout{4} = {qx_s, qw_s, bms, gms};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Auxiallary Function Calls
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function out = get_face_dofs(nv, faces, ord)
if ord == 1
    out = faces;
else % only 2D allowed here
    nf = length(faces);
    out = cell(nf,1);
    for f=1:nf
        out{f} = [faces{f},nv+f];
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [qx_s, qw_s, bms, gms] = get_surface_values(verts, faces, ord, q_ord, sgrad_bool)
nf = length(faces);
qx_s = cell(nf, 1);
qw_s = cell(nf, 1);
bms  = cell(nf, 1);
gms  = cell(nf, 1);
[tqx, tqw] = get_legendre_gauss_quad(q_ord); ntqx = length(tqw);
ttqx1 = [];
fones = ones(ntqx,1);
for f=1:nf
    fv = faces{f};
    v = verts(fv,:);
    dx = v(2,:) - v(1,:);
    len = norm(diff(v));
%     n = [dx(2), -dx(1)]/len;
    qw_s{f} = tqw*len;
    qx_s{f} = fones*v(1,:) + tqx*dx;
    ttqx1 = [ttqx1;qx_s{f}];
    if ord == 1
        bms{f} = [1-tqx, tqx];
    elseif ord == 2
%         bms{f} = [2*(1-tqx).*(1/2-tqx),2*(tqx-1/2).*tqx,4*tqx.*(1-tqx)];
        bms{f} = [(1-tqx).^2, tqx.^2, 2*tqx.*(1-tqx)];
    end
end
% Get Gradient Estimates
if sgrad_bool
    if ord == 1
        [~,tg] = PWLD_O2_basis_functions(verts, ttqx1, faces, ord, size(verts,1));
    elseif ord == 2
        [~,tg] = PWLD_O2_basis_functions(verts, ttqx1, faces, ord, size(verts,1));
    end
    % Rebuild Surface Gradients
    for f=1:nf
        iif = ntqx*(f-1)+1:ntqx*f;
        gms{f} = tg(:,:,iif);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%