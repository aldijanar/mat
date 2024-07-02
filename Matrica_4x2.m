%% Matrica 4x2
clc  % Čisti komandni prozor
clear all  % Uklanja sve varijable iz workspace-a

% Unos brojeva u niz
for i = 1:8
    niz(i) = input('Unesite broj: ');  % Unos broja i pohranjivanje u niz
end

% Provjera jedinstvenosti drugog elementa
while niz(2) == niz(1)
    niz(2) = input('Ponavljam upis drugog elementa: ');  % Ponovni unos drugog elementa ako je jednak prvom
end

% Provjera jedinstvenosti trećeg elementa
while niz(3) == niz(2) || niz(3) == niz(1)
    niz(3) = input('Ponavljam upis treceg elementa: ');  % Ponovni unos trećeg elementa ako je jednak bilo kojem od prethodnih
end

% Provjera jedinstvenosti četvrtog elementa
while niz(4) == niz(3) || niz(4) == niz(2) || niz(4) == niz(1)
    niz(4) = input('Ponavljam upis cetvrtog elementa: ');  % Ponovni unos četvrtog elementa ako je jednak bilo kojem od prethodnih
end

% Provjera jedinstvenosti petog elementa
while niz(5) == niz(4) || niz(5) == niz(3) || niz(5) == niz(2) || niz(5) == niz(1)
    niz(5) = input('Ponavljam upis petog elementa: ');  % Ponovni unos petog elementa ako je jednak bilo kojem od prethodnih
end

% Provjera jedinstvenosti šestog elementa
while niz(6) == niz(5) || niz(6) == niz(4) || niz(6) == niz(3) || niz(6) == niz(2) || niz(6) == niz(1)
    niz(6) = input('Ponavljam upis sestog elementa: ');  % Ponovni unos šestog elementa ako je jednak bilo kojem od prethodnih
end

% Sortiranje niza u opadajućem redoslijedu
B = sort(niz, 'descend');  % Sortira niz u opadajućem redoslijedu

% Popunjavanje matrice 4x2 elementima iz sortiranog niza
k = 1;  % Inicijalizacija brojača za pristup elementima niza
for i = 1:4
    for j = 1:2
        matrica(i, j) = B(k);  % Popunjava matricu elementima iz sortiranog niza
        k = k + 1;  % Povećava brojač za pristup sljedećem elementu niza
    end
end
