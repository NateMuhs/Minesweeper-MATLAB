function [gameBoard] = generate_hidden_board(numRows, numCols, numBomb)
%GENERATE_HIDDEN_GAME_BOARD gernerates a hidden board with the given
%stipulations
%
%   Input: numRows - the number of rows used for board size
%          numCols - The number of collums used for the board size
%          numBomb - number of bombs to be placed on the board
%
%   Output: gameBoard - the matrix with spesified size, bombs, and numbers
%   signifying number of nearby bombs
    
gameBoard = zeros(numRows, numCols);

while numBomb > 0
    row = randi(numRows);
    column = randi(numCols);
    if gameBoard(row,column) == 0
        gameBoard(row,column) = 9;
        numBomb = numBomb - 1;
    end
end

gameBoard = populate_game_board(gameBoard);
end 
