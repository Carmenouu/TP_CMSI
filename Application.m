function Application()
P_matrix(500:500) = 0;
B(1:500) = 0;
B = B.';
I=[5,21];
J=[5;22];
K=[6;21];
L=[6;22];
M=[15;10];
N=[15;11];
O=[16;10];
P=[16;11];

index = 1;
%Pour les 500 points, donc pour chaque ligne de P
for i = 1:20
    for j = 1:25
        %On test si le point est sur les bords
        if((i==1) || (i==20) || ((i==10 || i==11) && j<=13) || (i<=11 && j==25))
            B(index) = 100;
            P_matrix(index, index) = 1;
        %On test si le point est un des points de chaleur
        elseif((i==I(1)&&j==I(2)) || (i==J(1)&&j==J(2)) || (i==K(1)&&j==K(2)) || (i==L(1)&&j==L(2)) || (i==M(1)&&j==M(2)) || (i==N(1)&&j==N(2)) || (i==O(1)&&j==O(2)) || (i==P(1)&&j==P(2)))
            B(index) = 500;
            P_matrix(index,index) = 1;
        else
            %Sur les bords gauches haut : pointillés voisins
            if (j==1 && i<10)
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
            %Sur les bords droits: bord gauche bas voisins
            elseif(j==25)
                P_matrix(index,index) = -4;
                P_matrix(index,index-24)= 1;
                P_matrix(index,index-1)= 1;
                P_matrix(index,index+25)= 1;
                P_matrix(index,index-25)= 1;
            %Sur les pointillés
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
        end
        index = index +1;
    end
end

relaxation(P_matrix,B,10000)