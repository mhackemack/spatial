function varargout = func_hierarchical_tri(p,xx)
% Process input/output arguments
x = xx(:,1); y = xx(:,2);
nx = size(xx,1); ox = ones(nx,1);
grad_bool = (nargout > 1);
num_dof = (p+1)*(p+2)/2;
b = zeros(nx,num_dof);
g = zeros(nx,num_dof,2);

% Get barycentric coordinates
[bb,gb] = bary(x,y);
b1 = bb(:,1);
b2 = bb(:,2);
b3 = bb(:,3);
b(:,1:3) = bb;
g(:,1:3,1) = gb(:,:,1);
g(:,1:3,2) = gb(:,:,2);
g1 = [g(:,1,1),g(:,1,2)];
g2 = [g(:,2,1),g(:,2,2)];
g3 = [g(:,3,1),g(:,3,2)];

% Get higher order edge functions
if p > 1
    % Edge 1
    e = 1;
    for k=1:p-1
        ind = 3 + (p-1)*(e-1) + k;
        [bk,gk] = kernel(k-1,(1+2*x+y)/2);
        gk = repmat(gk,1,2).*[ox,0.5*ox];
        b(:,ind) = b1.*b2.*bk;
        g(:,ind,1) = g1(:,1).*b2.*bk + b1.*g2(:,1).*bk + b1.*b2.*gk(:,1);
        g(:,ind,2) = g1(:,2).*b2.*bk + b1.*g2(:,2).*bk + b1.*b2.*gk(:,2);
    end
    
    % Edge 2
    e = 2;
    for k=1:p-1
        ind = 3 + (p-1)*(e-1) + k;
        [bk,gk] = kernel(k-1,(y-x)/2);
        gk = repmat(gk,1,2).*[-ox/2,ox/2];
        b(:,ind) = b2.*b3.*bk;
        g(:,ind,1) = g2(:,1).*b3.*bk + b2.*g3(:,1).*bk + b2.*b3.*gk(:,1);
        g(:,ind,2) = g2(:,2).*b3.*bk + b2.*g3(:,2).*bk + b2.*b3.*gk(:,2);
    end
    
    % Edge 3
    e = 3;
    for k=1:p-1
        ind = 3 + (p-1)*(e-1) + k;
        [bk,gk] = kernel(k-1,-(1+x+2*y)/2);
        gk = repmat(gk,1,2).*[-ox/2,-ox];
        b(:,ind) = b1.*b3.*bk;
        g(:,ind,1) = g1(:,1).*b3.*bk + b1.*g3(:,1).*bk + b1.*b3.*gk(:,1);
        g(:,ind,2) = g1(:,2).*b3.*bk + b1.*g3(:,2).*bk + b1.*b3.*gk(:,2);
    end
    
end

% Get interior functions
if p > 2
    ind = 3*p+1;
    for n1=1:p-1
        for n2=1:p-1
            if n1+n2 > p-1, continue; end
            b(:,ind) = b1.*b2.*b3.*kernel(n1-1,b3-b2).*kernel(n2-1,b2-b1);
            ind = ind + 1;
        end
    end
end

% Set output arguments
varargout{1} = b;
if grad_bool, varargout{2} = g; end