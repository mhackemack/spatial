function varargout = func_bernstein_bezier_3d(varargin)
% Grab input/output arguments
%-------------------------------------------------------------------------------
verts = varargin{1};
faces = varargin{2};
order = varargin{3};
qx    = varargin{4};
gbool = (nargout > 1);

% Perform some error checking
%-------------------------------------------------------------------------------


% Set output arguments
%-------------------------------------------------------------------------------
varargout{1} = bout;
if gbool, varargout{2} = gbool; end