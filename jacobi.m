function X=jacobi(A,B,max_iterations)
    %erreur=1;
    x=x0;
    xi=x;
    X=[];
    i=0;
    D=diag(diag(A));
    while i<max_iterations
        for ligne in range()
            xi=x-D\A*x+D\B;
        %erreur=norm(x-xi);
            x=xi;
            X=[X,x];
        i=i+1;
end