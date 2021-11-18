clear all;
close all;
clc;
% load mazandaran.mat;
load matlab.mat;
% C = mazandaran;
% A = table2array(C(:,:));
% maxi =size(A);
% features =zeros(maxi(1),42);
% features(:,1:40)=A(:,1:40);
% labels=zeros(maxi(1),1);
% for k=1 :maxi(1)
% labels(k,1) = max(A(k,55:61));
% features(k,41) = round(max(A(k,41:47)));
% features(k,42) = round(max(A(k,48:54)));
% 
% end
% for h =1 :length(labels)
% if ( labels(h,1)==4|| labels(h,1)==5|| labels(h,1)==6)
% labels(h,1)=6;
% end
% end
C =Traindf;
features = C(:,2:40);
labels = C(:,41);
for ij=1:size(labels)
if (labels(ij,1)==-1)
    labels(ij,1)=2;
end
end
