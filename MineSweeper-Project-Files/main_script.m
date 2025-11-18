clear; clc
% This is the main script file for our code. I tried to keep it clean by adding functions.

% Always assume that if the code was run the game will be played
status = "Y";

%% Main game loop of minesweeper
while status == "Y"
    % Instructions on how to play the game
    display_instructions();
    
    % Enter the sub game loop
    sub_game_loop()

    % Prompt the user for status
    status = text_input('Would you like to play Minesweeper again? Enter "Y" for yes or "N" for no: ', 'YN');
end

