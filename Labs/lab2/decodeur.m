function [y, fs, bits] = decodeur(filename, fmin, fmax, npt, scaling)

[ytf_compresses, fs] = audioread(filename);
ytf_compresses = scaling*ytf_compresses;
ytf_compresses = complex(ytf_compresses(:,1), ytf_compresses(:,2));

bits = audioinfo(filename).BitsPerSample;


kmin = round(npt*fmin/fs) + 1;
kmax = round(npt*fmax/fs) + 1;

ytf = [zeros(kmin, 1, 'like', ytf_compresses); ytf_compresses; zeros(kmax, 1, 'like', ytf_compresses)];

% Add the mirror image of the frequences cause the signal has to be real
% valued in time domain
ytf = [ytf, fliplr(ytf)];


y = real(ifft(ytf, npt));

y = y/(max(max(abs(y)))*1.01);