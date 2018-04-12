function[out,y]=cdmaencoder(code,data)%spreader
% % y=data'*code;
% y=[];
% [r,c]=size(data);
% for i=1:r
% t1=data(i,:)'*code(i,:);
% t2=reshape(t1,1,numel(t1));
% y=cat(1,y,t2);
% % out=reshape(y,1,numel(y))
% out=y;
% end
y=[];
[r,c]=size(data);
for i=1:r
y(i,:)=kron(data(i,:),code(i,:));
end
y;
out=sum(y);
end