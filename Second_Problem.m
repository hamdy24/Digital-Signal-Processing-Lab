% Read the file and get its properties
pkg load signal;
[x, Fs] = audioread('D:\Engineering\Labs\DSP\whistle.wav');
N = length(x);
t = (0:N-1)/Fs;
sound(x,Fs,16);
% Plot the frequency spectrum of signal x
X = fft(x);
f = (0:N-1)*(Fs/N);
figure;
plot(f, abs(X));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum of Signal x');

% Design a filter to reject the sinusoidal signals from signal x
f1 = 400;   % First frequency to reject
f2 = 600;  % Second frequency to reject
[b, a] = butter(4, [f1, f2]/(Fs/2), 'stop');

% Design a filter to reject the sinusoidal signals from signal x
f3 = 1400;   % First frequency to reject
f4 = 1600;  % Second frequency to reject
[b2, a2] = butter(4, [f3, f4]/(Fs/2), 'stop');

% Plot frequency response and impulse response of the designed filter
freq = linspace(0, Fs/2, 10000);
H = freqz(b, a, freq, Fs);
figure;
plot(freq, abs(H));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Response of the Filter');

h = impz(b, a, 100);
figure;
stem(h);
xlabel('Sample');
ylabel('Amplitude');
title('Impulse Response of the Filter');

% Apply the filter to signal x to get signal y
y = filter(b, a, x);
y = filter(b2, a2, y);

% Plot the frequency spectrum of signal y
Y = fft(y);
figure;
plot(f, abs(Y));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum of Signal y');

% Play the output signal
sound(y, Fs,16);

% Calculate the energy of the original and filtered signals
E_x = sum(abs(x).^2);
E_y = sum(abs(y).^2);
fprintf('Energy of original signal: %f\n', E_x);
fprintf('Energy of filtered signal: %f\n', E_y);

