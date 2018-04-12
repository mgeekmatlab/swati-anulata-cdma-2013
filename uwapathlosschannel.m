function[out,gf,a,ax]=uwapathlosschannel(in)
%%[out,gf,a,ax]=uwapathlosschannel(in)
%%out is data stream after path loss
%%ax is under water path loss 
%gf is the absorption coefficient
%f is freqeuncy it is assumed 1000hz 
%x is disatnce it is assumed 100km
%k is constant between 0.001 to 1
% f=input('');
k=-100;
f=1000;
x=100;
gf=(0.11*f^2/(1+f^2))+(44*f^2/(4100+f^2))+2.75*10^(-4)+0.003;%g(f)
a=exp(gf/10);
ax=x^k*a^x;%under water path loss 
out=in*ax;
end