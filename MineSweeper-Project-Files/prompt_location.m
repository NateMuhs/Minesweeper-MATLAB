function [rowValue, colValue] = prompt_location(hiddenGameBoard)
% PROMPT_LOCATION asks the user to input an row and col value to to pass to the
% program. These values can be used to investigate a location or diffuse a
% bomb
%   Input: hiddenGameBoard - used to find the size spesifications of the
%   board
%
%   Output: rowValue - The row value that the user inputed
%           colValue - The collum value that the user inputed

% Predetermined size
[numRows, numCols] = size(hiddenGameBoard);

% variable to continue asking for row input
lookingForAcceptableRowInput = true;

% Countine through the loop until a valid row number is entered
while lookingForAcceptableRowInput
    rowValue = input('Please enter a Row value: ');
    if rowValue > 0 && rowValue <= numRows
        lookingForAcceptableRowInput = false;
    end
end

% variable to continue asking for collum input
lookingForAcceptableCollumInput = true;

% Countinue through the loop until a valid collum value is entered
while lookingForAcceptableCollumInput
    colValue = input('Please enter a Collum value: ');
    if colValue > 0 && colValue <= numCols
        lookingForAcceptableCollumInput = false;
    end
end
end