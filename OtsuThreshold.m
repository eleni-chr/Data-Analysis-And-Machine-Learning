function [msk,thrsh] = OtsuThreshold(img)

% Function written by Eleni Christoforidou in MATLAB R2022b.

% This function takes as input an [MxN] uint8 image matrix img, and outputs
% the Otsu thresholded binary image in  [MxN] matrix msk, as well as the 
% integer threshold thrsh used to make msk.

% Compute histogram of image
histo = imhist(img);

% Compute total number of pixels
num_pixels = numel(img);

% Initialize variables
sumB = 0;
wB = 0;
max_var = 0;
thrsh = 0;

% Loop over all possible thresholds
for t = 1:256
    wF = sum(histo(1:t));
    wB = num_pixels - wF;
    if wB == 0
        break;
    end
    sumF = dot((0:t-1), histo(1:t));
    sumB = dot((t:255), histo(t+1:end));
    mF = sumF / wF;
    mB = sumB / wB;
    var_between = wF * wB * (mF - mB)^2;
    if var_between > max_var
        max_var = var_between;
        thrsh = t-1;
    end
end

% Apply threshold to image
msk = img > thrsh;
end