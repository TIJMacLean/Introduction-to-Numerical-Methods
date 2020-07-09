clc
clear

n = 31;
A = [zeros(1,n) ; [eye(n-1)  zeros(n-1,1)]];
B = 2*eye(n);
C = [[zeros(n-1,1) eye(n-1)] ; zeros(1,n)];
M = A+B+C;
d = [1:1:16 15:-1:1];

for i = 1:n-1
    a(i) = M(i+1,i);
    b(i) = M(1,1);
    c(i) = M(i,i+1);
end
b(n) = M(n,n);


if length(a) == n-1 && length(b) == n && length(c) == n-1 && length(d) == n
else
    disp('Sorry, invalid vectors for a tridiagonal problem')
    return
end

c(1) = c(1)/b(1);
for i = 2:n-1
    c(i) = c(i)/(b(i)-c(i-1)*a(i-1));
end

d(1) = d(1)/b(1);
for i = 2:n
    d(i) = (d(i)-d(i-1)*a(i-1))/(b(i)-c(i-1)*a(i-1));
end

x(n) = d(n);
for i = n-1:-1:1
    x(i) = d(i)-c(i)*x(i+1);
end

disp('x is:')
disp(transpose(x))