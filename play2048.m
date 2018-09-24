%Skeleton function

function play2048
%if the figure has been closed
global isCloseCalled;
isCloseCalled = false;

%Establish figure: You should remove the menu and toolbar, turn off the
%the number title, and set the title the figure 2048
f= figure('Name','2048','MenuBar','none','NumberTitle','off','Color',[0.98,0.97,0.937], 'Position',[690,100,450,600]);
%Display the title, the score, and create the tiles in the figure
%(assembled like a 2D array)
container = uicontrol(f,'Style','text','BackgroundColor',[0.70,0.67,0.67],'Position',[25,25,400,400]);
title = uicontrol(f,'Style','text','FontSize',60,'String','2048','ForegroundColor',[0.64,0.64,0.64],'BackgroundColor',[0.98,0.97,0.937],...
    'ForegroundColor','k','Position',[10,500,200,80],'FontName','Calibri','FontWeight','bold');
box1 = uicontrol(f,'Style','text','ForegroundColor','k','Position',[33,327,90,90],'FontSize',30,'FontName','Calibri','FontWeight','bold');
box2 = uicontrol(f,'Style','text','ForegroundColor','k','Position',[33,229,90,90],'FontSize',30,'FontName','Calibri','FontWeight','bold');
box3 = uicontrol(f,'Style','text','ForegroundColor','k','Position',[33,131,90,90],'FontSize',30,'FontName','Calibri','FontWeight','bold');
box4 = uicontrol(f,'Style','text','ForegroundColor','k','Position',[33,33,90,90],'FontSize',30,'FontName','Calibri','FontWeight','bold');
box5 = uicontrol(f,'Style','text','ForegroundColor','k','Position',[131,327,90,90],'FontSize',30,'FontName','Calibri','FontWeight','bold');
box6 = uicontrol(f,'Style','text','ForegroundColor','k','Position',[131,229,90,90],'FontSize',30,'FontName','Calibri','FontWeight','bold');
box7 = uicontrol(f,'Style','text','ForegroundColor','k','Position',[131,131,90,90],'FontSize',30,'FontName','Calibri','FontWeight','bold');
box8 = uicontrol(f,'Style','text','ForegroundColor','k','Position',[131,33,90,90],'FontSize',30,'FontName','Calibri','FontWeight','bold');
box9 = uicontrol(f,'Style','text','ForegroundColor','k','Position',[229,327,90,90],'FontSize',30,'FontName','Calibri','FontWeight','bold');
box10 = uicontrol(f,'Style','text','ForegroundColor','k','Position',[229,229,90,90],'FontSize',30,'FontName','Calibri','FontWeight','bold');
box11 = uicontrol(f,'Style','text','ForegroundColor','k','Position',[229,131,90,90],'FontSize',30,'FontName','Calibri','FontWeight','bold');
box12 = uicontrol(f,'Style','text','ForegroundColor','k','Position',[229,33,90,90],'FontSize',30,'FontName','Calibri','FontWeight','bold');
box13 = uicontrol(f,'Style','text','ForegroundColor','k','Position',[327,327,90,90],'FontSize',30,'FontName','Calibri','FontWeight','bold');
box14 = uicontrol(f,'Style','text','ForegroundColor','k','Position',[327,229,90,90],'FontSize',30,'FontName','Calibri','FontWeight','bold');
box15= uicontrol(f,'Style','text','ForegroundColor','k','Position',[327,131,90,90],'FontSize',30,'FontName','Calibri','FontWeight','bold');
box16 = uicontrol(f,'Style','text','ForegroundColor','k','Position',[327,33,90,90],'FontSize',30,'FontName','Calibri','FontWeight','bold');

%scores
txt1 = uicontrol(f,'Style','text','FontSize',15,'String','Current','ForegroundColor','k','BackgroundColor',[0.98,0.97,0.937],...
    'ForegroundColor','k','Position',[250,510,200,80],'FontName','Calibri','FontWeight','bold','HorizontalAlignment','left');
txt2 = uicontrol(f,'Style','text','FontSize',15,'String','Best','ForegroundColor','k','BackgroundColor',[0.98,0.97,0.937],...
    'ForegroundColor','k','Position',[370,510,200,80],'FontName','Calibri','FontWeight','bold','HorizontalAlignment','left');
scoreCount = uicontrol(f,'Style','text','FontSize',13,'String',0,'ForegroundColor','k','BackgroundColor',[0.98,0.97,0.937],...
   'Position',[229,480,100,80],'FontName','Calibri');
HighscoreCount = uicontrol(f,'Style','text','FontSize',13,'String',0,'ForegroundColor','k','BackgroundColor',[0.98,0.97,0.937],...
   'Position',[340,480,100,80],'FontName','Calibri');

% Create a quit button (it can use the callback function quitGame provided
% below)
quit = uicontrol(f, 'Style','pushButton','String','Quit', ...
                     'FontSize',15,'FontName','Calibri','Position', [275 450 120 40]);
quit.Callback = @quitGame;
txt3 = uicontrol(f, 'Style','text','String','Match tiles until you get 2048 or something', ...
                     'FontSize',12,'FontName','Calibri','Position', [32 450 200 40],'ForegroundColor',...
                     'k','BackgroundColor',[.98,0.97,0.937],'HorizontalAlignment','left');
