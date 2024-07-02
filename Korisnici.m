clc
clearvars

% Unos broja korisnika
broj = input('Unesite broj korisnika: ');

% Inicijalizacija niza za imena korisnika
ime = strings(1, broj);
for i = 1:broj
    ime(1, i) = input('Unesite ime: ', 's');
end

% Izračunavanje očekivanog broja telefona
broj2 = 9 * broj;

% Inicijalizacija niza za brojeve telefona
brojTelefona = zeros(1, broj2);

% Unos brojeva telefona
for i = 1:broj2
    brojTelefona(i) = input('Unesite broj telefona: ');
end

% Inicijalizacija sume
suma = 0;

% Unos opcije
opcija = input('Unesite opciju (1 ili 2): ');
if opcija == 1
    for i = 1:9
        suma = suma + brojTelefona(i);
    end
elseif opcija == 2
    for i = 10:19
        suma = suma + brojTelefona(i);
    end
else
    disp('Neispravna opcija!'); % Ispis poruke o neispravnoj opciji
end

% Ispis rezultata
disp(['Zbroj brojeva telefona za opciju ', num2str(opcija), ' je: ', num2str(suma)]);
