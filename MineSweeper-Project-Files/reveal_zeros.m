function userGameBoard = reveal_zeros(hiddenGameBoard,userGameBoard,selected_row,selected_col)
%REVEAL_ZEROS reveals the current location as a zero and all zeros adjasent
%to the provided location. The function also reveals the first numbers next
%to the zeros
%   Input: hiddenGameBoard - the game board hidden from the user
%          userGameBoard - the gameboard to reveal the zeros on
%          selected_row - the row selected by the user
%          selected_col - the collum selected by the user
%
%   Output: userGameBoard - the game board returned to the code with zeros
%   revealed

% Get the size
[rows,cols] = size(hiddenGameBoard);

userGameBoard(selected_row,selected_col) = 0; % sets selected index at 0

check = 2;
while check > 1 % keeps looping until until are no more zeros
    check = 0;
    for r = 1:rows
        for c = 1:cols % for loops to run through each index
            if userGameBoard(r,c) == 0 % if a zero is found
                for ro = -1:1
                    for co = -1:1 % for loops to check the surrounding indexes
                        new_row = r + ro;
                        new_col = c + co; % variables made to make code look cleaner when checking surrounding indexes
                        if 1 <= new_row && new_row <= rows && 1 <= new_col && new_col <= cols % making sure the variables are withing the borders
                            if hiddenGameBoard(new_row,new_col) == 0 && userGameBoard(new_row,new_col) == 11 % if it is a zero on the game board
                                userGameBoard(new_row,new_col) = hiddenGameBoard(new_row, new_col); % sets the display board to a zero
                                check = 2; % ends while loop because all zeros have been "checked"
                            elseif userGameBoard(new_row,new_col) ~= 9 % If it is the first adjasent number next to the zero
                                userGameBoard(new_row,new_col) = hiddenGameBoard(new_row, new_col);
                            end
                        end
                    end
                end
            end
        end
    end
end
end