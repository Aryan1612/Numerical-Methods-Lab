H = zeros(100000, 501);
U = zeros(100000, 501);
r = zeros(1, 501);

for i = 1:501
    if ((i-1)/100) >= 2.5
        H(1, i) = 1;
    else
        H(1, i) = 2;
    end
end

t = 0;
dx = 1/100;
e = 1;
index = 0;

for j = 1:100000
    r = zeros(1, 501);
    for i = 1:501
        r(1, i) = abs(U(j, i)) + sqrt(9.81*H(j, i));
    end
    sr = max(r);
    dt = (e*dx)/sr;
    t= t+dt;

    H(j+1, 1) = H(1, 2);
    H(j+1, 501) = H(1, 500);

    for k = 2:500    
        H(j+1, k) = 0.5*(H(j, k+1)+H(j, k-1)) - 0.5*e/sr * (H(j, k+1) * U(j, k+1) - H(j, k-1)*U(j, k-1));
    end
    
    U(j+1, 1) = U(1, 2);
    U(j+1, 501) = U(1, 500);

    for k = 2:500
        U(j+1, k) = (0.5*(U(j, k+1)*H(j, k+1) + H(j, k-1)*U(j, k-1)) - 0.5*e/sr*(H(j, k+1) * (U(j, k+1)^2) + 0.5*(9.81)*H(j, k+1)^2 - H(j, k-1)*(U(j, k-1))^2 -0.5*9.81*H(j, k-1)^2))/H(j+1, k);
    end

    if t > 1
        index = j;
        break
    end
end

x_data = linspace(0, 5, 501);
plot(x_data, H(index, :), 'red', x_data, U(index, :), "blue")
