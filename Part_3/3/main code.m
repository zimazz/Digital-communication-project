N=128; K=64; Ec=1; N0=2;
 %Blocklength, message-length, BPSK energy, and AWGN noise 
initPC(N,K,Ec,N0); %global structure of parameters is formed and made implicitly available for encoding/decoding

%Encoding
u=(rand(K,1)>0.5); % K-bit random message
x=pencode(u); % The efficient polar encoding
x_systematic = systematic_pencode(u);

%Decoding
u= (rand(K,1)>0.5); % Message
x= pencode(u); % Polar encoding
y= (2*x-1)*sqrt(Ec) + sqrt(N0/2)*randn(N,1); % AWGN
u_decoded= pdecode(y); % The Successive Cancellation Decoding
logical(sum(u==u_decoded)) % Check if properly decoded


%Performance plots
EbN0range=0:0.4:2; designSNRdB=0;
plotPC(N,K,EbN0range,designSNRdB,0); %last argument avoids being verbose


