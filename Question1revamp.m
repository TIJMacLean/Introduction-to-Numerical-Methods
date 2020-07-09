clear                                                                       %% Clear previous variables
clc

%% Matrix creation

n = 31;                                                                     %% Set n
A = [zeros(1,n) ; [eye(n-1)  zeros(n-1,1)]];                                %% Create an (n-1)*(n-1) identity matrix, then add 
                                                                            %  a row to the top and column to the right
B = 2*eye(n);                                                               %% Create an n*n identity matrix, multipled by two
                                                                            %  so all diagonal elements are 2 and others are 0
C = [[zeros(n-1,1) eye(n-1)] ; zeros(1,n)];                                 %% Create an (n-1)*(n-1) identity matrix, then add
                                                                            %  a row to the bottom and column to the left
M = A+B+C;                                                                  %% Add the three matrices together to create the tridiagonal matrix required
d = [1:1:16 15:-1:1];                                                       %% Create d (as a row vector)

for i = 1:n-1
    a(i) = M(i+1,i);                                                        %% Put the elements of a in a row vector, length n-1
    b(i) = M(1,1);                                                          %% Put the elements of b in a row vector, length n-1
    c(i) = M(i,i+1);                                                        %% Put the elements of c in a row vector, length n-1
end
b(n) = M(n,n);                                                              %% Add the final element of b to make the vector length n

%% Algorithm

Thomas(a,b,c,d,n)                                                           %% Apply the Thomas algorithm