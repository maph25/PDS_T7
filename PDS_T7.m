%Low pass filter
%wc=pi/4

%Define h(n)
n=-30:30;
wc=pi/4;
h1=(wc/pi)*sinc(wc*n/pi);
figure;
plot(n,h1);
xlabel('Discrete time(n)');
ylabel('Magnitude');
title('Low Pass Filter');

%Truncate and transfer
n1=0:10;
h2=zeros(1,11);
h2=h1(26:36);
figure;
plot(n1,h2);
xlabel('Discrete time(n)')
ylabel('Magnitude')
title('Low Pass Filter Cut')

%FFT for h(n)
f=linspace(0,(2*pi),512);
fft_y=fft(h2,length(f));
mfft_y=abs(fft_y);
figure;
plot(f,mfft_y); 
xlabel('Frequency(F)')
ylabel('Magnitude')
title('Fourier Transform')

%17 elements

%Define h(n)
n=-30:30;
wc=pi/4;
h1=(wc/pi)*sinc(wc*n/pi);
figure;
plot(n,h1);
xlabel('Discrete time(n)');
ylabel('Magnitude');
title('Low Pass Filter');

%Truncate and transfer
n1=0:16;
h2=zeros(1,17);
h2=h1(23:39);
figure;
plot(n1,h2);
xlabel('Discrete time(n)')
ylabel('Magnitude')
title('Low Pass Filter Cut')

%FFT for h(n)
f=linspace(0,(2*pi),512);
fft_y=fft(h2,length(f));
mfft_y=abs(fft_y);
figure;
plot(f,mfft_y); 
xlabel('Frequency(F)')
ylabel('Magnitude')
title('Fourier Transform')

%Part II
%
%Calculate wc
fs=44100;
fc=3000;
wc=2*pi*(fc/fs);

%Define h(n)
n=-30:30;
h1=(wc/pi)*sinc(wc*n/pi);
figure;
plot(n,h1);
xlabel('Discrete time(n)');
ylabel('Magnitude');
title('Low Pass Filter');

%Truncate and transfer
n1=0:16;
h2=zeros(1,17);
h2=h1(23:39);
figure;
plot(n1,h2);
xlabel('Discrete time(n)')
ylabel('Magnitude')
title('Low Pass Filter Cut')

%FFT for h(n)
f=linspace(0,(2*pi),512);
fft_y=fft(h2,length(f));
mfft_y=abs(fft_y);
figure;
plot(f,mfft_y); 
xlabel('Frequency(F)')
ylabel('Magnitude')
title('Fourier Transform')

%Audio signal
[x, fs] = audioread('spring_HiFi.wav');
x_sound = audioplayer (x,fs);
%play(x_sound);
%Calculate wc
fm=44100;
fc=3000;
wc=2*pi*(fc/fm);
%Define h(n)
n=-30:30;
h1=(wc/pi)*sinc(wc*n/pi);

figure;
plot(h1);
xlabel('Discrete time(n)')
ylabel('Magnitude')
title('H(n)')
%Frequency spectrum
spec=fft(x);
spec=spec(1:end/2);
freq=linspace(0,fs/2,length(spec));
magnitud=abs(spec);
t=0:1/fs:(length(x)-1)/fs;
figure;
plot(freq,magnitud);
xlabel('Hertz')
ylabel('Magnitude')
title('Frequency spectrum')

%Filter audio
conv = h1.* x;
spec_conv=fft(conv);
freq_conv=linspace(0,fs/2,length(spec_conv));
magnitud_conv=abs(spec_conv);
t=0:1/fs:(length(x)-1)/fs;
figure;
plot(freq_conv,magnitud_conv);
xlabel('Hertz')
ylabel('Magnitude')
title('Frequency spectrum')

%High pass filter
[x, fs] = audioread('spring_HiFi.wav');
x_sound = audioplayer (x,fs);
%Calculate wc
fs=44100;
fc=3000;
wc=2*pi*(fc/fs);
%Define h(n)
n=-30:30;
h1=-(wc/pi)*sinc(wc*n/pi);
figure;
plot(n,h1);
xlabel('Discrete time(n)');
ylabel('Magnitude');
title('High Pass Filter');
%Window
M=16;
wvtool(hann(M))
h2=h1*wvtool;
figure;
plot(n,h2);
title('Filter windowed');
%Apply filter
tot=h2.*x;
figure;
plot(tot);
title('Filtered audio');