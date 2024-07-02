t = 0:0.1:2*pi;
x = [-2 2 2 -2];
y = [-8 -8 2 2];
patch(x,y,'k')
hold on

x = sin(t);
y = cos(t);
crveno = patch(x,y,'red');

axis([-10 10 -10 10])

pause(2) 

x = sin(t);
y = cos(t)-3;
zuto = patch(x,y,'yellow');

pause(2)

delete(crveno)
delete(zuto)

% set(crveno,'x',100,'y',100)


x = sin(t);
y = cos(t)-6;
zeleno = patch(x,y,'green');
