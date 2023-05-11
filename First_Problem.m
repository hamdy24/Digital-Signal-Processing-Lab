pkg load signal;
% Sampling frequency
Fs = 10000;

% Bandpass frequencies
fc1 = 200;
fc2 = 2000;

% Butterworth filter order
n1 = 4;
n2 = 21;

% Design Butterworth filters
[b1, a1] = butter(n1, [fc1/(Fs/2), fc2/(Fs/2)], 'bandpass');
[b2, a2] = butter(n2, [fc1/(Fs/2), fc2/(Fs/2)], 'bandpass');

% Plot frequency responses
freq = linspace(0, Fs/2, 10000);
H1 = freqz(b1, a1, freq, Fs);
H2 = freqz(b2, a2, freq, Fs);

figure();
plot(freq, abs(H1), 'b', 'LineWidth', 2);
hold on;
plot(freq, abs(H2), 'r', 'LineWidth', 2);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Butterworth Bandpass Filter Frequency Response');
legend('n=4', 'n=21');

% Plot impulse responses
imp1 = impz(b1, a1, 100);
imp2 = impz(b2, a2, 100);

figure();
stem(imp1, 'b', 'LineWidth', 2);
hold on;
stem(imp2, 'r', 'LineWidth', 2);
xlabel('Sample');
ylabel('Amplitude');
title('Butterworth Bandpass Filter Impulse Response');
legend('n=4', 'n=21');



