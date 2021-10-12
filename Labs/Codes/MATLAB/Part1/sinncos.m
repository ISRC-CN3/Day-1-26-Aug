% This script plots sin(x) and cos(x) in the same Fig.
% Window for values of x ranging from 0 to 2*pi
clf
x=0:2*pi/40:2*pi; 		
y=sin(x);
plot(x,y,'ro')
hold on
y=cos(x);
plot(x,y,'b+')
legend('sin','cos')
title('sin ans cos on one graph')
