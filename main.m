clc;
clear variables;
close all;

%% Setting a sampling frequency and generating a noise signal
Fs = 1000;
t = 0:1/Fs:2;

noiseAmplitude=randi(5); %Amplitudes random to 5) 
noise=noiseAmplitude* rand(1, length(t)); %Random 5 mul with same length random number

%% Generating sine waves with noise
y1 = 5*sin(2*pi*60*t) + noise;
y2 = 2.5*sin(2*pi*100*t) + noise; 
y3 = 1.2*sin(2*pi*150*t)+ noise;
y4 = 7*sin(2*pi*250*t) + noise;

%% Plotting all the signals seperately
subplot(2,2,1);
plot(t, y1, 'r');
xlabel('Time');
ylabel('Amplitude');
title('Signal 1');

subplot(2,2,2);
plot(t, y2, 'y');
xlabel('Time');
ylabel('Amplitude');
title('Signal 2');

subplot(2,2,3);
plot(t, y1, 'g');
xlabel('Time');
ylabel('Amplitude');
title('Signal 3');

subplot(2,2,4);
plot(t, y1, 'c');
xlabel('Time');
ylabel('Amplitude');
title('Signal 4');

%% Summing up all signals and playing sound using sound(y, Fs) function
y = y1 + y2 + y3 + y4;
sound(y, Fs);

figure(1)
plot( t, y1, 'r');    % Red
hold on;

plot(t, y2, 'y');     % Yellow
hold on;

plot(t, y3, 'g');    % Green
hold on;

plot(t, y4, 'c');    % Cyan
hold off; 

xlabel('Time');
ylabel('Amplitude');
title('Overall Signal');

%% Finding FFT of signal
L = length(y);
n = 2^nextpow2(L);

Y = fft(y,n);

%% Plot the signal in Frequency Domain 
f = Fs*(0:(n/2))/n;
P = abs(Y/n);
Y_val = P(1:n/2+1);
plot(f,Y_val) 
xlabel('Frequency');
ylabel('Amplitude');
title('Frequency response of actual signal');

%% Applying LPF to actual signal
LPFSignal = filter(lpf, y);
plot(t, LPFSignal);
xlabel('Time');
ylabel('Amplitude');
title('LPF Signal');

sound(LPFSignal, Fs)

%% Apply FFT to LPF signal and plot to see the retained frequencies
LPFSignalFFT = fft(LPFSignal, n);

f = Fs*(0:(n/2))/n;
LPFValue = abs(LPFSignalFFT/n);
AmpOfLPFSignal = LPFValue(1:n/2+1);
plot(f,AmpOfLPFSignal);
xlabel('Frequency');
ylabel('Amplitude');
title('Low Pass Filtered Signal');


%% Applying BPF to actual signal
BPFSignal = filter(bpf, y);
plot(t, BPFSignal);
xlabel('Time');
ylabel('Amplitude');
title('BPF Signal');

sound(BPFSignal, Fs)

%% Apply FFT to BPF signal and plot to see the retained frequencies
BPFSignalFFT = fft(BPFSignal, n);

f = Fs*(0:(n/2))/n;
BPFValue = abs(BPFSignalFFT/n);
AmpOfBPFSignal = BPFValue(1:n/2+1);
plot(f,AmpOfBPFSignal);
xlabel('Frequency');
ylabel('Amplitude');
title('Band Pass Filtered Signal');


%% Comparing before and after filtering
subplot(3,2,1);
plot(t, y);
xlabel('Time');
ylabel('Amplitude');
title('Actual Signal in Time Domain');

subplot(3,2,2);
plot(f, Y_val);
xlabel('Frequency');
ylabel('Amplitude');
title('Actual Signal in Frequency Domain');

subplot(3,2,3);
plot(t, LPFSignal);
xlabel('Time');
ylabel('Amplitude');
title('Low Pass Filtered Signal in Time Domain');

subplot(3,2,4);
plot(f,AmpOfLPFSignal);
xlabel('Frequency');
ylabel('Amplitude');
title('Low Pass Filtered Signal in Frequency Domain');

subplot(3,2,5);
plot(t, BPFSignal);
xlabel('Time');
ylabel('Amplitude');
title('Band Pass Filtered Signal in Time Domain');

subplot(3,2,6);
plot(f,AmpOfBPFSignal);
xlabel('Frequency');
ylabel('Amplitude');
title('Band Pass Filtered Signal in Frequency Domain');

