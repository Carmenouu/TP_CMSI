A=[-5 8 5;3 4 1;2 3 0];
B=[5 3 2]';

fprintf("Méthode Jacobi :\n");
disp(jacobi(A,B,100));
fprintf("Méthode Gauss Seidel :\n");
disp(GaussSeidel(A,B,100));