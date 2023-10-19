function [f, tfx] = transffourier(y, Nf, fs)
    % compute FFT of y
    Yf = fft(y, Nf);
    tfx = (1/fs) * Yf;
    f =  0:fs/Nf:(Nf-1)*fs/Nf;
end