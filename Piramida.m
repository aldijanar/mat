%Nacrtati piramidu

clear all
clc
axis([-5 5 -5 5 -5 5])
grid on
x = [0 3 3 0];
y = [0 0 3 3];
z = [0 0 0 0];
patch(x,y,z)
hold on
x = [0 3 1.5];
y = [0 0 1.5];
z = [0 0 4];
patch(x,y,z,'red')
x = [0 0 1.5];
y = [3 0 1.5];
z = [0 0 4];
patch(x,y,z,'y')
x = [0 3 1.5];
y = [3 3 1.5];
z = [0 0 4];
patch(x,y,z,'g')
x = [3 3 1.5];
y = [3 0 1.5];
z = [0 0 4];
patch(x,y,z,'m')
xlabel('x-osa');
ylabel('y-osa');
zlabel('z-osa');