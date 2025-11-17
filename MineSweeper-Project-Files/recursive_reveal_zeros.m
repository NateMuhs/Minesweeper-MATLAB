function [outputArg1,outputArg2] = recursive_reveal_zeros(inputArg1,inputArg2)
%RECURSIVE_REVEAL_ZEROS Summary of this function goes here
%   Detailed explanation goes here

display_board = revealZeros(game_board, selected_row, selected_col);

disp(display_board);

function display_board = revealZeros(game_board, selected_row, selected_col)
    % Make display_board start as all 1's
    display_board = ones(size(game_board));

    % (Optional) force the selected location to be 0 on the game board,
    % if that's what your assignment says.
    game_board(selected_row, selected_col) = 0;

    % Call the recursive helper
    display_board = floodFill(game_board, display_board, selected_row, selected_col);
end

function display_board = floodFill(game_board, display_board, r, c)
    [nRows, nCols] = size(game_board);

    % 1) Out-of-bounds check
    if r < 1 || r > nRows || c < 1 || c > nCols
        return;
    end

    % 2) Only care about zeros on the hidden game board
    if game_board(r, c) ~= 0
        return;
    end

    % 3) If we already revealed this location, stop
    if display_board(r, c) == 0
        return;
    end

    % 4) Reveal this cell
    display_board(r, c) = 0;

    % 5) Recurse on all 4 neighbors
    for dr = -1:1
        for dc = -1:1
            % skip (0,0) which is the current cell
            if dr == 0 && dc == 0
                continue;
            end
            display_board = floodFill(game_board, display_board, r + dr, c + dc);
        end
    end
end


end