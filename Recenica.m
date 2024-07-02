%recenica
clearvars
clc

recenica = input('Unesite recenicu: ','s');
duzina = length(recenica);

for i=duzina:-1:1
      disp(recenica(i))  
end

k = 1;
brojac = 0;
niz=zeros();

for i=1:duzina
    if recenica(i) == ' '
        brojac = 0;
        k = k+1;
    end
    if recenica(i) == 'a' 
        brojac = brojac+1;
    end
    if recenica(i) == 'e' 
        brojac = brojac+1;
    end
    if recenica(i) == 'i' 
        brojac = brojac+1;
    end
    if recenica(i) == 'o' 
        brojac = brojac+1;
    end
    if recenica(i) == 'u' 
        brojac = brojac+1;
    end
    
        niz(k) = brojac;
end

disp(niz)


        
       



    
