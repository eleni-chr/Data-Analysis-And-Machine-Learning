function [class,score] = my_predictpca(mdl,data)

% Function written by Eleni Christoforidou in MATLAB R2022b.

% This function takes as input a pca model mdl and an [MxN] data matrix D, 
% containing N feature measurements for M samples. It has two outputs, the 
% classification for each sample in the [Mx1] vector class that is 
% estimated using the pca model, and the Mahalanobis distance score for 
% each sample in the [Mx1] vector score as the second output.

% Initialize output 'class' and 'score' to Mx1 zero vectors
M = size(data,1);
class = zeros(M,1);
score = zeros(M,1);

% Loop over the M samples, to classify each 'i'th sample
for i = 1:M
    sample = data(i,:);
    min_distance = inf;
    for j = 1:length(mdl.class)
        % Compute the Mahalanobis distance between the sample and the jth class
        distance = MahalanobisDistance(mdl.class(j),sample);
        % If this is the minimum distance so far, update the class and score
        if distance < min_distance
            min_distance = distance;
            class(i) = j;
            score(i) = distance;
        end
    end
end
end

% embed your MahalanobisDistance function you created in the previous assignment here:
function [md,b,std_per_mode] = MahalanobisDistance(pcamdl,v)
% compute b, our PCA coordinates for v
b = pcamdl.eigvects * (v - pcamdl.mu)';
% compute std_per_mode, the standard deviation distance from the mean for v for each mode of variation
std_per_mode = b ./ sqrt(pcamdl.eigvals);

% compute md, the Mahalanobis distance
md = sqrt(sum(std_per_mode .^ 2));
end