function sample_seq = GenerateSamples(bit_seq,fs)
%
% Inputs:
%   bit_seq:    Input bit sequence
%   fs:         Number of samples per bit
% Outputs:
%   sample_seq: The resultant sequence of samples
%
% This function takes a sequence of bits and generates a sequence of
% samples as per the input number of samples per bit

sample_seq = zeros(1,size(bit_seq,2)*fs);

%%% WRITE YOUR CODE FOR PART 2 HERE
for i =1:1:numel(bit_seq)
    for j=1:1:fs
      sample_seq(1,((i*fs)-fs+j)) =   bit_seq(1,i);
    end
end
%%%