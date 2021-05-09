function BER = ComputeBER(bit_seq,rec_bit_seq,N_bits)
%
% Inputs:
%   bit_seq:     The input bit sequence
%   rec_bit_seq: The output bit sequence
% Outputs:
%   BER:         Computed BER
%
% This function takes the input and output bit sequences and computes the
% BER
%%% WRITE YOUR CODE HERE
Number_of_errors = 0;
for i=1:N_bits
if(bit_seq(i) ~= rec_bit_seq(i))
        Number_of_errors= Number_of_errors + 1;
end
end
BER = (Number_of_errors/N_bits);

%%%
