% Crtanje fje 
x = 0:10*pi
y = 0:10*pi

[x,y]=meshgrid(x,y)
z = [cos(x)+cos(x)]+[sin(x)*sin(x)*sin(x)]
subplot(311)
surf(x,y,z)
hold on
subplot(312)
mesh(x,y,z)
subplot(313)
contour(x,y,z)