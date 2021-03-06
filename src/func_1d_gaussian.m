function varargout = func_1d_gaussian(varargin)
% Grab input arguments
%-------------------------------------------------------------------------------
verts = varargin{1};
order = varargin{3};
qx    = varargin{4};
gbool = (nargout > 1);

% Perform some error checking
%-------------------------------------------------------------------------------
[nv,dim] = size(verts);
if dim ~=1, error('Vertex input is not in 1D format.'); end
if nv ~= 2, error('1D cell requires 2 vertices.'); end
if order < 0, error('FEM order must be >= 0.'); end

% Grab geometric information
%-------------------------------------------------------------------------------
vmin  = min(verts(1),verts(2));
vmax  = max(verts(1),verts(2));
[v,~] = lgwt(order+1,vmin,vmax);

% Perform some error checking
%-------------------------------------------------------------------------------
if ~gbool
    bout = func_1d_common(v,qx);
else
    [bout,gout] = func_1d_common(v,qx);
end


% Set output arguments
%-------------------------------------------------------------------------------
varargout{1} = bout;
if gbool, varargout{2} = gout; end