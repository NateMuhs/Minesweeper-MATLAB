function [rowValue, colValue] = prompt_location()
% PROMPT_LOCATION asks the user to input an row and col value to to pass to the
% program. These values can be used to investigate a location or diffuse a
% bomb
%   Input: NONE
%
%   Output: xValue - The row value that the user inputed
%           yValue - The collum value that the user inputed

rowValue = input('Please enter an row value from 1-5: ');
colValue = input('Please enter a collum value from 1-5: ');
end