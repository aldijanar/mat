%% Matrica
clear
clc

red = input('Unesite broj redova')
kolona = input('Unesite broj kolona')

for i=1:red
    for j=1:kolona
        matrica(i,j)=input('Unesite element matrice')
    end
end
disp('Dijagonalna matrica:')
diag(matrica)
disp('Inverzna matrica:')
inv(matrica)
disp('Gornja trougaona:')
triu(matrica)
disp('Donja trougaona:')
tril(matrica)

