function [y,trr] = nu(x,t)
%NU Summary of this function goes here
%   Detailed explanation goes here
net = feedforwardnet(8);
net.trainParam.epochs = 1000;
net.trainFcn = 'trainlm';
net.trainParam.lr = 0.1;
% net.trainParam.max_fail=6;
% net.trainParam.min_grad	=1e-5;
net.trainParam.goal = 0;
% net.performParam.regularization = 0.07;
% net.layers{2}.size = 3;
[y,trr] = train(net,x,t);
end

