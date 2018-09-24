% DO NOT CHANGE THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ABCs_figures()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ABCs of figures
%
%
% Directions:
%   Fill in the incomplete code to complete the GUI.
%   When you see TAKE A LOOK, go ahead and run your code before continuing
%   so that you can see what the figure looks like, and how it is changing.
%   There are 7 tasks total
%
% NOTE: the solution file will output 3 figures, with each one
% corresponding to the first, second, then third TAKE A LOOK points
% NOTE: If your code keeps erroring because you haven't finished filling in
% the code, comment those lines out and then run this file.



% Create a figure with a white background named 'ABCs_figures' and turns off the figure number
figure('Name','ABCs_figures', 'NumberTitle','off','Color','w', 'Position',[690,218,690,432]); % (1)(2)

% TAKE A LOOK 1

% get the current figure
f = gcf; % (3) what function does this?
% set the background color to black
f.Color = 'k'; % (4)

% creates a text box in the current figure
txt = uicontrol(f,'Style','text','BackgroundColor','w'); %(5)

% TAKE A LOOK 2

% Change the size of the text box so it is 300 pixels wide, 50 pixels high
% and is located in the middle of the screen
%   HINT: look up the position property for uicontrol
%   HINT: look at the dimensions of your figure window to help calculate your
%         starting positions
txt.Position = [210,216,300,50]; %(6)

% Have the text box display the string: 'GO JACKETS! STING 'EM!'
txt.String = 'GO JACKETS! STING ''EM!'; % (7)
txt.FontSize = 30;
txt.HorizontalAlignment = 'center';
txt.ForegroundColor = 'yellow';

% TAKE A LOOK 3


end