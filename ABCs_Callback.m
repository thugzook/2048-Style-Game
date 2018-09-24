% DO NOT CHANGE THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ABCs_Callback()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ABCs of Callback Functions
%
%
% Directions:
%   Fill in the incomplete code to complete the GUI.
%   This GUI will take text from an input box, and display it in a text box
%   located in the same figure
%   There are 11 tasks to complete
%

% create figure
f = figure('Name','ABCs_Callback', 'NumberTitle','off','Color','k', ...
            'Position',[420,218,650,450],'MenuBar','none');

% create text box
txt = uicontrol(f,'Style','text', 'BackgroundColor','k','FontSize', 20, ...
                'Position', [11 200, 630, 227], 'ForegroundColor', 'g', ...
                'HorizontalAlignment', 'left'); % (1)

% create a text input box            
txtIn = uicontrol(f, 'Style', 'edit', 'BackgroundColor','white','FontSize', 15, ... 
                'Position', [11 111, 630, 50],'HorizontalAlignment','left'); % (2)

% create a push button called 'Print
printBtn = uicontrol(f, 'Style','pushButton','String','Print', ...
                     'FontSize',15, 'Position', [500 40 120 40]); %(3)

% asign the Callback property to the printUserInput function
printBtn.Callback = @printUserInput; % (4)

% create a pushbutton called 'Quit'
quitBtn = uicontrol(f, 'Style','pushButton','String','Quit', ...
                     'FontSize',15, 'Position', [340 40 120 40], ...
                     'Interruptible', 'off'); %(5)

% assign the Callback property to the quitPractice function
quitBtn.Callback = @quitPractice; % (6)
array = [txtIn, printBtn];
end

% is a Callback function. Fill in the two necessary inputs
function printUserInput(source,event) %(7)

    cf = gcf;
    
    % get the children of the current figure
    childs = get(cf,'Children'); % (8)
    
    % HINT: for the following two tasks, you may have to put a breakpoint
    % on line 58 then push the print button, then in the command window get the
    % children of the current figure and look at their properties to figure
    % out which index of childs contains the UIControl object you want
    
    % get the text input box from childs
    txtIn = childs(3); % (9)
    
    %gets the text box input from childs
    txt = childs(4); % (10)
    
    %copies the String property from the text input to the String property
    %of the text box
    txt.String = txtIn.String;

end

function quitPractice(src,event)

    % get the current figure
    f = gcf; 
    
    % creates a neat quitting graphic
    qtxt = uicontrol(f, 'Style','text','String','Quitting...', ...
                     'FontSize',50, 'Position', [200 300 300 100], ...
                     'BackgroundColor','k','ForegroundColor','y', ...
                     'HorizontalAlignment','left');
    pause(1.5); % This just adds affect!
    
    % closes the figure
    close(f) % (11)
    
    % prints an output message to the command window
    fprintf(['You have exited ABCs_Callback Practice.\nGood Luck with ' ...
        'the rest of the project!\n\n']);
    
end





