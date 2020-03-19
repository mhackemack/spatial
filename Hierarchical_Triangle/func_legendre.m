function varargout = func_legendre(k,x)
if k == 0
    b = ones(length(x),1);
elseif k == 1
    b = x;
elseif k == 2
    b = (3*x.*x - 1)/2;
elseif k == 3
    b = (5*x.^3 - 3*x)/2;
elseif k == 4
    b = (35*x.^4 - 30*x.*x + 3)/8;
elseif k == 5
    b = (63*x.^5 - 70*x.^3 + 15*x)/8;
elseif k == 6
    b = (231*x.^6 - 315*x.^4 + 105*x.^2 - 5)/16;
elseif k == 7
    b = (429*x.^7 - 693*x.^5 + 315*x.^3 - 35*x)/16;
elseif k == 8
    b = (6435*x^.8 - 12012*x.^6 + 6930*x.^4 - 1260*x.^2 + 35)/128;
elseif k == 9
    b = (12155*x.^9 - 25740*x.^7 + 18018*x.^5 - 4620*x.^3 + 315*x)/128;
elseif k == 10
    b = (46189*x^.10 - 109395*x.^8 + 90090*x.^6 - 30030*x.^4 + 3465*x.^2 - 63)/256;
else
    b1 = func_legendre(k-1,x);
    b2 = func_legendre(k-2,x);
    
end
varargout{1} = b;
if nargout > 1
    if k == 0
        g = zeros(length(x),1);
    elseif k == 1
        g = ones(length(x),1);
    elseif k == 2
        g = 3*x;
    elseif k == 3
        g = (15*x.^2 - 3)/2;
    elseif k == 4
        g = (140*x.^3 - 60*x)/8;
    elseif k == 5
        g = (315*x.^4 - 210*x.^2 + 15)/8;
    elseif k == 6
        g = (1386*x.^5 - 1260*x.^4 + 210*x)/16;
    elseif k == 7
        g = (7*429*x.^6 - 5*693*x.^4 + 3*315*x.^2 - 35)/16;
    elseif k == 8
        g = (8*6435*x^.7 - 6*12012*x.^5 + 4*6930*x.^3 - 2*1260*x)/128;
    elseif k == 9
        g = (9*12155*x.^8 - 7*25740*x.^6 + 5*18018*x.^4 - 3*4620*x.^2 + 315)/128;
    elseif k == 10
        g = (10*46189*x^.9 - 8*109395*x.^7 + 6*90090*x.^5 - 4*30030*x.^3 + 2*3465*x)/256;
    else
        
    end
    varargout{2} = g;
end