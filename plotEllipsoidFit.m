function plotEllipsoidFit

% Function written by Eleni Christoforidou in MATLAB R2022b.

% This function creates a scatter plot of the first 2 dimensions of the PCA
% linear vector space, and displays a contour representing the boundary, in
% the first two dimensions, of the the PCA ellipsoid with 2 standard 
% deviations width.

load fisheriris meas
D = meas; % [150 x 4] data feature matrix containing 4 features of 150 samples

% compute D_pca and eigvals using the pca function
[~,D_pca,eigvals] = pca(D);

% Define D_pca_x and D_pca_y, the first two dimensions of the data in the D_pca feature space
D_pca_x = D_pca(:,1);
D_pca_y = D_pca(:,2);

% scatter plot the data with asterisks '*'
scatter(D_pca_x, D_pca_y, '*');
hold on

% Define ellipse_x and ellipse_y, x and y coordinates for the PCA ellipsoid in the first 2 dimensions as a function of theta 
theta = 2*pi*[0:100]/100;

%Plot the ellipse with red dashed lines 'r--'
major_radius = 2 * sqrt(eigvals(1));
minor_radius = 2 * sqrt(eigvals(2));
ellipse_x = major_radius * cos(theta);
ellipse_y = minor_radius * sin(theta);
plot(ellipse_x, ellipse_y, 'r--');

%Use axis equal to correct aspect ratio
axis equal
end