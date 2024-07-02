% Postavljanje frekvencije uzorkovanja na 44,000 Hz
fs = 44000;

% Definiranje normaliziranih frekvencija za propusni i zaporni opseg
Wp = 2 * 1000 / fs; % Normalizirana frekvencija propusnog opsega (1 kHz)
Ws = 2 * 1300 / fs; % Normalizirana frekvencija zapornog opsega (1.3 kHz)

% Definiranje tolerancija za propusni i zaporni opseg
Rp = 1;  % Maksimalna valovitost u propusnom opsegu (dB)
Rs = 40; % Minimalno prigušenje u zapornom opsegu (dB)

% Definiranje parametara niskopropusnog filtra pomoću 'fdesign.lowpass' funkcije
d = fdesign.lowpass('Fp,Fst,Ap,Ast', Wp, Ws, Rp, Rs);

% Dizajniranje filtra pomoću Chebyshev tipa II metode
f = design(d, 'cheby2');

% Prikaz informacija o dizajniranom filtru
info(f)

% Vizualizacija frekvencijskog odziva filtra pomoću 'fvtool'
fvtool(f)

% Učitavanje audio signala iz datoteke 'bell.wav'
[Y, fs] = audioread('bell.wav');

% Definiranje vremenskog vektora za prikaz signala
t = 0:1/fs:1/fs*(length(Y)-1);

% Plotanje ulaznog audio signala
figure;
subplot(2,2,1);
plot(t, Y)
xlabel('Vrijeme [s]')
ylabel('Amplituda')
title('Ulazni signal u vremenskom domenu')
hold on

% Filtriranje ulaznog signala pomoću dizajniranog filtra
izlaz = filter(f, Y);

% Plotanje filtriranog signala
plot(t, izlaz, 'r-')
legend('Ulazni signal', 'Filtrirani signal')
hold off

% Izračunavanje Fourier-ove transformacije ulaznog signala
Y_fft = fft(Y);
n = length(Y);
f = (0:n-1)*(fs/n); % Frekvencijski vektor
amplitude = abs(Y_fft)/n;

% Plotanje spektra ulaznog signala
subplot(2,2,2);
plot(f, amplitude)
xlabel('Frekvencija [Hz]')
ylabel('Amplituda')
title('Spektar ulaznog signala')
xlim([0 2000])

% Izračunavanje Fourier-ove transformacije filtriranog signala
izlaz_fft = fft(izlaz);
amplitude_filtrirani = abs(izlaz_fft)/n;

% Plotanje spektra filtriranog signala
subplot(2,2,4);
plot(f, amplitude_filtrirani)
xlabel('Frekvencija [Hz]')
ylabel('Amplituda')
title('Spektar filtriranog signala')
xlim([0 2000])

%% 1 
% Program upisuje 12 brojeva koji moraju biti razliciti. sortirani u 4X3 
niz=[];
brojac=0;
while brojac < 12
broj=input('Unesi broj: ');
if ismember (broj, niz)
    disp('Upisali ste već taj broj, molimo unesite drugi'); 
else
    niz = [niz broj];
    brojac =brojac+1;
end
end
sortirani_niz=sort (niz, 'descend');
matrica=reshape(sortirani_niz, 3, 4)';
disp('Vasa matrica je:')
disp(matrica)
%% 2 
% Inicijalizacija brojača za ocjene
broj_sestica = 0;
broj_sedmica = 0;
broj_osmica = 0;
broj_devetki = 0;
broj_desetki = 0;

% Unos broja studenata
n = input('Unesite broj studenata: ');

for i = 1:n
    % Unos podataka za svakog studenta
    ime = input('Unesite ime studenta: ', 's');
    prezime = input('Unesite prezime studenta: ', 's');
    ocjena = input('Unesite ocjenu studenta (6-10): ');
    
    % Provjera ocjene i prebrojavanje
    switch ocjena
        case 6
            broj_sestica = broj_sestica + 1;
        case 7
            broj_sedmica = broj_sedmica + 1;
        case 8
            broj_osmica = broj_osmica + 1;
        case 9
            broj_devetki = broj_devetki + 1;
        case 10
            broj_desetki = broj_desetki + 1;
        otherwise
            fprintf('Unesena je pogrešna ocjena za studenta %s %s\n', ime, prezime);
    end
