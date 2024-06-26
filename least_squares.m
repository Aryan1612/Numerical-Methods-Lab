n = input('Enter the number of points (n): ');
m = input('Enter the degree of the polynomial (m): ');


x = zeros(1, n);
y = zeros(1, n);


disp('Enter the points (x, y):');
for i = 1:n
    x(i) = input('Enter x: ');
    y(i) = input('Enter y: ');
end


A = zeros(n, m + 1);
for i = 1:n
    A(i, :) = x(i).^(m:-1:0);
end


coefficients = (A' * A) \ (A' * y');


disp('Coefficients of the fitted polynomial:');
disp(coefficients');


figure;
scatter(x, y, 'o', 'DisplayName', 'Data Points');
hold on;


x_fit = linspace(min(x), max(x), 1000);

y_fit = polyval(coefficients, x_fit);




plot(x_fit, y_fit, 'r-', 'DisplayName', 'Fitted Polynomial');

title('Least Squares Polynomial Fit');
xlabel('x');
ylabel('y');
legend('show');
grid on;
