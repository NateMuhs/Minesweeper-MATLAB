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

% Predefine the gameboard with zeros
gameBoard = zeros(numRows, numCols);

% Continue throught the loop until all mines are placed
while numBomb > 0
    % Pick random row and collum
    row = randi(numRows);
    column = randi(numCols);

    % Only place the bomb if there is not already a bomb in that location
    if gameBoard(row,column) == 0
        gameBoard(row,column) = 9;
        numBomb = numBomb - 1;
    end
end

% Call seperate function to populate the game board with the number of
% mines surounding a location
gameBoard = populate_game_board(gameBoard);
end 
