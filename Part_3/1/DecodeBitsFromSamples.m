function rec_bit_seq = DecodeBitsFromSamples(rec_sample_seq,fs)
%
% Inputs:
%   rec_sample_seq: The input sample sequence to the channel
%   case_type:      The sampling frequency used to generate the sample sequence
%   fs:             The bit flipping probability
% Outputs:
%   rec_sample_seq: The sequence of sample sequence after passing through the channel
%
% This function takes the sample sequence after passing through the
% channel, and decodes from it the sequence of bits based on the considered
% case and the sampling frequence
rec_bit_seq = zeros(1,cast(numel(rec_sample_seq)/fs, 'int32')) ;
for i=1:1:(length(rec_sample_seq)/fs)
    OnesNum =0;
    for j=1:1:fs
        if (rec_sample_seq(1,(((i*fs)-fs)+j)) == 1)
               OnesNum = OnesNum+1;
        end
    end

if (OnesNum>(fs/2))
      rec_bit_seq(1,i)=1;
end

end
