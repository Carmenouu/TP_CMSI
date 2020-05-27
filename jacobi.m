%% Jacobi Method
function x=jacobi(A,B,max_iterations)

    % Initialisation
    n=size(B,1);
    iteration=0;
    E(1:n) = 0.001;
    x = zeros(n, 1);
    E = E.' ;

    % On boucle à la fois sur l'erreur commise et sur le nombre maximal
    % d'itérations
    while abs((A*x) - B) > E & iteration < max_iterations
        xold=x;

        for i=1:n
            sigma=0;

            for j=1:n
                if j~=i
                    sigma=sigma+A(i,j)*x(j);
                end
            end

            x(i)=(1/A(i,i))*(B(i)-sigma);
        end

        iteration=iteration+1;
    end