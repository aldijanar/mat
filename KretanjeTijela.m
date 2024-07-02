clearvars
clc

x = [0 1 1 0];
y = [1 1 2 2];
oblik = patch(x,y,'red');

x = [0 8 8 0];
y = [0 0 1 1];
patch(x,y,'blue')

axis([0 8 0 8])
pause

x1 = [0 1 1 0];
y1 = [1 1 2 2];

for i=1:90
    
    x1 = x1+7/90;
      
    set(oblik,'x',x1,'y',y1)

    pause(0.5/90)
    
      
end
for i=1:60
    
    x1 = x1-7/60;

    set(oblik,'x',x1,'y',y1)
    pause(0.5/60)
      
end

    
    




