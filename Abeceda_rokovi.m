%Napisati program koji unosi proizvoljnu matricu sa tastature i od matrice
%pravi niz. Od navedenog niza svaki broj zamijeniti slovom koji odgovara
%navedenom mjestu u abecedi. U slucaju da je broj veci od 26 onda ispisati
%sa velikim slovima po istom redoslijedu
clear  % Uklanja sve varijable iz workspace-a

% Definiranje niza s abecedom (velikim i malim slovima)
abeceda = ['a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z' ...
           'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'K' 'L' 'M' 'N' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'W' 'X' 'Y' 'Z'];

% Unos broja redova i kolona za matricu
red = input('Unesite broj redova:');  % Unos broja redova
kolona = input('Unesite broj kolona:');  % Unos broja kolona

% Unos elemenata matrice
for i = 1:red
    for j = 1:kolona
        matrica(i, j) = input('Unesite element matrice: ');  % Unos elementa matrice
    end
end

% Izračunavanje veličine niza
velicina_niza = red * kolona;  % Izračunava ukupni broj elemenata u matrici
k = 1;  % Inicijalizacija brojača za pristup elementima matrice

% Pretvaranje matrice u niz
for i = 1:red
    for j = 1:kolona
        niz(k) = matrica(i, j);  % Prebacuje elemente matrice u niz
        k = k + 1;  % Povećava brojač za pristup sljedećem elementu niza
    end
end

% Ispisivanje elemenata niza
disp('ISPISUJEM NIZ!')  % Ispisuje poruku
for i = 1:velicina_niza
    disp(niz(i));  % Ispisuje svaki element niza
end

% Mapiranje elemenata niza na slova abecede
for i = 1:velicina_niza
    k = niz(i);  % Uzima element niza
    novi_niz(i) = abeceda(k);  % Mapira broj na odgovarajuće slovo abecede
end

% Ispisivanje elemenata novog niza
for i = 1:velicina_niza
    disp(novi_niz(i));  % Ispisuje svaki element novog niza (slovo abecede)
end