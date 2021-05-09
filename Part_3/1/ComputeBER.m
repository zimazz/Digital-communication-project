function BER = ComputeBER(bit_seq,rec_bit_seq)
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
BitChanged=0;
for i =1:1:numel(bit_seq)
    if bit_seq(1,i) ~= rec_bit_seq(1,i)
        BitChanged = BitChanged+ 1;
    end
end
BER = BitChanged/numel(bit_seq);
%%%
