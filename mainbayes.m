clear all;
close all;
clc;
load featurenn.mat;
load featureB.mat;
load F_MI_B.mat;
load F_MI_nn.mat;
index = [1 2 4 7 8 10 12 13 14 15 16 19]
m=12;
inde = F_MI_B(index,1);
X = feature(:,inde);
Y = feature(:,43);
% reference = zeros(2628,m+1);
%  reference(:,1:m) = X(:,1:m);
%  reference(:,m+1)=Y;
K=10;
% percentage = zeros(k,4);

b = randi(K,2628,1);
 for i = 1:K
  indi = find(b==i);
  test = reference(indi,:);
  notInd = find(b~=i);
  train = reference(notInd,:);
  trainNN = feature(notInd,:);
  Xtrain = train(:,1:m);
  XtrainNN = trainNN(:,1:54);
  Ytrain = train(:,m+1);
  YtrainNN = trainNN(:,55);
  Xtest = test(:,1:m);
  Ytest = test(:,m+1);
  
  Mdl1 = fitcnb(Xtrain,Ytrain);
  %%%%%%%%%%%%%%%%%%%
  s1 = size(YtrainNN);
YtrainN = zeros(4,s1(1));
for i =1:s1(1)
if (YtrainNN(i,1)==6)
YtrainN(1,i)=-2;
YtrainN(2,i)=-2;
YtrainN(3,i)=-2;
YtrainN(4,i)=2;

end
if (YtrainNN(i,1)==5)
YtrainN(1,i)=-2;
YtrainN(2,i)=-2;
YtrainN(3,i)=2;
YtrainN(4,i)=-2;

end
if (YtrainNN(i,1)==4)
YtrainN(1,i)=-2;
YtrainN(2,i)=2;
YtrainN(3,i)=-2;
YtrainN(4,i)=-2;

end
if (YtrainNN(i,1)==3)
YtrainN(1,i)=2;
YtrainN(2,i)=-2;
YtrainN(3,i)=-2;
YtrainN(4,i)=-2;

end
end

  %%%%%%%%%%%%%%%%%%%
% % % % % % % % % % % %   

% % % % % % % % % % % % 
  [neti,trri] = nu(XtrainNN',YtrainN);
 isLabels1 = predict(Mdl1,Xtest);
 fd1 = find (isLabels1==3);
fddd1 = find(Ytest==3);
n1 = 0;
for ii1 =1:size(fd1,1)
for o1 = 1:size(fddd1,1)
if (fd1(ii1,1)==fddd1(o1,1))
n1 = n1+1;
rr = size(fddd1);
percent1 = (n1 /rr(1)) * 100;
end
end
end
percentage(i,1)=percent1;
  indTestNN = find(isLabels1~=3);
  testNN=(indi(indTestNN));
  XtestNN = feature(testNN,1:54);
  YtestN = feature(testNN,55);
  
yOutNN = neti(XtestNN');
%%%%%%%%%%%%%%%%%%
s3 = size(yOutNN);
yOutN = zeros(s3(2),1);
for ll=1:s3(2)
    andis = 1;
max = yOutNN(1,ll);
for k =2 :4
if (yOutNN(k,ll) > max)
    max = yOutNN(k,ll);
    andis = k;
end
end
if (andis ==1)
    yOutN(ll,1)=3;
end
if (andis ==2)
    yOutN(ll,1)=4;
end
if (andis ==3)
    yOutN(ll,1)=5;
end
if (andis ==4)
    yOutN(ll,1)=6;
end
end
%%%%%%%%%%%%%%%%
for u =4:6
n = 0;
fd = find (yOutN==u);
fddd = find(YtestN==u);

for ii =1:size(fd,1)
for o = 1:size(fddd,1)
if (fd(ii,1)==fddd(o,1))
n = n+1;
rr = size(fddd);
end
end
end
percent = (n /rr(1)) * 100;

%  figure();
%  ConfusionMat1 = confusionchart(Ytest,isLabels1);
% ConfusionMat1.RowSummary = 'row-normalized';
percentage(i,u-2)=percent;
end 
 end
finalPercent = zeros(1,4);
sam = sum(percentage);
for h =1:4
finalPercent(1,h) = sam(h)/k;
end
% Mdl1 = fitcnb(X,Y);
% isLabels1 = resubPredict(Mdl1);
%  ConfusionMat1 = confusionchart(Y,isLabels1);
% ConfusionMat1.RowSummary = 'row-normalized';
% ConfusionMat1.Title = 'Multiple NN  class mean Confusion Matrix';
% Loss = kfoldLoss(CVMdl)
