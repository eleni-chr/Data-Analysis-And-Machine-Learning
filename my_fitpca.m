function mdl = my_fitpca(D, class)

% Function written by Eleni Christoforidou in MATLAB R2022b.

% This function takes as input the [MxN] data matrix D, containing N 
% feature measurements for M samples, and the known classification for each
% sample in the [Mx1] vector called class. The function outputs the struct 
% mdl, which contains the pca models created for each unique classification
% in class.

% Extract the unique class labels
classlabels = unique(class);
numclasses = length(classlabels);

% Initialize the output struct
mdl = struct;

% Loop over each class label
for i = 1:numclasses
    % Extract the data for the current class
    data = D(class == classlabels(i), :);

    % Perform PCA on the data
    [coeff, ~, eigvals, ~, ~, mu] = pca(data);

    % Store the results in the output struct
    mdl.class(i).eigvects = coeff';
    mdl.class(i).eigvals = eigvals;
    mdl.class(i).mu = mu;
end
end
