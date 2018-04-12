function[rx]=cdmadecoder(code,instream)
[r,c]=size(code);
messagelength=length(instream)/c;
for i=1:r
    x=kron(ones(1,messagelength),code(i,:));
    x1=x.*instream;
    x2=reshape(x1,c,numel(x1)/c);
    x3=sum(x2);
    rx1(i,:)=x3;
end
rx=rx1>0;
end  