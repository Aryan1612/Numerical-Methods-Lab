lambda = 0.8;
n_x = 200;
dx = 2/n_x;
dt = lambda*dx;
n_t = round(0.3/dt);

M = zeros(n_t+1, n_x+1);

for i = 1:n_x+1
    if (abs(-1 + dx*(i-1)) < (1/3))
        M(1, i) = 1;
    else
        M(1, i) = -1;
    end
end

for i = 2:n_t+1
    for j = 2:n_x
        M(i, j) = 0.5*(M(i-1, j+1) + M(i-1, j-1)) - lambda*0.5*(0.5*(M(i-1, j+1))*(M(i-1, j+1)) - 0.5*(M(i-1, j-1))*(M(i-1, j-1)));
    end
    M(i, 1) = 0.5*(M(i-1, n_x) + M(i-1, 2)) - lambda*0.5*0.5*((M(i-1, 2))^2 - (M(i-1, n_x))^2);
    M(i, n_x+1) = M(i, 1);
end

x_data_1 = linspace(-1, 1, n_x+1);
y_data_1 = M(n_t+1, :);

lambda = 0.8;
n_x = 5000;
dx = 2/n_x;
dt = lambda*dx;
n_t = round(0.3/dt);

M = zeros(n_t+1, n_x+1);

for i = 1:n_x+1
    if (abs(-1 + dx*(i-1)) < (1/3))
        M(1, i) = 1;
    else
        M(1, i) = -1;
    end
end

for i = 2:n_t+1
    for j = 2:n_x
        M(i, j) = 0.5*(M(i-1, j+1) + M(i-1, j-1)) - lambda*0.5*(0.5*(M(i-1, j+1))*(M(i-1, j+1)) - 0.5*(M(i-1, j-1))*(M(i-1, j-1)));
    end
    M(i, 1) = 0.5*(M(i-1, n_x) + M(i-1, 2)) - lambda*0.5*0.5*((M(i-1, 2))^2 - (M(i-1, n_x))^2);
    M(i, n_x+1) = M(i, 1);
end

x_data_2 = linspace(-1, 1, n_x+1);
y_data_2 = M(n_t+1, :);
plot(x_data_1, y_data_1, 'r', x_data_2, y_data_2, 'b')

figure;
for k = 1:100
    plot(x_data_1, M(k*5+1, :), 'r')
    xlabel('x');
    ylabel('y');
    pause(0.1);
end

