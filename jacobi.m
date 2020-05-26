%% Jacobi Method
function x=jacobi(A,B,x,max_iterations)
    n=size(x,1);
    erreur=Inf; 
    iteration=0;
    tol=1e-5;

    while erreur>tol & iteration < max_iterations
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
        
        erreur=abs(xold-x);
    end