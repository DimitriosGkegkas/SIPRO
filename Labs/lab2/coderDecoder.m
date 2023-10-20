function [] = coderDecoder(file_name, fmin, fmax)

% Use the audioread function to read the WAV file
[y, fs] = audioread(file_name);
y = y/(max(max(abs(y)))*1.01);

% Find the quantization
bits = audioinfo(file_name).BitsPerSample;

% Display Original Sound Info
disp("The sampling frequency is " + fs);
disp("The quantization is " + bits + " bits");

% Extract the file parts (path, name, extension)
[filepath, filename, fileext] = fileparts(file_name);

% Append "encoded" to the file name
new_file_name = fullfile(filepath, [filename, '_encoded', fileext]);

[npt, scaling] = codeur(y, fs, bits, fmin, fmax, new_file_name);
[yc, fsc, bitsc] = decodeur(new_file_name, fmin, fmax, npt, scaling);


subplot(2,1,1)
time = (0:length(y) - 1) / fs;
% Plot the audio data
plot(time, y);
% Label the axes and provide a title
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Audio Data');

subplot(2,1,2)
time = (0:length(yc) - 1) / fs;
% Plot the audio data
plot(time, yc);
% Label the axes and provide a title
xlabel('Time (s)');
ylabel('Amplitude');
title('Compressed Audio Data');

compressionRatio = dir(file_name).bytes / dir(new_file_name).bytes;
disp("We acchived a compression of " + compressionRatio*100 + "%");
[peaksnr, snr] = psnr(double(y), double(yc));
disp("With psnr " + peaksnr);



% Playing original Sound
player = audioplayer(y, fs, bits);
playblocking(player);

% Playing compresses Sound
player = audioplayer(yc, fsc, bitsc);
playblocking(player);





