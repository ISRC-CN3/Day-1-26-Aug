% Script asks user for a type of pizza & prints
mypick=menu('Pick a pizza','Cheese','Shroom','Sausage');
switch mypick
case 1
disp('Order a cheese pizza')
case 2
disp('Order a mushroom pizza')
case 3
disp('Order a sausage pizza')
otherwise
disp('No pizza for us today')
end