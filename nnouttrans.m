function [yOutN] = nnouttrans(yOutNN)
%NNOUTTRANS Summary of this function goes here
%   Detailed explanation goes here
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
end

