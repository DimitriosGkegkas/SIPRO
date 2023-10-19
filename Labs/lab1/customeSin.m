function y = customeSin(Nt, fs, f0, a, phi)
    n = 0:Nt-1;
    y = a*cos(2*pi*f0*(n/fs) + phi);
end