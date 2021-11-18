function [y,trr] = nnga(x,t,alpha)
%NU Summary of this function goes here
%   Detailed explanation goes here
net = feedforwardnet(8);
net.trainParam.epochs = 500;
net.trainFcn = 'trainlm';
net.trainParam.lr = 0.1;
% net.trainParam.max_fail=6;
% net.trainParam.min_grad	=1e-5;
net.trainParam.goal = 0;
net.performParam.regularization = alpha;
% net.layers{2}.size = 3;
[y,trr] = train(net,x,t);
end

