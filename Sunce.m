%% sunce
clc  % Čisti komandni prozor
clearvars  % Uklanja sve varijable iz workspace-a

% Definiranje kružnice
t = 0:0.1:2*pi;  % Definira niz vrijednosti od 0 do 2*pi s korakom 0.1
x = sin(t);  % Računa x koordinate kružnice
y = cos(t);  % Računa y koordinate kružnice
patch(x, y, 'yellow')  % Crta žuti krug

grid on  % Uključuje mrežu
axis([-3 3 -3 3])  % Postavlja granice osi na [-3, 3] za obje osi

% Definiranje trokuta
x = [1.5 2.5 1.5];  % x koordinate vrhova trokuta
y = [-0.5 0 0.5];  % y koordinate vrhova trokuta
deg = 45;  % Početni kut rotacije
trokut = zeros();  % Inicijalizira niz za pohranu handle-ova trokuta

% Kreiranje i rotiranje osam trokuta
for i = 1:8   
    trokut(i) = patch(x, y, 'yellow');  % Crta trokut i sprema handle u niz
    rotate(trokut(i), [0 0 1], deg)  % Rotira trokut za 'deg' stupnjeva oko osi z
    deg = deg + 45;  % Povećava kut za 45 stupnjeva za sljedeći trokut
end

% Rotacija svih trokuta oko središta
for i = 1:240
    rotate(trokut, [0 0 1], 1)  % Rotira sve trokute za 1 stupanj oko osi z
    pause(1/240)  % Pauzira izvršenje na 1/240 sekunde za efekt glatke animacije
end


% 
% p = patch([0 0 20 20 0], [0 40 40 0 0], 'red');
% axis ([-60 60 -60 60])
% 
%  for i=1:480
% rotate(p, [0 1 0], 2, [0 0 0])
% pause(1/240)
% end
%  



% x = [0 0 1 1];
% y = [0.25 -0.25 -0.25 0.25];
% kazaljka = patch(x,y,'red');
% 
% 
% for i=1:180
%     rotate(kazaljka, [0 0 1], 10, [0 0 0]) 
%     pause(1/30)
% end