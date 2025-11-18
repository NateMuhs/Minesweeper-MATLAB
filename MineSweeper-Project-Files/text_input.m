function textOutput = text_input(userMessage, inputPossibilities)
%TEXT_INPUT displays a message to the command window and asks the user to
%input one of the input possibilities implied by the function
%
%   Input: userMessage - the message displayed to the user
%          inputPossibilities - the acceptable inputs
%
%   Output: textOutput - the message provided by the user that matches the
%   possible inputs

lookingForAcceptableInput = true;

while lookingForAcceptableInput
    textOutput = upper(input(userMessage,'s'));
    for iteration = 1:size(inputPossibilities, 2)
        if textOutput == inputPossibilities(iteration)
            lookingForAcceptableInput = false;
        end
    end
end