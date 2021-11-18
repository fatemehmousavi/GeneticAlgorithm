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
post = zeros(300,10);
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
% convert the class's labels from 3 to 0 and from 6 to 1
for uu =1: length(Y_trainB)
if (Y_trainB(uu,1)==6)
Y_trainB(uu,1) =1; 
end
if (Y_trainB(uu,1)==3)
Y_trainB(uu,1) =0; 
end
end
for uu1 =1: length(Y_testB)
if (Y_testB(uu1,1)==6)
Y_testB(uu1,1) =1; 
end
if (Y_testB(uu1,1)==3)
Y_testB(uu1,1) =0; 
end
end
 Mdl = fitcnb(X_trainB,Y_trainB,'DistributionNames',{'normal','kernel','normal','normal','normal','normal','normal','normal','normal','normal','normal','normal'});
[label,Posterior,Cost] = predict(Mdl,X_testB);
% convert the class's labels from 0 to 3 and from 1 to 6
isLabels1 = label;
for uu2 =1: length(isLabels1)
if (isLabels1(uu2,1)==1)
isLabels1(uu2,1)=6; 
end
if (isLabels1(uu2,1)==0)
isLabels1(uu2,1) =3; 
end
end





indextestnn = find(isLabels1==6);
index_test_nn = index_test(indextestnn);
X_test_nn = Xnn(index_test_nn,:);
Y_test_nn = Ynn(index_test_nn,:);
Youtnn = neti(X_test_nn');
Y_out_nn = nnouttrans(Youtnn);

 figure;
 confusionchart(Y_testB,label,'Normalization','row-normalized','RowSummary','row-normalized')
%  labeltest = label;
% %  for jk=1:length(labeltest)
% % labeltest(jk,1)= 1 -labeltest(jk,1);
% % end
% if (i == 1)
% prec_rec(Posterior(:,2), labeltest(:,1));
% end
% if (i > 1)
%  prec_rec(Posterior(:,2), labeltest(:,1), 'holdFigure', 1);
% legend('baseline','x1/y1','x2/y2','Location','SouthEast');
% 
% end
% legend('baseline','x1/y1','x2/y2','Location','SouthEast');
for Ry=1:length(Y_test_nn)
Y_test_nn(Ry,1) = Y_test_nn(Ry,1) -1;
Y_out_nn(Ry,1) = Y_out_nn(Ry,1) -1;
end
 figure;
confusionchart(Y_test_nn,Y_out_nn,'Normalization','row-normalized','RowSummary','row-normalized')
% figure;
% for uu =1: length(isLabels1)
% if (Y_testB(uu,1)==6)
% Y_testB(uu,1) =0; 
% end
% if (Y_testB(uu,1)==3)
% Y_testB(uu,1) =1; 
% end
% if (isLabels1(uu,1)==6)
% isLabels1(uu,1)=0; 
% end
% if (isLabels1(uu,1)==3)
% isLabels1(uu,1) =1; 
% end
% end
% figure;
% prec_rec(Y_testB, isLabels1, 'holdFigure', 1);
% legend('baseline','x1/y1','x2/y2','Location','SouthEast');

end


