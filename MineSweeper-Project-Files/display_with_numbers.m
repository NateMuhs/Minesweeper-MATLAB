function display_with_numbers(inputMatrix)
%DISPLAY_WITH_NUMBERS displays the input matrix with assigned collum and
%row numbers
%
%   Input: inputMatrix - the matrix to be displayed
%
%   Output: None

[numRows, numCols] = size(inputMatrix);

rowNums = (1:numRows)';   % column vector: 1,2,3,4,5
colNums = 1:numCols;      % row vector:    1 2 3 4 5

labeledA = [0      colNums;      % top row: 0 then column numbers
            rowNums  inputMatrix];         % left column: row numbers, then A

disp(labeledA);

end