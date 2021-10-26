function outsum = matcolsum(mat)
% matcolsum finds the sum of every column in a matrix
% Returns a vector of the column sums
% Format: matcolsum(matrix)

[r, c] = size(mat);
 
% Preallocate the vector to the number of columns
outsum = zeros(1,c);
 
% Every column is being summed so the outer loop
% has to be over the columns
for col = 1:c
    % Initialize the running sum to 0 for every column
    runsum = 0;
    for row = 1:r
        runsum = runsum + mat(row,col);
    end
    outsum(col) = runsum;
end
end
