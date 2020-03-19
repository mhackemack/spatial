function varargout = bary(x,y)
nx = length(x);
varargout{1} = [-(x+y)/2,(1+x)/2,(1+y)/2];
if nargout > 1
    go = ones(nx,1);
    g = zeros(nx,3,2);
    g(:,:,1) = 0.5*go*[-1,1,0];
    g(:,:,2) = 0.5*go*[-1,0,1];
    varargout{2} = g;
end