clear; clc
%% This is the main script file for out code. I tried to keep it clean by adding functions.

% Always asume that if the code was run the game will be played
status = "Yes";

% Main game loop for the user
while status == "Yes"
    DisplayInstructions(); % Instructions on how to play the game
    gameBoard = GenerateGameBoard(5, 5, 3); % Generate the board with project stipulations

    % Populate the game board with the number of mines around a given location
    hidden_Game_Board = PopulateGameBoard(gameBoard);
    
    % User game board creation
    user_Game_Board = ones(5, 5);
    
    numDiffuse = 3;
    % Sub game loop - turns
    while numDiffuse > 3 && mineHit == false
        disp(user_Game_Board); % First disply game baord

        mineHit = true; % THIS IS JUST SO THE CODE WILL RUN RIGHT NOW
    end


    % Display the final game board with rows and collums
    disp('This is the populated game borad');
    disp(hidden_Game_Board);

    % Reprompt the user for status
    status = input('Would you like to play Minesweeper again? enter "Yes" or "No": ', 's');
end

