function sub_game_loop()
%SUB_GAME_LOOP This is where all of the functionality of the minesweeper game
%is implemented
%   Input: None
%
%   Output: None

%% generate gameboards
hiddenGameBoard = generate_hidden_board(5, 5, 3); % Generate with project stipulations
userGameBoard = ones(size(hiddenGameBoard));
for row = 1:5
    for col = 1:5
        userGameBoard(row,col) = 11;
    end
end

%% Declare pre loop variables and enter the game prompts
numDiffuse = 3;
mineHit = false;

while numDiffuse > 0 && mineHit == false
    disp(userGameBoard); % First disply game baord

    choice = input(['What do you want to do? Enter I to investegate,' ...
        ' D to diffuse a bomb, or Q to quit the game: '], 's');

    switch choice
        case 'D'
            [rowValue, colValue] = prompt_location();
            userGameBoard(rowValue, colValue) = 9;
            numDiffuse = numDiffuse - 1;
                
            if numDiffuse < 1
                for row = 1:5
                    for col = 1:5
                        if hiddenGameBoard(row,col) == 9 && userGameBoard(row,col) ~= 9
                            mineHit = true;
                        end
                    end
                end
                
                if mineHit == false
                    disp('CONGRADULATIONS YOU WON');
                else
                    disp('YOU LOST');
                end
            end
        case 'I'
            [rowValue, colValue] = prompt_location();
            if hiddenGameBoard(rowValue, colValue) == 0
                userGameBoard = reveal_zeros(hiddenGameBoard, userGameBoard, rowValue, colValue);
            elseif hiddenGameBoard(rowValue, colValue) ~= 9
                userGameBoard(rowValue, colValue) = hiddenGameBoard(rowValue, colValue);
            else
                mineHit = true;
                disp('YOU LOST')
            end
        case 'Q'
            disp('You quit the game before finishing, SMH.')
            break;
    end
end

%% Display the final game board with rows and collums
disp('This is the final game board');
disp(hiddenGameBoard);

end
