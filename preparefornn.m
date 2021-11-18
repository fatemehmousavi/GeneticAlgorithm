function [YtrainN] = preparefornn(YtrainNN)
%PREPAREFORNN Summary of this function goes here
%   Detailed explanation goes here
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
end

