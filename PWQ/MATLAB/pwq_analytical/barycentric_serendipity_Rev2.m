%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Title:          Quadratic Serendipity Generator (Rev2)
%
%   Author:         Michael W. Hackemack
%   Institution:    Texas A&M University
%   Year:           2014
%
%   Description:    
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   A Matrix Notes: To determine the quadratic to serendipity transformation
%                   matrix (xi=A*mu), we utilize the Moore-Penrose psuedoinverse.
%                   Eliminating each diagonal entry provides an underdetermined
%                   system of equations. Given a (6x2v) system of constraint
%                   equations, L, the pseudoinverse is L'*(L*L')^(-1).
%
%                   https://en.wikipedia.org/wiki/Moore-Penrose_pseudoinverse
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function varargout = barycentric_serendipity_Rev2(varargin)
nout = nargout;
grad_bool = false;
% Collect Input Arguments
% ------------------------------------------------------------------------------
verts = varargin{1};
qx    = varargin{2};
faces = varargin{3};
basis = varargin{4};
% Prepare Vertices and Dimensional Space
% ------------------------------------------------------------------------------
[nverts,dim] = size(verts); ntot = 2*nverts;
nqx = size(qx, 1);
% Quick Error Checking
% ------------------------------------------------------------------------------
if dim ~= 2, error('Should only be 2D.'); end
% Get Problem Preliminaries
% ------------------------------------------------------------------------------
if nout > 1, grad_bool = true; end
h = get_max_diamter( verts ); h0 = eye(dim)/h;
scaled_verts = (h0*verts')'; qx = (h0*qx')';
msv = mean(scaled_verts);
scaled_verts = scaled_verts - ones(nverts,1)*msv;
qx = qx - ones(nqx,1)*msv;
% Retrieve Linear Basis Functions
% ------------------------------------------------------------------------------
if grad_bool
    [blin, glin] = basis(scaled_verts,qx,faces,1,nverts);
else
    blin = basis(scaled_verts,qx,faces,1,nverts);
end
% Build Quadratic Serendipity Basis Function Space
% ------------------------------------------------------------------------------
quad_pairs = get_quad_pairings(nverts); num_dp = size(quad_pairs,1) - ntot;
A = get_A_matrix(verts, faces);
q_vals = blin(:,quad_pairs(:,1)).*blin(:,quad_pairs(:,2));
bout = (A*q_vals')';
% for q=1:nqx, bout(q,:) = A*q_vals(q,:)'; end
% Create Basis Function Gradients
% ------------------------------------------------------------------------------
if grad_bool
    gout = zeros(ntot,dim,nqx);
    gfact = [ones(1,nverts),2*ones(1,nverts)];
    % Loop through points and calculate gradient values
    for q=1:nqx
        for i=1:ntot
            tt = [0,0];
            t1 = quad_pairs(i,1); t2 = quad_pairs(i,2);
            tt = tt + blin(q,t1)*glin(t2,:,q);
            tt = tt + blin(q,t2)*glin(t1,:,q);
            for j=1:num_dp
                t1 = quad_pairs(ntot+j,1); t2 = quad_pairs(ntot+j,2);
                aa = A(i,ntot+j);
                tt = tt + aa*blin(q,t1)*glin(t2,:,q);
                tt = tt + aa*blin(q,t2)*glin(t1,:,q);
            end
            gout(i,:,q) = gfact(i)*tt;
        end
        gout(:,:,q) = gout(:,:,q)*h0;
    end
end
% Set Output Arguments
% ------------------------------------------------------------------------------
bout(:,nverts+1:end) = 2*bout(:,nverts+1:end);
varargout{1} = bout;
if grad_bool, varargout{2} = gout; end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function List
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function out_max = get_max_diamter( verts )
nv = size(verts,1);
out_max = 0;
for i=1:nv
    vi = verts(i,:);
    for j=1:nv
        if i==j, continue; end
        h = norm(verts(j,:) - vi);
        if h > out_max, out_max = h; end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%