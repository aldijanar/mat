%Nacrtati x^2+y^2-z^2=-9

clear
clc
[x,y]=meshgrid(-10:0.5:10, -10:0.5:10);
z=sqrt(x.^2+y.^2+9)
surf(x,y,z);
hold on
z=-sqrt(x.^2+y.^2+9)
surf(x,y,z);