end

% Ispis rezultata
fprintf('Broj studenata sa ocjenom 6: %d\n', broj_sestica);
fprintf('Broj studenata sa ocjenom 7: %d\n', broj_sedmica);
fprintf('Broj studenata sa ocjenom 8: %d\n', broj_osmica);
fprintf('Broj studenata sa ocjenom 9: %d\n', broj_devetki);
fprintf('Broj studenata sa ocjenom 10: %d\n', broj_desetki);

%% 3
p=[1 0 5 3 -2]
q=[1 -2 1]
mn = conv(p,q);
[v, o] = deconv(p,q)
der = polyder(p)
int = polyint(q)
valx1 = polyval(p,1)
valx2 = polyval(p,2)
valx11 = polyval(q,1)
valx22 = polyval(q,2)
%% 4
clear all
clc

% Definisanje funkcija pomoću function handle
f1 = @(x) sin(x);
f2 = @(x) x.^2;

% Definisanje domena
x = linspace(-2*pi, 2*pi, 100);

% Evaluacija funkcija na domeni
y1 = f1(x);
y2 = f2(x);

% Kreiranje subplota za funkciju sin(x)
figure;

subplot(2,2,1);
plot(x, y1);
title('Plot sin(x)');
xlabel('x');
ylabel('sin(x)');

subplot(2,2,2);
stem(x, y1);
title('Stem sin(x)');
xlabel('x');
ylabel('sin(x)');

subplot(2,2,3);
bar(x, y1);
title('Bar sin(x)');
xlabel('x');
ylabel('sin(x)');

subplot(2,2,4);
scatter(x, y1);
title('Scatter sin(x)');
xlabel('x');
ylabel('sin(x)');

% Kreiranje nove figure za funkciju x^2
figure;

subplot(2,2,1);
plot(x, y2);
title('Plot x^2');
xlabel('x');
ylabel('x^2');

subplot(2,2,2);
stem(x, y2);
title('Stem x^2');
xlabel('x');
ylabel('x^2');

subplot(2,2,3);
bar(x, y2);
title('Bar x^2');
xlabel('x');
ylabel('x^2');

subplot(2,2,4);
scatter(x, y2);
title('Scatter x^2');
xlabel('x');
ylabel('x^2');
%% %%%%%%%%%%%%%%%%%
% 1 
% Unos broja u centimetrima
X = input('Unesite broj u centimetrima: ');

% Unos željene mjerne jedinice
unit = input('Unesite željenu mjernu jedinicu (inch, m, cm, mm, dm): ', 's');

% Pretvaranje i ispisivanje rezultata
switch unit
    case 'inch'
        convertedValue = X / 2.54; % Pretvaranje iz cm u inch
        fprintf('%0.2f cm je %0.2f inch.\n', X, convertedValue);
    case 'm'
        convertedValue = X / 100; % Pretvaranje iz cm u metar
        fprintf('%0.2f cm je %0.2f metar.\n', X, convertedValue);
    case 'cm'
        convertedValue = X; % Ostaje u cm
        fprintf('%0.2f cm je %0.2f cm.\n', X, convertedValue);
    case 'mm'
        convertedValue = X * 10; % Pretvaranje iz cm u mm
        fprintf('%0.2f cm je %0.2f mm.\n', X, convertedValue);
    case 'dm'
        convertedValue = X / 10; % Pretvaranje iz cm u dm
        fprintf('%0.2f cm je %0.2f decimetar.\n', X, convertedValue);
    otherwise
        fprintf('Nepoznata mjerna jedinica.\n');
end
%% 2
% Definiranje niza A
A = [1, 2, 6, 1, 7, 3];

% Definiranje niza B
B = [-1, 2, 3, 9, 0];

% Funkcija setdiff(A, B) vraća elemente iz niza A koji se ne nalaze u nizu B
I = setdiff(A, B);

% Funkcija union(A, B) vraća uniju elemenata iz nizova A i B, bez ponavljanja
C = union(A, B);

% Funkcija unique(A) vraća jedinstvene elemente iz niza A, uklanjajući duplikate
D = unique(A);

