function sub_game_loop()
%SUB_GAME_LOOP This is where all of the functionality of the minesweeper game
%is implemented
%   Input: None
%
%   Output: None

%% generate gameboards
hiddenGameBoard = generate_hidden_board(5, 5, 3); % Generate with project stipulations
userGameBoard = ones(size(hiddenGameBoard));

%% Declare pre loop variables and enter the game prompts
numDiffuse = 3;
mineHit = false;

while numDiffuse > 0 && mineHit == false
    disp(userGameBoard); % First disply game baord

    choice = menu('What do you want to do?', ...
        'Diffuse a bomb', ...
        'Investigate a location', ...
        'Quit');

    switch choice
        case 1
            [rowValue, colValue] = prompt_location();
            userGameBoard(rowValue, colValue) = 9;
                
            if numDiffuse < 3
                for row = 1:5
                    for col = 1:5
                        if hiddenGameBoard(row,col) == 9 && userGameBoard(row,col) ~= 9
                            mineHit = true;
                        else
                            disp('CONGRADULATIONS YOU WON');
                        end
                    end
                end
            end
        case 2
            [rowValue, colValue] = prompt_location();
            if hiddenGameBoard(rowValue, colValue) == 0
                userGameBoard = reveal_zeros(hiddenGameBoard, userGameBoard, rowValue, colValue);
            elseif hiddenGameBoard(rowValue, colValue) ~= 9
                userGameBoard(rowValue, colValue) = hiddenGameBoard(rowValue, colValue);
            else
                mineHit = true;
                disp('YOU LOST')
            end
        case 3
            disp('You quit the game before finishing, SMH.')
            break;
    end
end

%% Display the final game board with rows and collums
disp('This is the final game board');
disp(hiddenGameBoard);

end
