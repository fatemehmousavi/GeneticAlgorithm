function z=Bayes(x,X,Y)
global NFE;
    if isempty(NFE)
        NFE=0;
    end 
    NFE=NFE+1;
ind =x;
tt = find(ind(1,:)==1);
 Xtrain = X(:,tt);
 Ytrain = Y;
 CVMdl1 = fitcnb(Xtrain,Ytrain);
 isLabels1 =resubPredict(CVMdl1);
fd = find (Y==3);
fddd = find(isLabels1==3);
kj =34;
for i =1:size(fd,1)
for o = 1:size(fddd,1)
if (fd(i,1)==fddd(o,1))
kj = kj-1;
end
end
end
z=kj;
end