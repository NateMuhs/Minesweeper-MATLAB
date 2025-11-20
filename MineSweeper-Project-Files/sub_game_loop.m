function sub_game_loop()
%SUB_GAME_LOOP This is where all of the functionality of the minesweeper game
%is implemented
%   Input: None
%
%   Output: None

%% generate gameboards
hiddenGameBoard = generate_hidden_board(5, 5, 3); % Generate with project stipulations
userGameBoard = ones(size(hiddenGameBoard)); % Generate user game board with the same size as the project stipulations

% change the user game board form 1s to 11s to help the user distinguish
for row = 1:5
    for col = 1:5
        userGameBoard(row,col) = 11;
    end
end

%% Declare pre loop variables and enter the game prompts
numDiffuse = 3;
mineHit = false;

while numDiffuse > 0 && mineHit == false
    disp('Here is the gameboard');
    display_with_numbers(userGameBoard); % First disply game baord
    
    % User locally declared function to prompt for input
    choice = text_input(['What do you want to do? Enter "I" to investegate,' ...
        ' "D" to diffuse a bomb, or "Q" to quit the game: '], 'IDQ');

    switch choice
        case 'D' % The user would like to diffuse a bomb
            [rowValue, colValue] = prompt_location(hiddenGameBoard); % Get the diffuse location
            userGameBoard(rowValue, colValue) = 9; % Place diffuse
            numDiffuse = numDiffuse - 1;
                
            % When all the diffuses are used the program checks to see if
            % the diffuses were placed in the right locations
            if numDiffuse < 1
                for row = 1:5
                    for col = 1:5
                        if hiddenGameBoard(row,col) == 9 && userGameBoard(row,col) ~= 9
                            mineHit = true;
                        end
                    end
                end
                
                if mineHit == false % Diffuses were used in the correct location
                    disp('CONGRADULATIONS YOU WON');
                else % Diffuse was used in the wrong locaiton 
                    disp('YOU LOST');
                end
            end

        case 'I' % User would like to inspect a location
            [rowValue, colValue] = prompt_location(hiddenGameBoard); % Get inspect location

            % Possibilites when inspecting a bomb:
            % Call reveal zeros function
            if hiddenGameBoard(rowValue, colValue) == 0
                userGameBoard = reveal_zeros(hiddenGameBoard, userGameBoard, rowValue, colValue);

            % Just reveal given number
            elseif hiddenGameBoard(rowValue, colValue) ~= 9
                userGameBoard(rowValue, colValue) = hiddenGameBoard(rowValue, colValue);

            % The user hit a bomb
            else
                mineHit = true;
                disp('YOU LOST')
            end

        case 'Q' % The user would like to quit this particular game
            disp('You quit the game before finishing')
            break;
    end
end

%% Display the final game board with rows and collums
disp('This is the hidden game board that you were playing on: ');
display_with_numbers(hiddenGameBoard);

end
