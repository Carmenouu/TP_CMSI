function evolution()
% matrice du Laplacien
P_matrix(500:500) = 0;
% conditions initiales de température
B(1:500) = 0;
B = B.';

% Calcul de la matrice du Laplacien et des conditions initiales
I=[5,21];
J=[5;22];
K=[6;21];
L=[6;22];
M=[15;10];
N=[15;11];
O=[16;10];
P=[16;11];


% Conditions initiales de température

%Pour les 500 points, donc pour chaque ligne de P
index = 1;
for i = 1:20
    for j = 1:25
        %On test si le point est sur les bords
        if((i==1) || (i==20) || ((i==10 || i==11) && j<=13) || (i<=11 && j==25))
            B(index) = 100;
        %On test si le point est un des points de chaleur
        elseif((i==I(1)&&j==I(2)) || (i==J(1)&&j==J(2)) || (i==K(1)&&j==K(2)) || (i==L(1)&&j==L(2)) || (i==M(1)&&j==M(2)) || (i==N(1)&&j==N(2)) || (i==O(1)&&j==O(2)) || (i==P(1)&&j==P(2)))
            B(index) = 500;
        end
        index = index +1;
    end
end


% Matrice du Laplacien

%Pour les 500 points, donc pour chaque ligne de P
index = 1;
for i = 1:20
    for j = 1:25
        % On test si le point est dans les coins : 2 voisins
        if(i==1 && j==1)
            P_matrix(index, index) = -2;
            P_matrix(index, index+1) = 1;
            P_matrix(index, index+24) = 1;
        elseif (i==1 && j==25)
            P_matrix(index, index) = -2;
            P_matrix(index, index-1) = 1;
            P_matrix(index, index+24) = 1;
        elseif (i==20 && j==1) 
            P_matrix(index, index) = -2;
            P_matrix(index, index+1) = 1;
            P_matrix(index, index-24) = 1;
        elseif (i==20 && j==25)
            P_matrix(index, index) = -2;
            P_matrix(index, index-1) = 1;
            P_matrix(index, index-24) = 1;
        %On test si on est sur les bords
        %Bord haut : 3 voisins
        elseif(i==1)
            P_matrix(index,index) = -3;
            P_matrix(index,index+1)= 1;
            P_matrix(index,index+25)= 1;
            P_matrix(index,index-1)= 1;
        %Bord bas : 3 voisins
        elseif(i==20)
            P_matrix(index,index) = -3;
            P_matrix(index,index+1)= 1;
            P_matrix(index,index-25)= 1;
            P_matrix(index,index-1)= 1;
        %Sur les bords gauches haut : pointill�s voisins
        elseif (j==1 && i<10)
            P_matrix(index,index) = -4;
            P_matrix(index,index+18)= 1;
            P_matrix(index,index+1)= 1;
            P_matrix(index,index+25)= 1;
            P_matrix(index,index-25)= 1;
        %Sur les bords gauches bas : bord droit voisins
        elseif (j==1 && i>11)
            P_matrix(index,index) = -4;
            P_matrix(index,index+24)= 1;
            P_matrix(index,index+1)= 1;
            P_matrix(index,index+25)= 1;
            P_matrix(index,index-25)= 1;
        %Autres points du bord gauche : seulement 3 voisins
        elseif (j==1)
            P_matrix(index,index) = -3;
            P_matrix(index,index+1)= 1;
            P_matrix(index,index+25)= 1;
            P_matrix(index,index-25)= 1;
        %Sur les bords droits bas: bord gauche bas voisins
        elseif(j==25 && i>11)
            P_matrix(index,index) = -4;
            P_matrix(index,index-24)= 1;
            P_matrix(index,index-1)= 1;
            P_matrix(index,index+25)= 1;
            P_matrix(index,index-25)= 1;
        %Autres points du bord gauche : seulement 3 voisins
        elseif(j==25)
            P_matrix(index,index) = -3;
            P_matrix(index,index-1)= 1;
            P_matrix(index,index+25)= 1;
            P_matrix(index,index-25)= 1;
        %Sur les pointill�s
        elseif(j==19 && i<=10)
            P_matrix(index,index) = -5;
            P_matrix(index,index-18)= 1;
            P_matrix(index,index-1)= 1;
            P_matrix(index,index+1)= 1;
            P_matrix(index,index+25)= 1;
            P_matrix(index,index-25)= 1;
        %Sur le reste
        else
            P_matrix(index,index) = -4;
            P_matrix(index,index-1)= 1;
            P_matrix(index,index+1)= 1;
            P_matrix(index,index+25)= 1;
            P_matrix(index,index-25)= 1;
        end
        index = index +1;
    end
end

% pas et temps total en secondes
pas = 0.1;
temps = 100;

% exponentielle de la matrice A (du Laplacien)
expA = expm(pas*P_matrix);
figure("name","évolution de la température");
for i = 1:(temps/pas)
    B = expA*B;
    surf(reshape(B, 25,20))
    disp(i*pas)
    pause(pas)
end
