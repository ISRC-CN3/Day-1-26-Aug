function y = calcy(x)
% calcy calculates y as a function of x
% Format of call: calcy(x)
% y  =  1     if   x < -1
% y  =  x^2   if   -1 <= x <= 2
% y  =  4     if   x > 2

if x < -1
    y = 1;
elseif x <= 2
    y = x.^2;
else
    y = 4;
end
end
