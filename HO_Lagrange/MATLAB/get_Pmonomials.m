function out = get_Pmonomials(dim,ord)
if dim == 1
    out = (0:ord)';
elseif dim == 2
    nb = (ord+1)*(ord+2)/2;
    out = zeros(nb,2);
    cnt = 0;
    for i=0:ord
        for j=0:ord
            if (i+j) <= ord
                cnt = cnt + 1;
                out(cnt,:) = [i,j];
            end
        end
    end
elseif dim == 3
    nb = (ord+1)*(ord+2)*(ord+3)/6;
    out = zeros(nb,2);
    for i=0:ord
        for j=0:ord
            for k=0:ord
                if (i+j+k) <= ord
                    cnt = cnt + 1;
                    out(cnt,:) = [i,j,k];
                end
            end
        end
    end
end