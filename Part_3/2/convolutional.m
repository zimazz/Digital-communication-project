input_data=randi([0 1],1,1000);
shift_regesters=[0 0 0 0 0 0 0];
output_data= zeros(1,3*length(input_data));
c=0;
for i=1:length(input_data)
    shift_regesters(7)=shift_regesters(6);
    shift_regesters(6)=shift_regesters(5);
    shift_regesters(5)=shift_regesters(4);
    shift_regesters(4)=shift_regesters(3);
    shift_regesters(3)=shift_regesters(2);
    shift_regesters(2)=shift_regesters(1);
    shift_regesters(1)=input_data(i);

    if(i==1)
        x1=xor(shift_regesters(1),shift_regesters(3));
        x2=xor(x1,shift_regesters(4));
        x3=xor(x2,shift_regesters(6));
        x4=xor(x3,shift_regesters(7));
    output_data(i)= x4;
        y1=xor(shift_regesters(1),shift_regesters(2));
        y2=xor(y1,shift_regesters(3));
        y3=xor(y2,shift_regesters(4));
        y4=xor(y3,shift_regesters(7));
    output_data(i+1)= y4;
        z1=xor(shift_regesters(1),shift_regesters(2));
        z2=xor(z1,shift_regesters(3));
        z3=xor(z2,shift_regesters(5));
        z4=xor(z3,shift_regesters(7));
    output_data(i+2)= z4;
    continue;
    end
        x1=xor(shift_regesters(1),shift_regesters(3));
        x2=xor(x1,shift_regesters(4));
        x3=xor(x2,shift_regesters(6));
        x4=xor(x3,shift_regesters(7));
    output_data((2*i)+c)= x4;
        y1=xor(shift_regesters(1),shift_regesters(2));
        y2=xor(y1,shift_regesters(3));
        y3=xor(y2,shift_regesters(4));
        y4=xor(y3,shift_regesters(7));
    output_data((2*i)+c+1)= y4;
        z1=xor(shift_regesters(1),shift_regesters(2));
        z2=xor(z1,shift_regesters(3));
        z3=xor(z2,shift_regesters(5));
        z4=xor(z3,shift_regesters(7));
    output_data((2*i)+c+2)= z4; 
    c=c+1;
end
p=0:0.1:0.5;
N_bits=length(input_data);
for i=1:length(p)
recieved_data = BSC(output_data,10,p(i));
trellis = poly2trellis(7,[133 171 165]);
tb = 4;
decoded_bits = vitdec(recieved_data,trellis,tb,'trunc','hard')
BER(i) = ComputeBER(input_data,decoded_bits,N_bits);
end
plot(p,BER,'d-b','linewidth',2); hold on;
xlabel('Values of p','fontsize',10);
ylabel('BER','fontsize',10);
