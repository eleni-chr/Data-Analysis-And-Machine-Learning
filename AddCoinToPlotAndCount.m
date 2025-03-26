function [coinvalue,x_plot,y_plot,col] = AddCoinToPlotAndCount(x,y,cls)

% Function written by Eleni Christoforidou in MATLAB R2022b.

% This function takes as input x and y, coordinates for the centroid of a 
% coin found in the image, cls, its classification label indicating whether
% it was found to be a dime, nickel, or quarter. The function outputs 
% coinvalue, the value (in cents) of the coin that was found. It also 
% plots, in the current figure, a circle centered at x and y with radius 
% and color unique for each coin type according to the table below. The
% function also has 2nd and 3rd outputs x_plot and y_plot, the list of x 
% and y coordinates of the vertices of the circle being plotted. The 
% function also has a 4th output col, the color string of the circle plotted.

%         Dime  |  Nickel  |  Quarter
% Radius   22   |    30    |    40
% Color   red   |   green  |  magenta 
% Value    10   |     5    |    25


% initialize radians for defining x_plot and y_plot using cos and sin functions
rads = 0:2*pi/32:2*pi;
% initialize parameters for radius and color of circle for each type of coin
dime_radius = 22;
nickel_radius = 30;
quarter_radius = 40;

dime_color = 'r';
nickel_color = 'g';
quarter_color = 'm';

% Use an if-elseif statement to determine coinvalue, x_plot, y_plot, and colorcode col unique for each coin type
if cls==1
    coinvalue = 10;
    x_plot = x+dime_radius*cos(rads);
    y_plot = y+dime_radius*sin(rads);
    col = dime_color;
elseif cls==2
    coinvalue = 5;
    x_plot = x+nickel_radius*cos(rads);
    y_plot = y+nickel_radius*sin(rads);
    col = nickel_color;
else
    coinvalue = 25;
    x_plot = x+quarter_radius*cos(rads);
    y_plot = y+quarter_radius*sin(rads);
    col = quarter_color;
end
plot(x_plot,y_plot,col);
end