function display_instructions()
%DISPLAY_INSTRUCTIONS displays the instructions for the minesweeper game
%
%   Input: None
%
%   Output: None

disp('You are provided with a 5x5 game board for the Minesweeper game.');
disp('Within this 5x5 game board there are 3 randomly placed mines');
disp('for you to diffuse. At the start of each turn, the current game');
disp('board will be shown along with a prompt to either diffuse a bomb');
disp('or investigate a location. There are three things that can happen');
disp('when investigating a space:');
disp('  - If the location has a bomb, it will explode and the game will end.');
disp('  - If there are zero mines around it, all connected zero-mine spaces');
disp('    will be revealed.');
disp('  - Otherwise, the investigated space will display a nonzero number');
disp('    of mines located around it.');
disp('The game ends when a bomb is investegated or all diffuses are used.');

end
