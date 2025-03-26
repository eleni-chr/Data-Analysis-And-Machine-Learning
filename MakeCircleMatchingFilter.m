function [filter, xc, yc] = MakeCircleMatchingFilter(diameter, W)

% Function written by Eleni Christoforidou in MATLAB R2022b.

% This function takes as input the diameter for the circle as well as W, 
% the filter size for the matching filter. It outputs the [WxW] matrix 
% filter, which is a binary mask that contains, as foreground, a circle 
% with width diameter centered in the matrix surrounded by background 
% pixels. The variable filter serves as a matching filter for circular 
% shapes with approximately the same diameter. The function also outputs xc
% and yc,  the coordinates of the center of the filter, as 2nd and 3rd 
% optional outputs.

% Input arguments:
%   diameter - the diameter of the circle (in pixels)
%   W - the size of the filter (W x W pixels)

% Output arguments:
%   filter - the binary mask containing the circle
%   xc, yc - the coordinates of the center of the filter (optional outputs)

% Initialize filter as a background (zeros) matrix
filter = zeros(W);

% Find the coordinates of the center of the filter
xc = (W/2) + 0.5;
yc = (W/2) + 0.5;

% Loop across every row and column of the filter matrix
for i = 1:W
    for j = 1:W
        % Determine whether the pixel's row-column coordinates falls within the circle's radius relative to the center of the filter
        if sqrt((i-xc)^2 + (j-yc)^2) <= diameter/2
            % Label the pixel as foreground with a 1
            filter(i,j) = 1;
        end
    end
end
end