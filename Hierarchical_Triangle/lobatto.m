function varargout = lobatto(k,x)
if k == 0
    varargout{1} = (1-x)/2;
elseif k == 1
    varargout{1} = (1+x)/2;
else
    varargout{1} = (func_legendre(k,x) - func_legendre(k-2,x))/sqrt(2*(2*k-1));
end
% Gradient
if nargout > 1
    if k == 0
        varargout{2} = -ones(length(x),1)/2;
    elseif k == 1
        varargout{2} = ones(length(x),1)/2;
    else
        [~,gk]  = func_legendre(k,x);
        [~,gk2] = func_legendre(k-2,x);
        varargout{2} = (gk - gk2)/sqrt(2*(2*k-1));
    end
end