function revealZeros(game_board,display_board,selected_row,selected_col)
% revealZeros will find all the connected 0s on the game board connecting to
% the user's starting position
%   Inputs - game_board - the original game board, the user cannot see this
%            display_board - the game board that is displayed to the user

[rows,cols] = size(display_board);
if game_board(selected_row,selected_col) == 0
    display_board(selected_row,selected_col) = 0; % sets selected index at 0
    check = 2;
    while check > 1 % keeps looping until there are no more zeros
        check = 0;
            for r = 1:rows
                for c = 1:cols % for loops to run through each index
                    if display_board(r,c) == 0 % if a zero is found
                        for ro = -1:1
                            for co = -1:1 % for loops to check the surrounding indexes 
                                new_row = r + ro;
                                new_col = c + co; % variables made to make code look cleaner when checking surrounding indexes
                                    if 1 <= new_row && new_row <= rows && 1 <= new_col && new_col <= cols % making sure the variables are withing the borders
                                        if game_board(new_row,new_col) == 0 && display_board(new_row,new_col) == 1 % if it is a zero on the game board
                                            display_board(new_row,new_col) = 0; % sets the display board to a zero
                                            check = 2; % ends while loop because all zeros have been "checked"
                                        end
                                    end
                            end
                        end
                    end
                end
            end
    end
end
disp(display_board)
end
