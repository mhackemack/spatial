function varargout = kernel(k,x)
gbool = (nargout > 1);
if ~gbool
    varargout{1} = lobatto(k+2,x)./(lobatto(0,x).*lobatto(1,x));
else
    [bn,dn] = lobatto(k+2,x);
    [b0,d0] = lobatto(0,x);
    [b1,d1] = lobatto(1,x);
    varargout{1} = bn./(b0.*b1);
    bd = b0.*b1;
    dd = d0.*b1 + d1.*b0;
    varargout{2} = (dn.*bd - bn.*dd)./(bd.^2);
end