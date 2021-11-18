function z=fun(x,X,Y)
global NFE;
    if isempty(NFE)
        NFE=0;
    end 
    NFE=NFE+1;
ind =x(1,1:20);
alpha = regu(x(1,21:24));
tt = find(ind(1,:)==1);
 Xtrain = X(:,tt);
 Ytrain = Y;
g_y_train = preparefornn(Ytrain);
[ne,tr]=nnga(Xtrain',g_y_train,alpha);
gYoutnn = ne(Xtrain');
gY_out_nn = nnouttrans(gYoutnn);
fd = find (Ytrain==4);
fddd = find(gY_out_nn==4);
kj =234;
for i =1:size(fd,1)
for o = 1:size(fddd,1)
if (fd(i,1)==fddd(o,1))
kj = kj-1;
end
end
end
fd = find (Ytrain==5);
fddd = find(gY_out_nn==5);
kjj =321;
for i =1:size(fd,1)
for o = 1:size(fddd,1)
if (fd(i,1)==fddd(o,1))
kjj = kjj-1;
end
end
end
z=kj+kjj;
end