%%%%%%%%%%%access highscore file and input that into the appropriate area
file = fopen('highscore.txt');
line = str2num(fgetl(file));
HighscoreCount.String = line;
fclose(file);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Initialize an array to keep track of your values as the game is played 
array = NaN(4,4);
tileArray = [box1,box2,box3,box4,box5,box6,box7,box8,box9,box10,box11,box12,box13,box14,box15,box16];
%Update the display to show the beginning board with the new tiles
array = tileGenerator(array);
for i = 1:16
    if ~isnan(array(i))
        tileArray(i).String = array(i);
        if array(i) == 2
            tileArray(i).BackgroundColor = [1 1 1];
        else
            tileArray(i).BackgroundColor = [1 0.894 0.71];
        end
    end
end

%%%LOOPING OF GAMEPLAY
score = 0;
play = true;

array1 = array; %temporarily hold the "changed" array
while play

    if isCloseCalled == true
        play = false;
        break
    end
    %Pause the program to wait for a user input
    pause;
    
    %Determine the user input, and call the boardSlider with the
    %appropriate direction
    key = get(gcf,'CurrentCharacter'); %left 28, right 29, up 30, down 31
    switch key
        case char(28)
            [array1,score] = boardSlider(array,'left',score);
        case char(29)
            [array1,score] = boardSlider(array,'right',score);
        case char(30)
            [array1,score] = boardSlider(array,'up',score);
        case char(31)
            [array1,score] = boardSlider(array,'down',score);
    end
    if isCloseCalled == true
         play = false;
        break
    end     
    
    %Update the tiles in the figure based on the array:
    %if the two arrays are not the same
    
    if ~all(all(isnan(array) == isnan(array1))) && ~all(all(~isnan(array)== ~isnan(array1)))
        %put a random value
        array1 = tileGenerator(array1);
        %populate the array with values
        for i = 1:16
        if ~isnan(array1(i))
            tileArray(i).String = array1(i);
            switch array1(i)
                case 2
                    tileArray(i).BackgroundColor = [1 1 1];
                case 4
                    tileArray(i).BackgroundColor = [1 0.894 0.71];
                case 8
                    tileArray(i).BackgroundColor = [1 0.804 0.69];
                case 16
                    tileArray(i).BackgroundColor = [0.940000 0.870000 0.800000];
                case 32
                    tileArray(i).BackgroundColor = [0.470000 0.810000 0.940000];
                case 64
                    tileArray(i).BackgroundColor = [0.710000 0.650000 0.260000];
                case 128
                    tileArray(i).BackgroundColor = [0.640000 0.760000 0.680000];
                case 256
                    tileArray(i).BackgroundColor = [0.670000 0.880000 0.690000];
                case 512
                    tileArray(i).BackgroundColor = [0.970000 0.910000 0.810000];
                case 1024
                    tileArray(i).BackgroundColor = [0.590000 0.440000 0.840000];
                case 2048
                    tileArray(i).BackgroundColor = [0.580000 0.000000 0.830000];
            end
        else
            tileArray(i).String = [];
            tileArray(i).BackgroundColor = [0.94 0.94 0.94];
        end
        end
        array = array1;
        
    end
    %update score
    scoreCount.String = score;
    %%%%%%%%%%%%%CHECK IF GAME OVER%%%%%%%%%%%%%%%%%%%%%%%%
    %Check to see if Game Over
    status = 0; %if game over, status should be 6
    if all(all(~isnan(array1)))
        for x=1:2 %simple check. go each row and each column and check for adjacency
            for y=1:3
               if x == 1 %rows
                   if ~any(array1(y,:) == array1(y+1,:)) %row below doesn't have any matches
                       status = status + 1;
                   end
               else %check columns
                   if ~any(array1(:,y) == array1(:, y+1))
                       status = status + 1;
                   end
               end
            end
        end
    end
    if status == 6 %no moves left
        prompt = uicontrol(f,'Style','text','FontSize',40,'String','No more moves!!!','BackgroundColor',[0.3 0.3 0.3],...
                        'ForegroundColor','w','Position',[130,200,200,200],'FontName','Calibri','FontWeight','bold');
        pause(3);
        prompt.Visible = 'off';
        quitGame(x,y);
    else
        status = 0;
    end
end
end

function quitGame(source,event) % fill in the two inputs for a callback function
    f = gcf;
    childs = get(f,'Children');
    
    %checks to see if your current score is higher than your high score
    %if true, then ask for name, and override the highscore in
    %highscore.txt
    currScore = str2num(childs(5).String);
    highScore = str2num(childs(4).String);
    if currScore > highScore
        answer = inputdlg('New highscore!!! What is your name?','HIGHSCORE');
        file = fopen('highscore.txt','w');
        fprintf(file,num2str(currScore));
    end
    GAMEOVER = uicontrol(f,'Style','text','FontSize',80,'String','GAME OVER','BackgroundColor',[1 1 1],...
    'ForegroundColor','w','Position',[1,1,450,600],'FontName','Calibri','FontWeight','bold');

    %sweet animation for game over
    for i=1:-0.01:0
        GAMEOVER.BackgroundColor = [i i i];
        pause(0.015);
    end
    close(f);
    % closes the figure
end