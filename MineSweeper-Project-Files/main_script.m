clear; clc
%% This is the main script file for our code. I tried to keep it clean by adding functions.

% Always asume that if the code was run the game will be played
status = "Yes";

%% Main game loop of minesweeper
while status == "Yes"
    % Instructions on how to play the game
    display_instructions();
    
    % Enter the sub game loop
    sub_game_loop()

    % Prompt the user for status
    status = input('Would you like to play Minesweeper again? enter "Yes" or "No": ', 's');
end

