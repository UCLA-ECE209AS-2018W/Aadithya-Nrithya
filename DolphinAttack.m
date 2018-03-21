%%%%%%%%%%%%%%%%%%%%%%%Audio Signal Input and Plot%%%%%%%%%%%%%%%%%%%%%%%%%
[y,Fs] = audioread('user1.wav');
disp(Fs);
nf=1024; %number of point in DTFT
t = linspace(0,length(y)/Fs,length(y)) ;
subplot(321);
plot(t,y);
xlabel('Time');
ylabel('Amplitude of Signal');
title('Original Signal-Amplitude');

%%%%%%%%%%%%%%%%%%%%%%%%%%% Original Signal FFT %%%%%%%%%%%%%%%%%%%%%%%%%%%
L = length(y);
NFFT = 2^nextpow2(L); % Next power of 2 from length of myRecording
Y = fft(y,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
%Y = fft(y,nf);
subplot(322);
plot(f,2*abs(Y(1:NFFT/2+1)));
axis([0 Fs/2 0 0.01])
xlabel('Frequency');
ylabel('FFT of Signal');
title('Original Signal-FFT');

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Filter %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                % Sampling Frequency (Hz)
% Fn = Fs/2;                                                  % Nyquist Frequency (Hz)
% Wp = 1/Fn;                                                % Passband Frequency (Normalised)
% Ws = 3500/Fn;                                                % Stopband Frequency (Normalised)
% Rp =  1;                                                    % Passband Ripple (dB)
% Rs = 25;                                                    % Stopband Ripple (dB)
% [n,Wn]  = buttord(Wp,Ws,Rp,Rs);                             % Butterworth Filter Order
% [b,a]   = butter(n,Wn);                                     % Butterworth Filter Coefficients
% [sos,g] = tf2sos(b,a);                                      % Convert To Second-Order-Section For Stability
% %figure(1)
% %freqz(sos, 2048, Fs)                                        % Examine Filter Characteristics (Bode Plot)
% fil_sig = filtfilt(sos, g, y);
% 
% FIL_SIG = fft(fil_sig,nf);
% f = Fs/2*linspace(0,1,nf/2+1);
% subplot(312);
% plot(f,abs(FIL_SIG(1:nf/2+1)));

%soundsc(fil_sig,Fs)

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Inbuilt Amplitude Modulation %%%%%%%%%%%%%%%%%%
Fc=40000;
[original_modulation,t1] = modulate(y,Fc,Fs,'am');
AYM= fft(original_modulation,nf);
subplot(323);
plot(t,original_modulation);
xlabel('Time');
ylabel('Amplitude Modulated Signal');
title('Matlab Inbuilt Modulated Signal Time series');

subplot(324);
% plot(f,abs(AYM(1:nf/2+1)));
% xlabel('Frequency');
% ylabel('FFT of Signal');
% title('Matlab Inbuilt Modulated Signal FFT');
 audiowrite('User1originalmod5K.wav',original_modulation,Fs);

AYM = fft(original_modulation,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
%Y = fft(y,nf);
subplot(324);
plot(f,2*abs(AYM(1:NFFT/2+1)));
axis([0 Fs/2 0 0.01])
xlabel('Frequency');
ylabel('FFT of Signal');
title('Matlab Modulated Signal-FFT');
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Function Amplitude Modulation %%%%%%%%%%%%%%%%

harmonic_modulation = y.*cos(2*pi*Fc*t1)+cos(2*pi*Fc*t1);
subplot(325);
plot(t,harmonic_modulation);
xlabel('Time');
title('Harmonic Amplitude Modulated Signal');
ylabel('Time');

AYM1 = fft(harmonic_modulation,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
subplot(326);
plot(f,2*abs(AYM1(1:NFFT/2+1)));
axis([0 Fs/2 0 0.01])
xlabel('Frequency');
ylabel('FFT of Signal');
title('Harmonic Modulated Signal FFT');
audiowrite('User1harmonic5K.wav',harmonic_modulation,Fs);
%%%%%%%%%%%%%%%%%%%%%%%%%%High Pass Filter for audio%%%%%%%%%%%%%%%%%%%%%%%
% highPassfilt = designfilt('highpassfir', 'StopbandFrequency', 26500, 'PassbandFrequency', 27000, 'StopbandAttenuation', 60, 'PassbandRipple', 1, 'SampleRate', 96000);
% dataIn = harmonic_modulation;
% dataOut = filter(highPassfilt,dataIn);
% disp(dataOut);
% fil_sig=fft(dataOut,nf);
% plot(f,abs(fil_sig(1:nf/2+1)));





