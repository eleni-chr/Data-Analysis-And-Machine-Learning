function N=compute_feature_dimensions

%Function written by Eleni Christoforidou in MATLAB R2022b.

%This function computes the number of feature dimensions N needed to
%represent at least 99.9% of the variance in the feature set of the
%humanactivity dataset using the 'pca' function.

load humanactivity.mat feat
D = feat; % [24075 x 60] matrix containing 60 feature measurements from 24075 samples

% Compute eigvals using the pca function
[~, ~, eigvals] = pca(D);

% Define cumulative_percent_variance_permode
cumulative_percent_variance_permode = cumsum(eigvals/sum(eigvals))*100;

% Define N as the number of eigenvectors needed to capture at least 99.9% of the variation in our dataset D
N = find(cumulative_percent_variance_permode >= 99.9, 1);

end