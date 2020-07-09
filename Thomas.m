function Thomas(a,b,c,d,n)                                                  %% Define the function

if length(a) == n-1 && length(b) == n && length(c) == n-1 && length(d) == n %% Check that vectors are the correct lengths
else
    disp('Sorry, invalid vectors for a tridiagonal problem')                %% Otherwise disply an error message
    return                                                                  %% And stop the process
end

c(1) = c(1)/b(1);                                                           %% Modify the first coefficient (c)
for i = 2:n-1
    denom(i) = (b(i)-c(i-1)*a(i-1));                                        %% Save the denominator after calculation for later use
    c(i) = c(i)/denom(i);                                                   %% Then loop to modify the other (c) values
end

d(1) = d(1)/b(1);                                                           %% Modify the first coefficient (d)
for i = 2:n-1
    d(i) = (d(i)-d(i-1)*a(i-1))/denom(i);                                   %% Loop to modify the other (d) values, using the denominator from before
end
d(n) = (d(n)-d(n-1)*a(n-1))/(b(n)-c(n-1)*a(n-1));                           %% Modify the last coefficient (no denominator was created)

x(n) = d(n);                                                                %% Start the back substitution
for i = n-1:-1:1
    x(i) = d(i)-c(i)*x(i+1);                                                %% Continue the back substitution
end

disp('x is:')
disp(transpose(x))                                                          %% Display the answer 'x' as a column vector