M = zeros(38, 201);
delta_x = 0.01;
delta_t = 0.8*0.01;
lambda = 0.8;
x_data_1 = linspace(-1, 1, 201);
x_data_2 = linspace(-1, 1, 5001);
for i = 1:201
    if (abs(2*i/200 - 51/50) < (1/3))
        M(1, i) = 1;
    else
        M(1, i) = -1;
    end
end

for row = 2:38
    for col = 2:200
        M(row, col) = 0.5*(M(row-1, col+1) + M(row-1, col-1))*(1-0.4*0.5*(M(row-1, col+1)-M(row-1, col-1)));
    end
    M(row, 1) = 0.5*(M(row-1, 200) + M(row-1, 2))*(1-0.4*0.5*(M(row-1, 2)-M(row-1, 200)));
    M(row, 201) = M(row, 1);
end
M
N = zeros(38, 5001);
for i = 1:5001
    if (abs(2*i/5000 - 2501/2500) < (1/3))
        N(1, i) = 1;
    else
        N(1, i) = -1;
    end
end

for row = 2:38
    for col = 2:5000
        N(row, col) = 0.5*(N(row-1, col+1) + N(row-1, col-1))*(1-0.4*0.5*(N(row-1, col+1)-N(row-1, col-1)));
    end
    N(row, 1) = 0.5*(N(row-1, 5000) + N(row-1, 2))*(1-0.4*0.5*(N(row-1, 2)-N(row-1, 5000)));
    N(row, 5001) = N(row, 1);
end
plot(x_data_1, M(38, :), 'r', linspace(-1, 1, 5001), N(38, :), 'b')
