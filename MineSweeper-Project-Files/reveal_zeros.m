function userGameBoard = reveal_zeros(hiddenGameBoard,userGameBoard,selected_row,selected_col)
%REVEAL_ZEROS Summary of this function goes here
%   Detailed explanation goes here



[rows,cols] = size(hiddenGameBoard);

userGameBoard(selected_row,selected_col) = 0; % sets selected index at 0
check = 2;
while check > 1 % keeps looping until thereif hiddenGameBoard(selected_row,selected_col) == 0 are no more zeros
    check = 0;
    for r = 1:rows
        for c = 1:cols % for loops to run through each index
            if userGameBoard(r,c) == 0 % if a zero is found
                for ro = -1:1
                    for co = -1:1 % for loops to check the surrounding indexes
                        new_row = r + ro;
                        new_col = c + co; % variables made to make code look cleaner when checking surrounding indexes
                        if 1 <= new_row && new_row <= rows && 1 <= new_col && new_col <= cols % making sure the variables are withing the borders
                            if hiddenGameBoard(new_row,new_col) == 0 && userGameBoard(new_row,new_col) == 1 % if it is a zero on the game board
                                userGameBoard(new_row,new_col) = hiddenGameBoard(new_row, new_col); % sets the display board to a zero
                                check = 2; % ends while loop because all zeros have been "checked"
                            elseif userGameBoard(new_row,new_col) ~= 9
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