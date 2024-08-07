y_0 = -1;
y_n = 0;
a = 0;
b = 1;
h = 0.1;
n = (b-a)/h
A = zeros(n-1, n-1);
for i = 1:n-1
    x_i = a+i*h;
    A(i, i) = -2/(h^2) - x_i;
    if (i ~= 1)
        A(i, i-1) = 1/(h^2) - (exp(a+i*h))/(2*h);
    end
    if (i ~= n-1)
        A(i, i+1) = 1/(h^2) + (exp(a+i*h))/(2*h);
    end
end
A
B = zeros(n-1, 1);

for i = 1:n-1
    x_i = a+i*h;
    B(i, 1) = (-1*x_i^2+2*x_i-3)*exp(-x_i)+2-x_i;
    if i == 1
        B(i, 1) = B(i, 1) - y_0*(1/(h^2) - exp(x_i)/(2*h));
    end
    if i == n-1
        B(i, 1) = B(i, 1) - y_n*(1/(h^2) + exp(x_i)/(2*h));
    end
end
B
Y_pred = A\B
Y_real = zeros(n-1, 1);

for i = 1:n-1

    x_i = a+i*h;
    Y_real(i, 1) = (x_i-1)*exp(-x_i);
end
error = abs(Y_pred - Y_real)
