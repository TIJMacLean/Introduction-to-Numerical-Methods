function GaussSeidel(a,b,c,d,n,x)                                           %% Define the function

if length(a) == n-1 && length(b) == n && length(c) == n-1 && length(d) == n %% Check vector lengths are consistent
else
    disp('Sorry, invalid vectors for a tridiagonal problem')                %% Otherwise display an error message
    return                                                                  %% And break out of the function
end

k = 2;                                                                      %% Start at k = 2 as matlab starts array referencing at 1
while k > 1                                                                 %% Create an infinite loop
    x(1,k) = (1/b(1)) * (d(1)-c(1)*x(2,k-1));                               %% Iterate element 1
    for i = 2:n-1
        x(i,k) = (1/b(i)) * (d(i)-a(i-1)*x(i-1,k)-c(i)*x(i+1,k-1));         %% Iterate from 2 to n-1
    end
    x(n,k) = (1/b(n)) * (d(n)-a(n-1)*x(n-1,k));                             %% Iterate element n
    
    if (max(abs(x(:,k)-x(:,k-1))) <= 0.001)                                  %% Check the convergence criterion
        break                                                               %% Stop if it is satisfied
    end
    k = k+1;                                                                %% Increment k
end

disp(horzcat('The maximum difference between the iterations', char(10), 'by the Gauss-Seidel method is: ',num2str(abs(max(x(:,k)-x(:,k-1))))))
disp(horzcat('Occuring when k is: ',num2str(k-1)))                          %% Output the answer, remembering to take k-1 due
                                                                            %  to the way that matlab conventionally references