function [md,b,std_per_mode] = MahalanobisDistance(pcamdl,v)

% Function written by Eleni Christoforidou in MATLAB R2022b.

% This function takes as input a single class from the pca model mdl and a 
% [1xN] feature vector v, containing N feature measurements for a sample. 
% It outputs the Mahalanobis distance from the feature vector to the pca 
% model. It also outputs b, the coordinates within the pca model space for 
% the feature vector, and std_per_mode, which contains the standard 
% deviation distances from the mean for each mode of variation in the pca 
% model. 

% compute b, our PCA coordinates for v
b = pcamdl.eigvects * (v - pcamdl.mu)';

% compute std_per_mode, the standard deviation distance from the mean for v for each mode of variation
std_per_mode = b ./ sqrt(pcamdl.eigvals);

% compute md, the Mahalanobis distance
md = sqrt(sum(std_per_mode .^ 2));
end