function quad_pairs = get_quad_pairings(nv)
ntot = 2*nv+nv*(nv-3)/2;
quad_pairs = zeros(ntot,2);
% Loop through vertices and assign V/E terms
d = 2*nv;
for i=1:nv
    quad_pairs(i,:) = i;
    quad_pairs(i+nv,:) = [i,mod(i,nv)+1];
    if i>nv-2, continue; end
    if i==1
        jj = nv-1;
    else
        jj = nv;
    end
    for j=i+2:jj
        d = d + 1;
        quad_pairs(d,:) = [i,j];
    end
end