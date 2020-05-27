%% Jacobi Method
function x=jacobi(A,B,max_iterations)

    D = diag(diag(A));
    L = tril(A,-1);
    U = triu(A,1);
    M=D;
    N= (-L -U);
    d = det(A);
    A_length = length(A);
    if (d == 0 )||(domdiag(A, 'strict')==0)
        disp("La matrice A ne converge pas")
        return;
    end

    % Initialisation
    n=size(B,1);
    iteration=0;
    E(1:n) = 0.001;
    x = zeros(n, 1);
    null = zeros(n, 1);
    E = E.' ;

    % On boucle à la fois sur l'erreur commise et sur le nombre maximal
    % d'itérations
    while find((abs((A*x)-B) > E)~= null) & iteration < max_iterations
        x_old=x;

        for i=1:n
            sigma=0;

            for j=1:n
                if j~=i
                    sigma=sigma+A(i,j)*x_old(j);
                end
            end

            x(i)=(1/A(i,i))*(B(i)-sigma);
        end

        iteration=iteration+1;
    end