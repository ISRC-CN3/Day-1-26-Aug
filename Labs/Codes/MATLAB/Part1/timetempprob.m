% This reads time and temperature data for an afternoon 
% from a file and plots the data
load timetemp.dat
% The times are in the first row, and temps in the second row
time = timetemp(1,:);
temp=timetemp(2,:);
% Plot the data and label the plo
plot(time,temp,'k+')
xlabel('Time')
ylabel('Temperature (degree Fahrenheit')
title('Temperatures in one afternoon')
