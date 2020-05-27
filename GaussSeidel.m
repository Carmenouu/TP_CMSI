function x = GaussSeidel(A, B, max_iterations)

    % Initialisation
    n = size(A, 1);
    x = zeros(n, 1);
    iteration=0;
    E(1:n) = 0.001;
    E = E.' ;

    % On boucle à la fois sur l'erreur commise et sur le nombre maximal
    % d'itérations
    while abs((A*x) - B) > E & iteration < max_iterations
        x_old=x;

        for i=1:n

            sigma=0;

            for j=1:i-1
                    sigma=sigma+A(i,j)*x(j);
            end

            for j=i+1:n
                    sigma=sigma+A(i,j)*x_old(j);
            end

            x(i)=(1/A(i,i))*(B(i)-sigma);
        end
        
        iteration=iteration+1;
    end