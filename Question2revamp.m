clear                                                                       %% Clear previous variables
clc

%% Initial set up for testing

n = 15;                                                                     %% Set n
h = 2/(n+1);                                                                %% Set h
a = ones(1,n-1);                                                            %% Create vector 'a' of length n-1
b = (-2*(1+2*h^2))*ones(1,n);                                               %% Create vector 'b' of length n
c = ones(1,n-1);                                                            %% Create vector 'c' of length n-1 
d = zeros(1,n);                                                             %% Create an empty vector 'd' of length n
d(1,1) = -1;                                                                %% Make the first element of 'd' -1
d(1,n) = -1;                                                                %% Make the last element of 'd' -1
d = transpose(d);                                                           %% Make 'd' a column vector
x = transpose(zeros(1,n));                                                  %% Create the initial guess column zero vector of length n

%% Algorithms

Jacobi(a,b,c,d,n,x)                                                         %% Apply the Jacobi function
disp(char(10))                                                              %% Line break (\n)
GaussSeidel(a,b,c,d,n,x)                                                    %% Apply the Gauss-Seidel function