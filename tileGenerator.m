function updatedArr = tileGenerator(arr)
%takes in a 4x4 array of doubles
%randomly generate a 2 or 4 on the board in place of a NaN
%chance of getting a 4 with the official game is 10%

%Find the index's that have NaN and store those indexes for later
indx = find(isnan(arr));
r = randi([1 length(indx)],1);
chance = randi([1 10],1);
updatedArr = arr;

%if randi produces a number less than 9, create a 2 at the location
if chance <= 9
    updatedArr(indx(r)) = 2;
else
    updatedArr(indx(r)) = 4;
end