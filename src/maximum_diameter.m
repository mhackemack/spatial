function out = maximum_diameter(v)
[nv,dim] = size(v);
out = 0;
if      dim == 1
    out = abs(v(2) - v(1));
else
    for i=1:nv
        for j=1:nv
            if i==j, continue; end
            h = norm(v(j,:) - v(i,:));
            if h > out, out = h; end
        end
    end
end