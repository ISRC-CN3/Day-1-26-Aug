function grade = switchletgrade(quiz)
% switchletgrade returns the letter grade corresponding
%   to the integer quiz grade argument using switch
% Format of call: switchletgrade(integerQuiz)
% Returns a character
 
% First, error-check
if quiz < 0 || quiz > 10
    grade = 'X';
else
    % If here, it is valid so figure out the
    %  corresponding letter grade using a switch
    switch quiz
        case 10
            grade = 'A';
        case 9
            grade = 'A';
        case 8
            grade = 'B';
        case 7
            grade = 'C';
        case 6
            grade = 'D';
        otherwise
            grade = 'F';
    end
end
end
