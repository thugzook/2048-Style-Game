function [updatedArr, updatedScore] = boardSlider(arr,direction, score)
% ** the function move the values in the array in the specified direction,
% merging like tiles in the same fashion as the original game, 2048 **
%
% arr = an array containing  values of tiles and blanks, where
% a blank space is represented by NaN and a tile is represented by an
% exponential of 2. 

%go through the array and look for adjacencies
updatedArr = arr;
updatedScore = score;

%call it twice because that is what needs to be done.
[updatedArr,updatedScore] = helper(updatedArr, direction, updatedScore);
[updatedArr,updatedScore] = helper(updatedArr, direction, updatedScore);


% %depending on direction, shove all tiles next to each other
switch direction
    case 'left'
        for i = 1:4
            if any(isnan(updatedArr(i,:)))
                mask = find(~isnan(updatedArr(i,:)));
                updatedArr(i,:) = [updatedArr(i,mask), nan(1,4-length(updatedArr(i,mask)))];
            end
        end
    case 'right'
        for i = 1:4
            if any(isnan(updatedArr(i,:)))
                mask = find(~isnan(updatedArr(i,:)));
                updatedArr(i,:) = [nan(1,4-length(updatedArr(mask))),updatedArr(i,mask)];
            end
        end
    case 'up'
        for i = 1:4
            if any(isnan(updatedArr(:,i)))
                mask = find(~isnan(updatedArr(:,i)));
                updatedArr(:,i) = [updatedArr(mask,i);nan(4-length(updatedArr(mask)),1)];
            end
        end
    case 'down'
        for i = 1:4
            if any(isnan(updatedArr(:,i)))
                mask = find(~isnan(updatedArr(:,i)));
                updatedArr(:,i) = [nan(4-length(updatedArr(mask)),1);updatedArr(mask,i)];
            end
        end
        
end
end

function [updatedArr, updatedScore] = helper (updatedArr,direction, updatedScore)
%combine tiles
switch direction
    case 'left'
        for i= 1:4
            [r,c] = find(~isnan(updatedArr(i,:)));
            ind = sub2ind([1,4], r, c);
            row = updatedArr(i,ind);
            for j = 1:length(row) %ignore first column (start from the right to combine
                if j == 1 && length(row) == 1 %only number
                    updatedArr(i,:) = [row nan(1,3)];
                elseif j ~= 1
                    if isequal(row(j),row(j-1))
                        row(j) = row(j) + row(j-1);
                        row(j-1) = NaN; %put first spot as NaN to be shoved over later
                        updatedScore = updatedScore + row(j);
                    end
                end
            end
            updatedArr(i,:) = [row, nan(1,4-length(row))];
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 'right'
        for i= 1:4
            [r,c] = find(~isnan(updatedArr(i,:)));
            ind = sub2ind([1,4], r, c);
            row = updatedArr(i,ind);
            for j = length(row):-1:1
                if j == 1 && length(row) == 1 %only number
                    updatedArr(i,:) = [nan(1,3),row];
                elseif j~= length(row)
                    if isequal(row(j),row(j+1))
                        row(j) = row(j) + row(j+1);
                        row(j+1) = NaN; %put first spot as NaN to be shoved over later
                        updatedScore = updatedScore + row(j);
                    end
                end
            end
            updatedArr(i,:) = [nan(1,4-length(row)),row];
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 'up'
        for i= 1:4
            [r,c] = find(~isnan(updatedArr(:,i)));
            ind = sub2ind([4,1], r, c);
            row = updatedArr(ind,i);
            for j = 1:length(row) %ignore first column (start from the right to combine
                if j == 1 && length(row) == 1 %only number
                    updatedArr(:,i) = [row; nan(3,1)];
                elseif j ~= 1
                    if isequal(row(j),row(j-1))
                        row(j) = row(j) + row(j-1);
                        row(j-1) = NaN; %put first spot as NaN to be shoved over later
                        updatedScore = updatedScore + row(j);
                    end
                end
            end
            updatedArr(:,i) = [row; nan(4-length(row),1)];
        end
    case 'down'
        for i= 1:4
            [r,c] = find(~isnan(updatedArr(:,i)));
            ind = sub2ind([4,1], r, c);
            row = updatedArr(ind,i);
            for j = length(row):-1:1
                if j == 1 && length(row) == 1 %only number
                    updatedArr(:,i) = [nan(3,1);row];
                elseif j~= length(row)
                    if isequal(row(j),row(j+1))
                        row(j) = row(j) + row(j+1);
                        row(j+1) = NaN; %put first spot as NaN to be shoved over later
                        updatedScore = updatedScore + row(j);
                    end
                end
            end
            updatedArr(:,i) = [nan(4-length(row),1);row];
        end
end
end