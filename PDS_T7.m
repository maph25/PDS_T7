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
fs=44100;
fc=3000;
wc=2*pi*(fc/fs);
%Define h(n)
n=-30:30;
h1=(wc/pi)*sinc(wc*n/pi);
%FIR 
F=[0 0 0 0 1 1 1 1 1 1 1 1 0 0 0 0];
a=1;
y=filter(b,a,x);
