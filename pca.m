clc
clear
yy=0.9982
load('matlab.mat')
NUM=A';
CK=NUM(:,2:end);   
T_test=NUM(:,1);
[n,m]= size(CK);
% CK=CK';  
% CK=CK';
for i=1:n  

    for j=2:m   
        if  CK(i,j)==CK(i,j-1);   
            CK(i,j)=CK(i,j)+i*10.^(-18);   
        end
    end
end
CK=datastandard(CK); 
esum1=0;
   [PCm,scorem,egenvaluem,t2m]=princomp(CK) ;  
   esum=0;enum=0;      
   pareto(t2m)
   etotal=sum(egenvaluem(1:m));     
  g=zeros(1,m);                     
  for j=1:m
   g(j)=egenvaluem(j)/etotal;      
  end
  PM=PCm*diag(g);                 
for i=1:m
  esum1=esum1+egenvaluem(i);
  enum1=i;                                 
  if (esum1/etotal>yy)
      break;
  end 
end
enum1;                  
PCm1=PCm(:,1:enum1);                          
T=CK*PCm1;    
shuju=[ T T_test];
xlswrite('train_fea.xlsx',shuju);
figure
k=0;
for i=1:enum1
    k=k+1;
   bar(0,0);
    hold on;
    bar(k,100*sum(egenvaluem(1:i))/etotal);
    xlabel('principal component')
ylabel('Contribution rate(%)')
title('Principal component contribution rate')
    hold on;
end

