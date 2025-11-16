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

while numDiffuse > 3 && mineHit == false
    disp(userGameBoard); % First disply game baord
    
    mineHit = true; % THIS IS JUST SO THE CODE WILL RUN RIGHT NOW
end

%% Display the final game board with rows and collums
disp('This is the final game board');
disp(hiddenGameBoard);

end
