function varargout = func_bernstein_bezier_2d(varargin)
% Grab input arguments
%-------------------------------------------------------------------------------
verts = varargin{1};
faces = varargin{2};
order = varargin{3};
qx    = varargin{4};
gbool = (nargout > 1);

% Perform some error checking
%-------------------------------------------------------------------------------


% Determine preliminary geometric calcualtions
%-------------------------------------------------------------------------------


% Calculate basis functions
%-------------------------------------------------------------------------------


% Set output arguments
%-------------------------------------------------------------------------------
varargout{1} = bout;
if gbool, varargout{2} = gbool; end