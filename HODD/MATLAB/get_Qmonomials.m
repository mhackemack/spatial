function out = get_Qmonomials(dim,ord)
nb = (1+ord)^dim;
if dim == 1
    out = (0:ord)';
elseif dim == 2
    out = zeros(nb,2);
    cnt = 0;
    for i=0:ord
        for j=0:ord
            cnt = cnt + 1;
            out(cnt,:) = [i,j];
        end
    end
elseif dim == 3
    out = zeros(nb,2);
    for i=0:ord
        for j=0:ord
            for k=0:ord
                cnt = cnt + 1;
                out(cnt,:) = [i,j,k];
            end
        end
    end
end