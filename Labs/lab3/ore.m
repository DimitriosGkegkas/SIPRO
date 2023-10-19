function [N, Xe] = ore(equarec, N, x0)
    x0 = x0(:);
    dim = length(x0);
    Duree = N(2) - N(1) +1;
    N = N(1):N(2);
    Xe = zeros(Duree, dim);
    xe = x0;
    indmatlab = 1;
    for n = N
        Xe(indmatlab,:) = xe';
        xe = equarec(n, xe);
        indmatlab = indmatlab +1;
    end
end