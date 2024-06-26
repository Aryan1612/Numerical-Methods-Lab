% Given data
x_data = [0, 0.5, 1, 1.5, 2, 2.5];
y_data = [0, 0.2, 0.27, 0.3, 0.32, 0.33];

% Coefficients
degree = input("Degree?");
n = size(x_data, 2);

xny = zeros(1, degree+1);
xn = zeros(1, 2*degree+1);

% Calculating coefficients
for i = 1:degree+1
    for j = 1:n
        xny(1, i) = xny(1, i) + x_data(j)^(i-1) * y_data(j);
    end
end

for k = 1:2*degree+1
    for l = 1:n
        xn(1, k) = xn(1, k) + x_data(1, l)^(k-1);
    end
end

A = zeros(degree+1, degree+1);

for i = 1:degree+1
    for j = i:i+degree
        A(i, j-i+1) = xn(j);
    end
end

B = xny';
X = A\B;

% Plotting
figure;
plot(x_data, y_data, 'o', 'DisplayName', 'Data points');
hold on;

% Generating and plotting the polynomial
x_values = linspace(min(x_data), max(x_data), 100);
y_values = polyval(flip(X), x_values);

plot(x_values, y_values, 'r-', 'DisplayName', 'Polynomial Fit');
legend();
xlabel('x');
ylabel('y');
title('Polynomial Fit to Data');
grid on;
hold off;
