clc
clear all
close all
%% basic constants
% n1=input ('enter the no of users ')
% bits=input ('enter the no of bits  ')
n1=128;
bits=200;
ber=[];
errcount=[];
snr=[];
oversampellingratio=2;% increasing this value will improve ber
n=2^nextpow2(n1);
codelength=n;
code=hadamard(n);


for i=1:2:16

databi=randint(n,bits);% random data one row for one user
data=databi*2-1;%bpsk encoded data
%% transmitter
tx1=cdmaencoder(code,data);%cdma encoder
tx2 =rectpulse(tx1,oversampellingratio);% Oversampling to improve result


%% channel 

%1 for ideal
%2 for awgn channel then uwa path loss channel
%3 fpr uwapathloss channel then awgn channel
channel =3;
switch channel
    case 1%ideal channel
        y=tx2;
        snr=cat(2,snr,i);
    otherwise%awgn channel followed by path loss channel
        snr1=i;
        snr=cat(2,snr,snr1);
        y1=awgn(tx2,snr1,'measured');
        y=uwapathlosschannel(y1);%uwapathloss channel
end


%% reciever
rx1=intdump(y,oversampellingratio);% Integrate and dump (downsampling)
[rx]=cdmadecoder(code,rx1);%cdma decoder
%% error detection in databi and rx
a=reshape(databi,numel(databi),1);
b=reshape(rx,numel(rx),1);
[err1,ber1]=biterr(a,b);
errcount=cat(2,errcount,err1);
ber=cat(2,ber,ber1);

end
errcount
ber
% plot(ber')
% semilogy(snr,ber,'r-x')
% title('bit error rate')
% xlabel('snr')
% ylabel('ber')
% grid on
% saveas(gcf, 'resultjpg', 'jpg')
% saveas(gcf, 'resultpdf', 'pdf')

semilogy(snr,smooth(ber),'r-x')
title('bit error rate')
xlabel('snr')
ylabel('ber')
grid on
saveas(gcf, 'resultsmoothjpg', 'jpg')
saveas(gcf, 'resultsmoothpdf', 'pdf')

