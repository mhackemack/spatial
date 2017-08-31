function out = get_zproduct_monomials(mon, ord)
nb = size(mon,1);
ob = ones(nb,1);
out = [];
for i=0:ord
    out = [out;[mon,i*ob]];
end