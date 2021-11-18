clear all;
close all
clc
load Traindf.mat;
Traindf = table2array(Traindf);
X= Traindf(:,2:40);
Y = Traindf(:,41);
% X= [1 3 0 1 0 0;
%        2 1 0 2 1 0;
%        2 2 2 2 0 2;
%        2 1 1 1 0 1;
%        2 1 1 2 1 2;
%        3 3 1 0 0 2;
%        1 1 2 1 0 0;
%        0 2 2 0 0 0];
%    Y = [1/8;1/8;1/8;1/8;1/8;1/8;1/8;1/8;];
for i =1 : size(Y,1)
% if (Y(i,1)==1)
%     Y(i,1)=0;
% end 
if (Y(i,1)==-1)
    Y(i,1)=2;
end 
end
% sum = sum(Y);
% for i =1 : size(Y,1)
%  Y(i,1)=Y(i,1)/sum;
% end
%T=mutualinfo(X,Y);
[F_MI,W_MI] = MI(X,Y,12);
 Rm = corrcoef([X Y]);