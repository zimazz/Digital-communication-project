function square_pulse_1 = GenerateSquarePulses(t_axis,T_sq,fs,x_bits)
%
% Inputs:
%   t_axis:     Time axis
%   T_sq_dur:   Duration of the square pulse in seconds
%   fs:         Sampling frequency
%   x_bits:     Sequence of input bits
% Outputs:
%   square_pulse_1:  The sequence of samples corresponding to the pulse shaping
%               of the input bits using a square pulse shape

Ts = 1/fs;
N = length(t_axis);

%%% Generate one square pulse
N_sq = round(T_sq/Ts);

one_square = ones(1, N_sq);


%%% Generate one square pulse for each bit in the variable x_bit

A = 1;
one_square = A * one_square;
temp = A * (repelem(x_bits, 1, length(one_square)));
concated = zeros(1,length((length(temp) : N)) -1);
square_pulse_1 = horzcat(temp, concated);








