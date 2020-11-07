function [sx]=datastandard(x)             
%对X按列进行标准化
[m,n]=size(x);
sx=zeros(m,n);
for j=1:n;
    if std(x(:,j))==0;
        sx(:,j)=0;
    else
       sx(:,j)=(x(:,j)-mean(x(:,j)))./std(x(:,j));
    end;
end;
