function z=muta(x,X)
global NFE;
    if isempty(NFE)
        NFE=0;
    end 
    NFE=NFE+1;
 Y = x';
for i =1 :size(Y)
if( Y(i,1)==0)
    Y(i,1)=2;
end
end
[F_MI,W_MI] = MI(X,Y,12);

z=-sum(W_MI);
end