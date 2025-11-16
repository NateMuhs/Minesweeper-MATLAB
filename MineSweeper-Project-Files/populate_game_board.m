function [populatedBoard] = populate_game_board(gameBoard)
%POPULATE_GAME_BOARD populates the game board with numbers indicating the
%number of bombs located around a point. the number 3 would indicate three
%bombs located in the square surounding the location. The number 9
%indicates a bomb.
%
%   Input - gameBoard a matrix with bombs
%
%   Output - populatedBoard - the board populated with the amount of bombs
%   surrounding a given location

populatedBoard = gameBoard;

[numRows, numCols] = size(gameBoard);

iterations = 0;
for r = 1:numRows
    iterations = iterations +1;
    for c = 1:numCols
        iterations = iterations +1;
        if gameBoard(r,c) == 9
        elseif r == 1 && c == 1 % Top Left of the board
            right = gameBoard(r,c+1);
            rightdown = gameBoard(r+1,c+1);
            down = gameBoard(r+1,c);
            populatedBoard(r,c) = (right + rightdown + down)/9;
        elseif r == 1 && c == numCols % Top Right of the board
            down = gameBoard(r+1,c);
            downleft = gameBoard(r+1,c-1);
            left = gameBoard(r,c-1);
            populatedBoard(r,c) = (down + downleft + left)/9;
        elseif r == numRows && c == 1 % Bottom Left of the board
            up = gameBoard(r-1,c);
            upright = gameBoard(r-1,c+1);
            right = gameBoard(r,c+1);
            populatedBoard(r,c) = (up + upright + right)/9;
        elseif r == numRows && c == numCols % Bottom Right of the board
            left = gameBoard(r,c-1);
            leftup = gameBoard(r-1,c-1);
            up = gameBoard(r-1,c);
            populatedBoard(r,c) = (left + leftup + up)/9;
        elseif r == 1 % Top Edge of the board
            right = gameBoard(r,c+1);
            downright = gameBoard(r+1,c+1);
            down = gameBoard(r+1, c);
            downleft = gameBoard(r+1,c-1);
            left = gameBoard(r,c-1);
            populatedBoard(r,c) = (right + downright + down + downleft + left)/9;
        elseif c == 1 % Left Edge of the board
            up = gameBoard(r-1,c);
            upright = gameBoard(r-1,c+1);
            right = gameBoard(r, c+1);
            rightdown = gameBoard(r+1,c+1);
            down = gameBoard(r+1,c);
            populatedBoard(r,c) = (up + upright + right + rightdown + down)/9;
        elseif c == numCols % Right Edge of the board
            down = gameBoard(r+1,c);
            downleft = gameBoard(r+1,c-1);
            left = gameBoard(r, c-1);
            leftup = gameBoard(r-1,c-1);
            up = gameBoard(r-1,c);
            populatedBoard(r,c) = (down + downleft + left + leftup + up)/9;
        elseif r == numRows % Bottom Edge of the board
            left = gameBoard(r,c-1);
            leftup = gameBoard(r-1,c-1);
            up = gameBoard(r-1, c);
            upright = gameBoard(r-1,c+1);
            right = gameBoard(r,c+1);
            populatedBoard(r,c) = (left + leftup + up + upright + right)/9;
        else % Middle of the board
            right = gameBoard(r,c+1);
            rightdown = gameBoard(r+1,c+1);
            down = gameBoard(r+1,c);
            downleft = gameBoard(r+1,c-1);
            left = gameBoard(r,c-1);
            leftup = gameBoard(r-1,c-1);
            up = gameBoard(r-1,c);
            upright = gameBoard(r-1,c+1);
            populatedBoard(r,c) = (right + rightdown + down + downleft + left + leftup + up + upright)/9;
        end
    end
end

% THESE WERE USED FOR TESTING
% disp('Here is the final game_boardrix: ');
% fprintf('it took %i iterations to obrain this game_boardrix.\n', iterations);

end
