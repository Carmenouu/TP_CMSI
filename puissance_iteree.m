function [lambda1, v1] = puissance_iteree(A, nb_iterations, seuil)
n = size(A, 1);
y = ones(n, 1);

c = 0;
i = 1;
while i < nb_iterations & 1 - c > seuil
    x = y / norm(y);
    y = A*x;
    c = dot(x, y) / (norm(x) * norm(y));
    disp(c);
end


lambda1 = norm(y);
v1 = y / lambda1;