%% 9 Unositi riječi upotrebom tastature sve dok se ne unese riječ koja počinje sa
% slovom 'i'a završava sa slovom 'd' te u sebi ima samo samoglasnike.Tu riječ treba
% pretvoriti u velika slova. Zatim sve unelene riječi napisati kao niz na način da
% svaki samoglasni bude ispisan velikim slovom osim zadnje riječi koja je već
% ispisana velikim slovima.Prebrojati unešene riječi.
rijeci = {};
samoglasnici = 'aeiou';
konacnaRijec = '';
brojac = 0;
while true
 rijec = input('Unesite riječ: ', 's');
 rijeci{end + 1} = rijec;
 brojac = brojac + 1;
 
 if startsWith(rijec, 'i') && endsWith(rijec, 'd')
 sredina = rijec(2:end-1);
 if all(ismember(sredina, samoglasnici))
 konacnaRijec = upper(rijec);
 rijeci{end} = konacnaRijec;
 break;
 end
 end
end
for i = 1:length(rijeci) - 1
 rijec = rijeci{i};
 for j = 1:length(rijec)
 if ismember(rijec(j), samoglasnici)
 rijec(j) = upper(rijec(j));
 end
 end
 rijeci{i} = rijec;
end
fprintf('Ukupan broj unesenih riječi: %d\n', brojac);
fprintf('Sve unijete riječi sa velikim samoglasnicima osim zadnje:\n');
disp(rijeci(1:end-1));
fprintf('Zadnja riječ:\n%s\n', konacnaRijec);

%% 13 Unijeti tekst sa tastature i provjeriti koliko u njemu ima slogova 'sni' i
% na kojim indeksima se ponavlja. Pronaći koliko taj tekst sadrži praznih mjesta i
% na kojim indeksima se nalaze. Provjeriti koliko u tekstu ima rečenica te
% koliko ima upitnih, uzvičnih i izjavnih, i ispisati broj riječi u tekstu.
tekst = input('Unesite tekst: ', 's');
% Pronalazak svih pojavljivanja sloga 'sni'
slog = 'sni';
slogIndeksi = strfind(tekst, slog);
brojSlogova = length(slogIndeksi);
% Pronalazak svih pojavljivanja praznih mjesta
praznaMjesta = find(tekst == ' ');
brojPraznihMjesta = length(praznaMjesta);
% Brojanje rečenica
recenice = regexp(tekst, '[.!?]', 'split');
brojRecenica = length(recenice) - 1;
% Brojanje upitnih, uzvičnih i izjavnih rečenica
brojUpitnih = length(find(tekst == '?'));
brojUzvicnih = length(find(tekst == '!'));
brojIzjavnih = length(find(tekst == '.'));
% Brojanje riječi u tekstu
rijeci = strsplit(tekst);
brojRijeci = length(rijeci);
% Ispis rezultata
fprintf('Broj pojavljivanja sloga ''sni'': %d\n', brojSlogova);
fprintf('Indeksi pojavljivanja sloga ''sni'': ');
disp(slogIndeksi);
fprintf('Broj praznih mjesta: %d\n', brojPraznihMjesta);
fprintf('Indeksi praznih mjesta: ');
disp(praznaMjesta);
fprintf('Broj rečenica: %d\n', brojRecenica);
fprintf('Broj upitnih rečenica: %d\n', brojUpitnih);
fprintf('Broj uzvičnih rečenica: %d\n', brojUzvicnih);
fprintf('Broj izjavnih rečenica: %d\n', brojIzjavnih);
fprintf('Broj riječi u tekstu: %d\n', brojRijeci);

%% Najduza rijec u recenici, ispis naopako u recenici nazad
% Čitanje rečenice
recenica = input('Unesite rečenicu: ', 's');

% Razdvajanje rečenice na reči uz uzimanje u obzir interpunkcijskih znakova
rijeci = regexp(recenica, '\s+', 'split');  % Razdvaja po razmacima, tabulatorima i ostalim prazninama

% Uklanja interpunkcijske znakove s kraja riječi
rijeci = regexprep(rijeci, '[^\w\s]', '');

% Pronalaženje najduže reči
najduza_rijec = '';
for i = 1:numel(rijeci)
    if numel(rijeci{i}) > numel(najduza_rijec)
        najduza_rijec = rijeci{i};
    end
end

% Ispis najduže reči unazad
fprintf('Najduža riječ: %s\n', najduza_rijec);

% Ispis najduže riječi u obrnutom redoslijedu
fprintf('Obrnut redoslijed: %s\n', flip(najduza_rijec));

% Zamena najduže reči u rečenici
nova_recenica = strrep(recenica, najduza_rijec, flip(najduza_rijec));

% Ispis nove rečenice
fprintf('Nova rečenica: %s\n', nova_recenica);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