% Funkcija intersect(A, B) vraća zajedničke elemente iz nizova A i B
E = intersect(A, B);

% Funkcija setxor(A, B) vraća elemente koji su u A ili B, ali ne u oba (simetrična razlika)
F = setxor(A, B);

% Funkcija ismember(A, 2) provjerava da li je broj 2 član niza A; vraća niz logičkih vrijednosti
G = ismember(A, 2);

%% 3
clear all
clc

% Definisanje n
n = input('Unesite n (4 < n < 12): ');

% Provera da li je n u odgovarajućem opsegu
if n <= 4 || n >= 12
    error('n mora biti između 4 i 12.');
end

% Inicijalizacija matrice A
A = zeros(2*n, n);

% Popunjavanje matrice A prema zadatim uslovima
for i = 1:2*n
    for j = 1:n
        if i - j < 0
            A(i, j) = i^2 + 3;
        elseif i == j
            A(i, j) = i - 8;
        elseif i > j + 1
            A(i, j) = 3*i - 2*j;
        elseif i == j + 1
            A(i, j) = i - 2*j;
        end
    end
end

% Formiranje vektora Bk od parnih kolona matrice A
Bk = A(:, 2:2:end);

% Izračunavanje sume elemenata svih neparnih vrsta matrice A
suma_neparnih_vrsta = sum(A(1:2:end, :), 'all');

% Pronalaženje maksimalnog elementa u matrici A i njegove pozicije
[max_val, linear_idx] = max(A(:));
[row, col] = ind2sub(size(A), linear_idx);

% Ispis rezultata
disp('Matrica A:');
disp(A);

disp('Vektor Bk (parne kolone matrice A):');
disp(Bk);

fprintf('Suma elemenata svih neparnih vrsta matrice A: %d\n', suma_neparnih_vrsta);

fprintf('Maksimalni element u matrici A: %d\n', max_val);
fprintf('Pozicija maksimalnog elementa: (%d, %d)\n', row, col);
%% 4
clear all
clc

% Definisanje domena i evaluacija funkcija
% Funkcija a
t1 = linspace(0, 2*pi, 1000);
x1 = 4*cos(t1).^3;
y1 = 4*sin(t1).^3;

% Funkcija b
x2 = linspace(0, 10, 1000);
y2 = sqrt(x2) .* cos((1/3)*x2);

% Funkcija c
t3 = linspace(0, 30, 1000);
x3 = t3;
y3 = t3 .* cos(t3);
z3 = t3 .* sin(t3);

% Funkcija d
t4 = linspace(0, 6*pi, 1000);
x4 = sin(t4);
y4 = cos(t4);
z4 = t4;

% Prikazivanje funkcija pomoću figure i pause
figure;
plot(x1, y1);
title('Funkcija a: x = 4cos^3(t), y = 4sin^3(t)');
xlabel('x');
ylabel('y');
pause;

figure;
plot(x2, y2);
title('Funkcija b: y = sqrt(x) * cos(1/3x)');
xlabel('x');
ylabel('y');
pause;

figure;
plot3(x3, y3, z3);
title('Funkcija c: x = t, y = tcos(t), z = tsin(t)');
xlabel('x');
ylabel('y');
zlabel('z');
grid on;
pause;

figure;
plot3(x4, y4, z4);
title('Funkcija d: x = sin(t), y = cos(t), z = t');
xlabel('x');
ylabel('y');
zlabel('z');
grid on;
pause;

% Prikazivanje funkcija pomoću subplot
figure;

subplot(2, 2, 1);
plot(x1, y1);
title('Funkcija a: x = 4cos^3(t), y = 4sin^3(t)');
xlabel('x');
ylabel('y');

subplot(2, 2, 2);
plot(x2, y2);
title('Funkcija b: y = sqrt(x) * cos(1/3x)');
xlabel('x');
ylabel('y');

subplot(2, 2, 3);
plot3(x3, y3, z3);
title('Funkcija c: x = t, y = tcos(t), z = tsin(t)');
xlabel('x');
ylabel('y');
zlabel('z');
grid on;

subplot(2, 2, 4);
plot3(x4, y4, z4);
title('Funkcija d: x = sin(t), y = cos(t), z = t');
xlabel('x');
ylabel('y');
zlabel('z');
grid on;
