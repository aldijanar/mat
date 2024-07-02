%% komponenta
% u posebnu .m skriptu smo napravili ovu funkciju, koju cemo kasnije pozivati 

function [boja] = komponenta(slika, RGB) % naziv mora biti kao komponenta
boja = slika;
vel_u_pikselima = size(slika);
sirina = vel_u_pikselima(1);
visina = vel_u_pikselima(2);

if RGB == 'R'
    for i = 1:1:sirina
        for j = 1:1:visina
            boja(i,j,2) = 0;
            boja(i,j,3) = 0;
        end
    end
end

if RGB == 'G'
    for i = 1:1:sirina
        for j = 1:1:visina
            boja(i,j,1) = 0;
            boja(i,j,3) = 0;
        end
    end
end

if RGB == 'B'
    for i = 1:1:sirina
        for j = 1:1:visina
            boja(i,j,1) = 0;
            boja(i,j,2) = 0;
        end
    end
end


%% SLIKA RGB
% zatim pravimo drugu .m skriptu u kojoj primjenjujemo filter

% Čitanje slike
slika = imread('macka.jpeg');

% Izdvajanje RGB komponenti
crvena = komponenta(slika, 'R');
zelena = komponenta(slika, 'G');
plava = komponenta(slika, 'B');

% Definisanje filtera
h = [1 0 -1; 2 0 -2; 1 0 -1];

% Primjena filtera na cijelu crvenu komponentu slike
filtriranaCrvena = imfilter(crvena, h);

% Prikaz slika
figure(1);
imshow(crvena);
title('Crvena komponenta');

figure(2);
imshow(zelena);
title('Zelena komponenta');

figure(3);
imshow(plava);
title('Plava komponenta');

figure(4);
imshow(filtriranaCrvena);
title('Filtrirana crvena komponenta');

% Čuvanje slika
imwrite(crvena, 'MojaCrvena.jpg');
imwrite(zelena, 'MojaZelena.jpg'); % naziv proizvoljno
imwrite(plava, 'MojaPlava.jpg');
imwrite(filtriranaCrvena, 'MojaFiltriranaCrvena.jpg');

%% slika kroz filtere - subplot
% Učitavanje originalne slike
originalna_slika = imread('macka.jpeg');

% Filtriranje slika s različitim filterima
sobel_slika = imfilter(originalna_slika, fspecial('sobel'));
motion_slika = imfilter(originalna_slika, fspecial('motion', 15, 45));
log_slika = imfilter(originalna_slika, fspecial('log', 5, 0.5));
disk_slika = imfilter(originalna_slika, fspecial('disk', 5));
unsharp_slika = imfilter(originalna_slika, fspecial('unsharp'));

% Prikaz originalne slike i filtriranih slika
figure;

subplot(2, 3, 1);
imshow(originalna_slika);
title('Originalna slika');

subplot(2, 3, 2);
imshow(sobel_slika);
title('Sobel filter');

subplot(2, 3, 3);
imshow(motion_slika);
title('Motion filter');

subplot(2, 3, 4);
imshow(log_slika);
title('Log filter');

subplot(2, 3, 5);
imshow(disk_slika);
title('Disk filter');

subplot(2, 3, 6);
imshow(unsharp_slika);
title('Unsharp filter');

%% Iz knjige:

s=imread('buket.jpeg');
I=im2double(s);
subplot(3,2,1),imshow(I), title('Original');

H=fspecial('motion',30,60);
Motion=imfilter(I,H,'replicate');
subplot(3,2,2),imshow(Motion),title('Motion');


H=fspecial('sobel');
Sobel=imfilter(I,H,'replicate');
subplot(3,2,3),imshow(Sobel),title('Sobel');

H=fspecial('log',[30,100],0.2);
Log=imfilter(I,H,'replicate');
subplot(3,2,4),imshow(Log),title('Log');

H=fspecial('disk',20);
Disk=imfilter(I,H,'replicate');
subplot(3,2,5),imshow(Disk),title('Disk');

H=fspecial('unsharp');
Unsharp=imfilter(I,H,'replicate');
subplot(3,2,6),imshow(Unsharp),title('Unsharp');

%% original i rgb u odg folderima
clc
close all
clear all

% Naziv slike
imageName = 'macka.jpeg';

% Učitavanje slike
if exist(imageName, 'file') == 2
    originalImage = imread(imageName);

    % Nazivi foldera i nazivi fajlova za komponente
    folderNames = {'OriginalImage', 'RedComponent', 'GreenComponent', 'BlueComponent'};
    componentNames = {'original_image.png', 'red_component.png', 'green_component.png', 'blue_component.png'};

    % Kreiranje foldera ako ne postoje
    for i = 1:numel(folderNames)
        if ~exist(folderNames{i}, 'dir')
            mkdir(folderNames{i});
        end
    end

    % Sačuvaj originalnu sliku u posebnom folderu
    imwrite(originalImage, fullfile(folderNames{1}, componentNames{1}));

    % Izdvajanjem komponenti boja i sačuvanjem slika
    components = {'R', 'G', 'B'};
    for i = 1:numel(components)
        % Kreiramo sliku sa samo jednom komponentom boje
        componentImage = originalImage;
        switch components{i}
            case 'R'
                componentImage(:, :, 2:3) = 0; % Zadržavamo samo crvenu
            case 'G'
                componentImage(:, :, [1, 3]) = 0; % Zadržavamo samo zelenu
            case 'B'
                componentImage(:, :, 1:2) = 0; % Zadržavamo samo plavu
        end
        % Sačuvaj komponentu boje
        imwrite(componentImage, fullfile(folderNames{i + 1}, componentNames{i + 1}));
        % Sačuvaj originalnu sliku u isti folder
        imwrite(originalImage, fullfile(folderNames{i + 1}, componentNames{1}));
    end

    disp('Slike su uspešno sačuvane u odgovarajuće foldere.');
else
    disp(['Slika "', imageName, '" nije pronađena. Molimo proverite naziv i lokaciju slike.']);
end
