function [gameBoard] = GenerateGameBoard(x, y, numBomb)
%GENERATEGAMEBOARD gernerates a board game with spesified size and number
%of bombs for the called
%
%   Input: x - the number of rows used for board size
%          y - The number of collums used for the board size
%          numBomb - number of bombs to be placed on the board
%
%   Output: gameBoard - the matrix with spesified boambs to be provided to the
%   user
    
gameBoard = zeros(x, y);

while numBomb > 0
    row = randi(x);
    column = randi(y);
    if gameBoard(row,column) == 0
        gameBoard(row,column) = 9;
        numBomb = numBomb - 1;
    end
end
end 