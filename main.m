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

%evolution();

[lambda1, v1] = puissance_iteree(A, 1000, 1e-20);
[V, D] = eig(A);
disp(lambda1 - D(1, 1));
disp(v1 - [V(1, 1) V(2, 1) V(3, 1)]')