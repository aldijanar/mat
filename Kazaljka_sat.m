clc
clearvars

r = 0:0.1:2*pi;
x = sin(r)+5;help
y = cos(r)+5;

patch(x,y,'yellow')
x = [5 5 6 6];
y = [4.9 5.1 5.1 4.9];
kazaljka = patch(x,y,'red');

x1 = x;
y1 = y;
smjer = [0 0 1];

pause
for i=1:180
    rotate(kazaljka,smjer,-6)
    pause(1/30)
end
    
