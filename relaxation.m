function x = relaxation(A, B, max_iterations)

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
    n = size(A, 1);
    x = zeros(n, 1);
    xi = zeros(n, 1);
    iteration=0;
    E(1:n) = 0.001;
    null = zeros(n, 1);
    E = E.' ;
    min_rayon_spectral = inf;
    optimized_omega = 1;
    
    % Calcul de Omega
    for i = 0:200
        omega = i/100;
        pi = inv( D + omega*L ) * ( ( 1 - omega)*D - omega * U );
        rayon_spectral = max(abs(eig(pi)))
        if rayon_spectral < min_rayon_spectral
            min_rayon_spectral = rayon_spectral;
            optimized_omega = omega;
        end
    end

    % On boucle à la fois sur l'erreur commise et sur le nombre maximal
    % d'itérations
    while find((abs((A*xi)-B) > E)~= null) & iteration < max_iterations
        x_old=x;
        xi_old = xi;

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
        
        gi = x;
        xi = (1 - optimized_omega)* xi_old + optimized_omega*gi;
    end
    
    disp(xi)
    figure("name","Répartition de la température à l'équilibre")
    surf(reshape(xi, 25,20))
    pause(0.1)

    