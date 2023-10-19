Nt = 128;
fs = 1000;
f0 = (5/128)*fs;
a = 1;
phi = 0;

n = 0:Nt-1;
y = a*cos(2*pi*f0*(n/fs) + phi);

figure;

subplot(3,2,1);
plot(n,y);
title("f0 = 5fs/128");

subplot(3,2,3);
Nf = 128;
[f, tfx]=transffourier(y,Nf,fs);
plot(f, abs(tfx), "x", "MarkerSize", 5);
xlabel("Frequency (Hz)");
ylabel("Magnitude");
title("Nf = 128");


subplot(3,2,5);
Nf = 4096;
[f, tfx]=transffourier(y,Nf,fs);
plot(f, abs(tfx));
xlabel("Frequency (Hz)");
ylabel("Magnitude");
title("Nf = 4096");


Nt = 128;
fs = 1000;
f0 = (5.7/128)*fs;
a = 1;
phi = 0;

n = 0:Nt-1;
y = a*cos(2*pi*f0*(n/fs) + phi);



subplot(3,2,2);
plot(n,y);
title("f0 = 5.7fs/128");

subplot(3,2,4);
Nf = 128;
[f, tfx]=transffourier(y,Nf,fs);
plot(f, abs(tfx), "x", "MarkerSize", 5);
xlabel("Frequency (Hz)");
ylabel("Magnitude");
title("Nf = 128");


subplot(3,2,6);
Nf = 4096;
[f, tfx]=transffourier(y,Nf,fs);
plot(f, abs(tfx));
xlabel("Frequency (Hz)");
ylabel("Magnitude");
title("Nf = 4096");



