%% 1
function student_management()
    while true
        disp('Opcije:');
        disp('1. Unos podataka studenta');
        disp('2. Čitanje podataka iz datoteke');
        disp('3. Sortiranje studenata po prosjeku ocjena');
        disp('4. Izlaz');
        opcija = input('Izaberite opciju: ', 's');
       
        switch opcija
            case '1'
                unos_podataka_studenta();
            case '2'
                citanje_podataka();
            case '3'
                sortiranje_studenata();
            case '4'
                break;
            otherwise
                disp('Nepoznata opcija, pokušajte ponovo.');
        end
    end
end
 
function unos_podataka_studenta()
    ime = input('Unesite ime: ', 's');
    prezime = input('Unesite prezime: ', 's');
    adresa = input('Unesite adresu: ', 's');
   
    predmeti = cell(1, 5);
    ocjene = zeros(1, 5);
    for i = 1:5
        predmeti{i} = input(['Unesite naziv predmeta ' num2str(i) ': '], 's');
        ocjene(i) = input(['Unesite ocjenu za ' predmeti{i} ': ']);
    end
   
    prosjek = mean(ocjene);
   
    disp('Podaci studenta:');
    disp(['Ime: ' ime]);
    disp(['Prezime: ' prezime]);
    disp(['Adresa: ' adresa]);
    disp('Položeni predmeti i ocjene:');
    for i = 1:5
        disp([predmeti{i} ': ' num2str(ocjene(i))]);
    end
    disp(['Prosjek ocjena: ' num2str(prosjek)]);
   
    sacuvaj = input('Da li želite sačuvati podatke u datoteku? (Y/N): ', 's');
    if lower(sacuvaj) == 'y'
        fileID = fopen&#40;'Studenti.txt', 'a'&#41;;
        fprintf(fileID, '%s,%s,%s,', ime, prezime, adresa);
        for i = 1:5
            fprintf(fileID, '%s:%d,', predmeti{i}, ocjene(i));
        end
        fprintf(fileID, '%.2f\n', prosjek);
        fclose(fileID);
        disp('Podaci su sačuvani.');
    else
        disp('Podaci nisu sačuvani.');
    end
end
 
function citanje_podataka()
    fileID = fopen&#40;'Studenti.txt', 'r'&#41;;
    if fileID == -1
        disp('Datoteka ne postoji.');
        return;
    end
    while ~feof(fileID)
        linija = fgetl(fileID);
        disp(linija);
    end
    fclose(fileID);
end
 
function sortiranje_studenata()
    fileID = fopen&#40;'Studenti.txt', 'r'&#41;;
    if fileID == -1
        disp('Datoteka ne postoji.');
        return;
    end
   
    studenti = {};
    while ~feof(fileID)
        linija = fgetl(fileID);
        if ischar(linija)
            podaci = strsplit(linija, ',');
            ime = podaci{1};
            prezime = podaci{2};
            adresa = podaci{3};
            predmeti = podaci(4:8);
            prosjek = str2double(podaci{9});
            studenti{end+1} = struct('ime', ime, 'prezime', prezime, 'adresa', adresa, 'predmeti', {predmeti}, 'prosjek', prosjek);
        end
    end
    fclose(fileID);
   
    % Sortiranje po prosjeku ocjena
    prosjeci = cellfun(@(s) s.prosjek, studenti);
    [~, idx] = sort(prosjeci, 'descend');
    studenti = studenti(idx);
   
    % Prikaz sortiranih podataka
    for i = 1:length(studenti)
        disp(['Ime: ' studenti{i}.ime]);
        disp(['Prezime: ' studenti{i}.prezime]);
        disp(['Adresa: ' studenti{i}.adresa]);
        disp('Položeni predmeti i ocjene:');
        for j = 1:5
            disp(studenti{i}.predmeti{j});
        end
        disp(['Prosjek ocjena: ' num2str(studenti{i}.prosjek)]);
        disp('---');
    end
end
%% ?
clc
close all
clear
 
% Definiranje maksimalnog broja predmeta
MAX_PREDMETA = 5;
 
% Inicijalizacija strukture za studenta
student.ime = '';
student.prezime = '';
student.adresa = '';
student.predmeti = cell(1, MAX_PREDMETA);
student.ocjene = zeros(1, MAX_PREDMETA);
student.prosjek = 0;
 
% Unos podataka sa tastature
fprintf('Unesite podatke o studentu:\n');
student.ime = input('Ime: ', 's');
student.prezime = input('Prezime: ', 's');
student.adresa = input('Adresa: ', 's');
 
for i = 1:MAX_PREDMETA
    predmet = input(sprintf('Unesite ime %d. predmeta: ', i), 's');
    ocjena = input(sprintf('Unesite ocjenu za predmet %s: ', predmet));
    student.predmeti{i} = predmet;
    student.ocjene(i) = ocjena;
end
 
student.prosjek = mean(student.ocjene);
 
fprintf('\nPodaci o studentu:\n');
fprintf('Ime: %s\n', student.ime);
fprintf('Prezime: %s\n', student.prezime);
fprintf('Adresa: %s\n', student.adresa);
fprintf('Položeni predmeti i ocjene:\n');
for i = 1:MAX_PREDMETA
    fprintf('%s: %d\n', student.predmeti{i}, student.ocjene(i));
end
fprintf('Prosjek ocjena: %.2f\n', student.prosjek);
 
% Upit korisnika za spremanje podataka
odgovor = input('Želite li spremiti podatke u datoteku? (Y/N): ', 's');
if strcmpi(odgovor, 'Y')
    ime_datoteke = sprintf('%s_%s.txt', student.ime, student.prezime);
   
    % Otvaranje datoteke za pisanje
    fid = fopen&#40;ime_datoteke, 'w'&#41;;
   
    % Provjera da li je uspješno otvorena datoteka
    if fid == -1
        error('Nije moguće otvoriti datoteku za pisanje.');
    end
   
    % Spremanje podataka
    fprintf(fid, 'Podaci o studentu:\n');
    fprintf(fid, 'Ime: %s\n', student.ime);
    fprintf(fid, 'Prezime: %s\n', student.prezime);
    fprintf(fid, 'Adresa: %s\n', student.adresa);
    fprintf(fid, 'Položeni predmeti i ocjene:\n');
    for i = 1:MAX_PREDMETA
        fprintf(fid, '%s: %d\n', student.predmeti{i}, student.ocjene(i));
    end
    fprintf(fid, 'Prosjek ocjena: %.2f\n', student.prosjek);
   
    % Zatvaranje datoteke
    fclose(fid);
   
    fprintf('Podaci su uspješno spremljeni u datoteku %s.\n', ime_datoteke);
else
    fprintf('Podaci nisu spremljeni.\n');
end
