%% Simulation parameters
N_bits = 1000; % Total number of bits
p_vect          = 0:0.1:.5;    % Channel parameter (probability of bit flipping)
fs  =5;    % Number of samples per symbol (bit)
%% Illustrate fs
% fs --> it represent the number of repeatition like L = (1/r) 
% for examble if we repeat 5 times so we will make r = 1/5 and L will equal
% to 5 
%%  Generate a bit sequence
bit_seq = GenerateBits(N_bits);         % Generate vector of of 0 & 1 
sample_seq = GenerateSamples(bit_seq,fs);  % Generate samples of each bit in bit_seq
BER_vec  = zeros(size(p_vect));  % Use this vector to store the resultant BER
rec_sample_seq  = zeros(size(sample_seq)); % generate the vector of recieved sample

%% Loop to calculate the BER of each p
for pIndx = 1:length(p_vect)
    %%%% generates the output sample sequence for each p in p_Vect
    channel_effect = rand(size(rec_sample_seq))<=p_vect(pIndx);
    rec_sample_seq = xor(sample_seq,channel_effect);
    rec_bit_seq = DecodeBitsFromSamples(rec_sample_seq,fs);
    BER_vec(pIndx) = ComputeBER(bit_seq,rec_bit_seq);
end
%% Plot the output BER vs P
plot(p_vect,BER_vec,'o-r','linewidth',2);
xlabel('Values of p','fontsize',10)
ylabel('BER','fontsize',10)
grid on


