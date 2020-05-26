function x = GaussSeidel(A, B, max_iterations)

n = size(A, 1);
x = zeros(n, 1);

for iter = 1:max_iterations
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
end
%%
fprintf('Solution of the system is : \n%f\n%f\n%f\n%f', x);
