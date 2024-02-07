M = zeros(501, 201);
delta_x = 0.01;
delta_t = 0.8*0.01;
lambda = 0.8;
x_data_1 = linspace(-1, 1, 201);
x_data_2 = linspace(-1, 1, 5001);
for i = 1:201
    if (abs(2*i/200 - 51/50) < (1/3))
        M(1, i) = 1;
    end
end

for row = 2:501
    for col = 2:200
        M(row, col) = M(row-1, col+1)*0.1 + M(row-1, col-1)*0.9;
    end
    M(row, 1) = M(row-1, 200) *0.9 + M(row-1, 2)*0.1;
    M(row, 201) = M(row, 1);
end
M


N = zeros(501, 50001);
for i = 1:50001
    if (abs((2/50000)*i -25001/25000)< (1/3))
        N(1, i) = 1;
    end
end

for row = 2:501
    for col = 2:50000
        N(row, col) = N(row-1, col+1)*0.1 + N(row-1, col-1)*0.9;
    end
    N(row, 1) = N(row-1, 50000) *0.9 + N(row-1, 2)*0.1;
    N(row, 50001) = N(row, 1);
end
N
plot(x_data_1, M(501, :), 'r', linspace(-1, 1, 50001), N(501, :), 'b')

