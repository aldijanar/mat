clc  % Čisti komandni prozor
clear all  % Uklanja sve varijable iz workspace-a

% Definiranje opsega vrijednosti za x i y osi
x = 0:0.1:4;  % Vektor vrijednosti za x os od 0 do 4 s korakom 0.1
y = 0:0.1:4;  % Vektor vrijednosti za y os od 0 do 4 s korakom 0.1

% Generiranje mreže točaka za površinski prikaz
[X, Y] = meshgrid(x, y);  % Kreira mrežu točaka za površinski prikaz

% Definiranje vrijednosti z koje će tvoriti ravninu
z = X;  % Postavljanje z vrijednosti jednako x vrijednostima

% Crtanje površine ravnine
surf(x, y, z)  % Crta 3D površinu koristeći x, y i z vrijednosti
hold on  % Zadržava trenutni graf tako da možemo dodati više elemenata

% Dodavanje oznaka na x os
xlabel('X')  % Postavlja oznaku za x os

% Postavljanje parametara za cilindar
R = 1;  % Polumjer cilindra
x0 = 2; y0 = 2; z0 = 0;  % Centar baze cilindra (x0, y0, z0)
h = 4;  % Visina cilindra

% Generiranje podataka za cilindar
[x, y, z] = cylinder(R);  % Generira koordinate cilindra s polumjerom R

% Pomicanje cilindra na željenu lokaciju
x = x + x0;  % Pomicanje cilindra u x smjeru
y = y + y0;  % Pomicanje cilindra u y smjeru
z = z * h + z0;  % Skaliranje cilindra u visinu (h) i pomicanje u z smjeru

% Crtanje cilindra
surf(x, y, z)  % Crta 3D površinu cilindra




