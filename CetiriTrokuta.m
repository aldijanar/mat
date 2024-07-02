clear all
clc

%DONJI LIJEVI
x = [0 3 1.5]
y = [0 0 1.5]
z = [0 0 0]
prvi = patch(x,y,z)
hold on
%donji desni
x1 = [5 8 6.5]
y1 = [0 0 1.5]
z1 = [0 0 0]
drugi = patch(x1,y1,z1)
%gornji lijevi
x2 = [0 3 1.5]
y2 = [5 5 3.5]
z2 = [0 0 0]
treci = patch(x2,y2,z2)
%gornji desni
x3 = [5 8 6.5]
y3 = [5 5 3.5]
z3 = [0 0 0]
cetvrti = patch(x3,y3,z3)
pause
Xnovo = x
Ynovo = y
for i=0:4
    Xnovo = Xnovo+1
    Ynovo = Ynovo+1
    set(prvi,'x',Xnovo,'y',Ynovo)
    pause(1/4)
end

X1novo = x1
Y1novo = y1
for i=0:4
    X1novo = X1novo-1
    set(drugi,'x',X1novo,'y',Y1novo)
    pause(1/4)
end

X3novo = x3
Y3novo = y3
for i=0:4
    X3novo = X3novo-1
    set(cetvrti,'x',X3novo,'y',Y3novo)
    pause(1/4)
end

X2novo = x2
Y2novo = y2
for i=0:4
    X2novo = X2novo+1
    Y2novo = Y2novo-1
    set(treci,'x',X2novo,'y',Y2novo)
    pause(1/4)
end

rotate(prvi,[0 0 1],180,[8 5 0])
rotate(treci,[0 0 1],180,[8 0 0])










