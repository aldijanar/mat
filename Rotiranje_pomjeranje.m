clc
clearvars
% 
% 
% x = [0 10 10 0];
% y = [0 0 2 2];
% patch(x,y,'red')
% axis([0 10 0 10])
% 
% pi = 0:0.1:2*pi;
% % x = sin(pi)+1;
% % y = cos(pi)+3;
% % x=[0 0.25 1.25 1.5 0.75];
% % y=[3 2 2 3 3.5];
% % oblik = patch(x,y,'red');
% 
% x1 = x;
% y1 = y;
% 
% % for i=1:5
% 
% n=1;
% 
% x=[0 0.25 1.25 1.5 0.75];
% y=[3 2 2 3 3.5];
% 
% for i=1:480
% 
% 
% 
% oblik = patch(x,y,'red');
%     
%      rotate(oblik,[0 0 1],-2,[n 2.75 0])
%     n=n+0.01;
%     pause(1/960)
% end
% % 
% % for i=1:480
% %     x1 = x1-0.01;
% %     set(oblik, 'x', x1)
% %     
% %     pause(1/960)
% % end
% % end
% 
% 
% 
% 
% 
x = [1 1 2 2];
y = [0 1 1 0];
g = hgtransform;
patch(x,y,'y','Parent',g)
axis equal
grid on

xlim([-10 10])
ylim([-10 10])


r1 = 0;
r2 = 2*pi/3;

pt1 = [1 2 3];
pt2 = [1 2 10];
pt3 = [1 20 10];
for t=linspace(0,1,100)
  g.Matrix = makehgtform('translate',[pt1*t pt2*t pt3*t]);%%%'zrotate',r1 + t*(r2-r1)
  drawnow
end
% We can easily add in scaling and rotating too.

