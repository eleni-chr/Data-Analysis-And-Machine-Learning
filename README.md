# Data-Analysis-And-Machine-Learning
Tools for data classification, regression, dimensionality reduction, and error estimation.

Code written by Eleni Christoforidou in MATLAB R2022b.

# pca_fun
Functions for dimensionality reduction using principal component analysis.

**compute_feature_dimensions:** This function computes the number of feature dimensions N needed to represent at least 99.9% of the variance in the feature set of the humanactivity dataset (built-in MATLAB dataset) using the 'pca' function.

**plotEllipsoidFit:** This function creates a scatter plot of the first 2 dimensions of the PCA linear vector space, and displays a contour representing the boundary, in the first two dimensions, of the the PCA ellipsoid with 2 standard deviations width.

**standard_deviation_distance:** This function takes as input a [1xN] data vector v and a [1x1] number x, in that order, and computes what is called the "standard deviation distance" from x to dataset v. The standard deviation describes the typical distance of the numbers in the dataset to the mean of the dataset. The standard deviation distance to a new number x describes how many multiples of the standard deviation that the number x falls from the mean of the dataset v, which helps describe how much of an outlier the new number is. For example a standard deviation distance of 1 would imply x falls 1 standard deviation of the mean of v, and so it would be a number that is fairly representative of this dataset, whereas a distance of 3 or more would imply that x falls 3 or more standard deviations from the mean and could be an outlier. The distance is a "signed distance", where the function returns a postive distance for input values of x greater than the mean of v and returns a negative distance for input values of x less than the mean of v. For example, the standard deviation distance of x=7 from dataset v=[10 12 14], which has mean 12 and standard deviation 2, is equal to -2.5 because x is 2.5 standard deviations below the mean of v.

**lin_reg:** Given a set of approximate x and y coordinates of points in a plane, this function determines the best fitting line in the least square sense, using the standard formula of a line: ax + b = y. That is, the function takes two row vectors of the same length called x and y as input arguments (containing x and y coordinates of points) and returns two scalars, a and b specifying the line, as output arguments.

For example: [a b] = lin_reg([0 2],[0 2]) outputs a = 1, b = 0

**EstimationErrorPlot:** This function takes as input an [Mx1] vector prediction and an [Mx1] vector target. It returns the mean squared error mse between the prediction and the target vectors, the correlation R and statistical significance p-value from computing Pearson's correlation coefficient, and the range of the data rg used to draw the diagonal of the plot.

**voters:** This function takes an unspecified number of inputs, but the first input is the current database. The rest of the arguments must come in the order of name (a string or char array) and ID (an integer or integer-valued double). If there is at least one occurrence of no ID number after a name, or the data types are not what is required, the function returns the original database. The function returns a struct array containing Name (a string) and ID (a double) fields as shown in the example below.

_Testing:_

database = voters([], 'Adam', 11111)

database = voters(database, 'Eve', 22222)

database(1)

database(2)

## Various functions for data classification

**my_fitpca:** This function takes as input the [MxN] data matrix D, containing N feature measurements for M samples, and the known classification for each sample in the [Mx1] vector called class. The function outputs the struct mdl, which contains the pca models created for each unique classification in class.

**MahalanobisDistance:** This function takes as input a single class from the pca model mdl and a [1xN] feature vector v, containing N feature measurements for a sample. It outputs the Mahalanobis distance from the feature vector to the pca model. It also outputs b, the coordinates within the pca model space for the feature vector, and std_per_mode, which contains the standard deviation distances from the mean for each mode of variation in the pca model.

**my_predictpca:** This function takes as input a pca model mdl and an [MxN] data matrix D, containing N feature measurements for M samples. It has two outputs, the classification for each sample in the [Mx1] vector class that is estimated using the pca model, and the Mahalanobis distance score for each sample in the [Mx1] vector score as the second output.

**coinClassification:** The coinClassification script localises and classifies coins in an image, and allows visualisation of the resutls. The following helper functions are used in the script:

_MakeCircleMatchingFilter:_ This function takes as input the diameter for the circle as well as W, the filter size for the matching filter. It outputs the [WxW] matrix filter, which is a binary mask that contains, as foreground, a circle with width diameter centered in the matrix surrounded by background pixels. The variable filter serves as a matching filter for circular shapes with approximately the same diameter. The function also outputs xc and yc,  the coordinates of the center of the filter, as 2nd and 3rd optional outputs.

_AddCoinToPlotAndCount:_ This function takes as input x and y, coordinates for the centroid of a coin found in the image, cls, its classification label indicating whether it was found to be a dime, nickel, or quarter. The function outputs coinvalue, the value (in cents) of the coin that was found. It also plots, in the current figure, a circle centered at x and y with radius and color unique for each coin type according to the table below. The function also has 2nd and 3rd outputs x_plot and y_plot, the list of x and y coordinates of the vertices of the circle being plotted. The function also has a 4th output col, the color string of the circle plotted.

_OtsuThreshold:_ This function takes as input an [MxN] uint8 image matrix img, and outputs the Otsu thresholded binary image in [MxN] matrix msk, as well as the integer threshold thrsh used to make msk.
