function [a, b] = lin_reg(x, y)

% Function written by Eleni Christoforidou in MATLAB R2022b.

% Given a set of approximate x and y coordinates of points in a plane, this
% function determines the best fitting line in the least square sense, 
% using the standard formula of a line: ax + b = y. That is, the function
% takes two row vectors of the same length called x and y as input 
% arguments (containing x and y coordinates of points) and returns two 
% scalars, a and b specifying the line, as output arguments. For example:
% >> [a b] = lin_reg([0 2],[0 2])
% 
% a =
%      1
% b =
%      0

X = [ones(length(x), 1) x'];
ab = X\y';
a = ab(2);
b = ab(1);
end
