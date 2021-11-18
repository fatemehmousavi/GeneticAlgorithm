clear all;
close all;
clc
load featureB.mat;
load F_MI_B;
load featurenn.mat;
load F_MI_nn.mat;
indf = [1 2 4 7 8 10 12 13 14 15 16 19];
% indfnn=[1 2 3 4 6 8 9 10 11 12 13 15 16 17 20];
inf = F_MI_B(indf);
XB = featureB(:,inf);
YB = featureB(:,43);
ind_nn = F_MI(1:10);
Xnn = feature(:,ind_nn);
Ynn = feature(:,43);
k =10;
cv = cvpartition(YB,'KFold',k) ;
for i=1:k
index=cv.test(i);
index_train = find(index==0);
index_test = find(index==1);
X_trainB = XB(index_train,:);
Y_trainB = YB(index_train,1);
Xtrainnn = Xnn(index_train,:);
ytrainnn = Ynn(index_train,1);
[X_train_nn,Ytrainnn]=cleardata(Xtrainnn,ytrainnn);
Y_train_nn = preparefornn(Ytrainnn);
[neti,trri] = nu(X_train_nn',Y_train_nn);
X_testB = XB(index_test,:);
Y_testB = YB(index_test,1);
 Mdl = fitcnb(X_trainB,Y_trainB,'DistributionNames',{'normal','kernel','normal','normal','normal','normal','normal','normal','normal','normal','normal','normal'});
isLabels1 = predict(Mdl,X_testB);
indextestnn = find(isLabels1==6);
index_test_nn = index_test(indextestnn);
X_test_nn = Xnn(index_test_nn,:);
Y_test_nn = Ynn(index_test_nn,:);
Youtnn = neti(X_test_nn');
Y_out_nn = nnouttrans(Youtnn);
figure;
confusionchart(Y_testB,isLabels1,'Normalization','row-normalized','RowSummary','row-normalized')
figure;
confusionchart(Y_test_nn,Y_out_nn,'Normalization','row-normalized','RowSummary','row-normalized')

end


