fs = 1e7;                       % Sampling rate (samples per sec)
Ts = 1/fs;                      % Sampling time

N = 10240 - 1;                 % Total number of samples
t_axis = (0:N-1)*Ts;            % Time axis 
f_axis = -fs/2:fs/N:fs/2-1/N;   % Frequency axis 

%% Part 1-a: Generate a pulse

% First square pulse         
T_sq = 200*Ts;                  % The duration of the square pulse (an integer number of sampling times)
x_bits = 1;
square_pulse_1 = GenerateSquarePulses(t_axis,T_sq,fs,x_bits);   

%% Show time and frequency plots of the generated pulse

figure
subplot(2,1,1)
plot(t_axis,square_pulse_1,'linewidth',2)
grid on
xlim([0 T_sq*1.2])
xlabel('Time','linewidth',2)
ylabel('Square pulse','linewidth',2)

square_pulse_1_freq = GetFreqResponse(square_pulse_1,fs);

subplot(2,1,2)
plot(f_axis,abs(square_pulse_1_freq),'linewidth',2)
grid on
xlim([-1/T_sq 1/T_sq]*5)
xlabel('Frequency','linewidth',2)
ylabel('Frequency ressponse magnitude','linewidth',2)
subplot(2,1,1)
title('A square pulse in time and frequency domains','linewidth',10)


%Bandpass Filter
rect=@(x,BW) ones(1,numel(x)).*(abs(x)<BW/2); % a is the width of the pulse
x = -fs/2:fs/N:fs/2-1/N;
channel = rect(x,200000);   
plot(x,channel);
xlabel('frequency','linewidth',2)
ylabel('Rectangular pulse','linewidth',2)
title('A BandPass Filter','linewidth',10)

%Output Of the Channel In Frequency Domain
output_freq = square_pulse_1_freq .* channel;

figure
%subplot(2,1,1)
plot(f_axis,abs(output_freq),'linewidth',2)
title('Output of the channel in the frequency domain','linewidth',10)
grid on
xlim([-1/T_sq 1/T_sq]*5)
xlabel('Frequency','linewidth',2)
ylabel('Frequency ressponse magnitude','linewidth',2)



%Output Of the Channel In Time Domain
output_time = ifft(ifftshift(output_freq));
%subplot(2,1,2)
plot(t_axis,output_time,'linewidth',2);
grid on;
xlim([0 T_sq*1.2]);
xlabel('Time','linewidth',2);
ylabel('Square pulse','linewidth',2);
title('Output of the channel in the TIme domain','linewidth',10)



%Second Square Pulse
x_bits_new = [0 1];
square_pulse_2 = GenerateSquarePulses(t_axis,T_sq,fs,x_bits_new);

%% Show time and frequency plots of the generated pulse

figure
subplot(2,1,1)
plot(t_axis,square_pulse_2,'linewidth',2)
grid on
xlim([0 T_sq*1.2])
xlabel('Time','linewidth',2)
ylabel('Square pulse','linewidth',2)


square_pulse_2_freq = GetFreqResponse(square_pulse_2,fs);

subplot(2,1,2)
plot(f_axis,abs(square_pulse_2_freq),'linewidth',2)
title('Student Figure','linewidth',10)
grid on
xlim([-1/T_sq 1/T_sq]*5)
xlabel('Frequency','linewidth',2)
ylabel('Frequency ressponse magnitude','linewidth',2)
subplot(2,1,1)
title('A square pulse in time and frequency domains','linewidth',10)

%Plotting the two signals together
figure
plot(t_axis,square_pulse_1,'linewidth',2);
grid on;
xlim([0 T_sq*1.2]);
xlabel('Time','linewidth',2);
ylabel('Square pulse','linewidth',2);

hold on;

plot(t_axis,square_pulse_2,'linewidth',2);
grid on;
xlabel('Time','linewidth',2)
ylabel('Square pulse','linewidth',2)
title('Both square pulses in time domains','linewidth',10)

figure

plot(f_axis,abs(square_pulse_1_freq),'linewidth',2)
grid on;
xlim([-1/T_sq 1/T_sq]*5)


hold on;

plot(f_axis,abs(square_pulse_2_freq),'linewidth',2)
title('Student Figure','linewidth',10)
grid on
xlabel('Frequency','linewidth',2)
ylabel('Frequency ressponse magnitude','linewidth',2)
title('Both square pulses in frequency domains','linewidth',10)



%output of the channel of second square pulse in frequency domain
output_2_freq = square_pulse_2_freq .* channel;

plot(f_axis,abs(output_2_freq),'linewidth',2)
grid on
xlim([-1/T_sq 1/T_sq]*5)
xlabel('Frequency','linewidth',2)
ylabel('Frequency ressponse magnitude','linewidth',2)
title('output of the channel of second square pulse in frequency domain','linewidth',10)

%output of the channel of second square pulse in time domain
output_2_time = ifft(ifftshift(output_2_freq));

figure;
%subplot(2,1,1);

plot(t_axis,output_2_time,'linewidth',2);
grid on;
xlim([0 T_sq*1.2]);
xlabel('Time','linewidth',2);
ylabel('Square pulse','linewidth',2);
title('output of the channel of second square pulse in frequency domain','linewidth',10)



%Plotting Both Output of the channel of the two consecutive square signals
figure;
%subplot(2,1,1);

plot(t_axis,output_time,'linewidth',2);
grid on;
xlim([0 T_sq*1.2]);
xlabel('Time','linewidth',2);
ylabel('Square pulse','linewidth',2);

hold on;

plot(t_axis,output_2_time,'linewidth',2);
grid on;


%Using sinc function to get rid of ISI
x = linspace(-10, 10, 10240 - 1);
y = sinc(x);
plot(x, y)
grid;

Fs = 1/mean(diff(x));                               
Fn = Fs/2;                                          
Y = fft(y)/numel(y);
Ys = fftshift(Y);
Fv = linspace(-1, 1, fix(numel(Y)))*Fn;
figure
plot(Fv, abs(Ys)*2)
grid
xlim([-5  5])

o_p = Y .* channel;
plot(Fv, abs(o_p)*2)

o_p_t = ifft(ifftshift(o_p));
plot(x, o_p_t)


