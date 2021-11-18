function [X,Y] = cleardata(x,y)
counter = numel(find(y==3));
for t =1 :counter
array = find(y==3);
x(array(1),:)=[];
y(array(1),:)=[];
counter =counter-1;
end
X=x;
Y=y;
end

