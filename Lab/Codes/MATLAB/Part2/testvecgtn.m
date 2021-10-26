function outvec = testvecgtn(vec,n)
% testvecgtn tests whether elements in vector 
%    are greater than n or not
% Format: testvecgtn(vector, n)
 
% Preallocate the vector to logical false
outvec = false(size(vec));
for i = 1:length(vec)
    % If an element is > n, change to true
    if vec(i) > n
        outvec(i) = true;
    end
end
end

