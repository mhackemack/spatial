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
function varargout = bf_cell_func_PWQAna( varargin )
% Collect Input/Output Arguments
% ------------------------------------------------------------------------------
nverts = varargin{1};
verts = varargin{2}(1:nverts,:); cverts = mean(verts);
faces = varargin{3}; nf = length(faces);
order = varargin{4};
lump_bool = varargin{5};

% Prepare Vertices and Dimensional Space
% ------------------------------------------------------------------------------
dim = size(verts,2);
ntot = get_num_serendipity_points( dim, nverts, length(faces), order);
f_dofs = get_2Dserendipity_face_dofs(order, nverts);

% Allocate Matrix Space
% ------------------------------------------------------------------------------
znv = zeros(ntot);
M = znv;
K = znv;
G = cell(dim, 1);
for d=1:dim, G{d} = znv; end
MM = cell(nf, 1);
G2 = cell(nf, 1);
F  = cell(nf, 1);
for f=1:nf
    MM{f} = zeros(length(faces{f}) + (order-1));
    F{f}  = zeros(length(faces{f}) + (order-1));
    for d=1:dim, G2{f}{d} = znv; end
end

% Allocate Reference Data
% ------------------------------------------------------------------------------
T40 = 12/360; T31 = 3/360; T22 = 2/360;
[ve_mat, tc_mat] = get_ref_mass_mats(nverts);
aa = 1/nverts; aa4 = (1/nverts)^4;

% Loop through sides - build all contributions
% ------------------------------------------------------------------------------
for f=1:nf
    % Get geometric and dof information
    %---------------------------------------------------------------------------
    ftot = f_dofs{f};
    vvf = [verts(ftot(1:2),:);cverts];
    J = get_simplex_jacobian(dim, vvf);
    detJ = J(1,1)*J(2,2)-J(2,1)*J(1,2);
    invJ = [J(2,2),-J(1,2);-J(2,1),J(1,1)]/detJ;
    
    %---------------------------------------------------------------------------
    %---------------------------------------------------------------------------
    %                       Exterior Contributions Only
    %---------------------------------------------------------------------------
    %---------------------------------------------------------------------------
    % Assign vertex/edge contribution (a^0 contributions)
    %---------------------------------------------------------------------------
    M(ftot,ftot) = M(ftot,ftot) + detJ*ve_mat;
    % Assign a^1 contributions
    %---------------------------------------------------------------------------
    
    % Assign a^2 contributions
    %---------------------------------------------------------------------------
    
    % Assign a^3 contributions
    %---------------------------------------------------------------------------
    
    % Assign a^4 contributions
    %---------------------------------------------------------------------------
    M = M + aa4*detJ*tc_mat;
    %---------------------------------------------------------------------------
    %---------------------------------------------------------------------------
    %                       Interior Contributions Only
    %---------------------------------------------------------------------------
    %---------------------------------------------------------------------------
    
    
end


% Process Output Structures
% ------------------------------------------------------------------------------
% Volume Matrices
varargout{1} = {M, K, G};
% Surface Matrices
varargout{2} = {MM, G2, F};



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ve_mat,tc_mat] = get_ref_mass_mats(nverts)
T40 = 12/360; T31 = 3/360; T22 = 2/360;
ve_mat = [T40,T22,2*T31;T22,T40,2*T31;2*T31,2*T31,4*T22];
I = T40*ones(nverts); 
tc_mat = [I,2*I;2*I,4*I]; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
