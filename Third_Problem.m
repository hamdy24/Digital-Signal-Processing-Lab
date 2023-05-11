% Define filter coefficients
pkg load signal;
b = [1/8, 1/8, 1/8, 1/8, 1/8, 1/8, 1/8, 1/8];
a = 1;

% Plot frequency response
freq = linspace(0, pi, 1000);
figure;
freqz(b, a);
xlabel('Normalized Frequency');
ylabel('Magnitude');
title('Frequency Response of Filter a');

% Plot impulse response
figure;
impz(b, a);
xlabel('Sample');
ylabel('Amplitude');
title('Impulse Response of Filter a');

%problem 2

% Define filter coefficients
b2 = [1/8, 0, 0, 0, 0, 0, 0, 0, -1/8];
a2 = [1, -1, 0, 0, 0, 0, 0, 0, 0];

% Plot frequency response
freq = linspace(0, pi, 1000);
figure;
freqz(b2, a2);
xlabel('Normalized Frequency');
ylabel('Magnitude');
title('Frequency Response of Filter b');

% Plot impulse response
figure;
impz(b2, a2);
xlabel('Sample');
ylabel('Amplitude');
title('Impulse Response of Filter b');


