A = [8 2 4; 
     4 9 3; 
     1 1 8];
B = [3 ;
    10 ;
    1];

fprintf("Méthode Jacobi :\n");
disp(jacobi(A,B,100));
fprintf("Méthode Gauss Seidel :\n");
disp(GaussSeidel(A,B,100));