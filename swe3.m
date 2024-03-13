H = zeros(100000, 501);
U = zeros(100000, 501);
r = zeros(1, 501);

for i = 1:501
    if (i-1) >= 250
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

    if t > 0.2
        index = j;
        break
    end

    for k = 2:500    
        H(j+1, k) = 0.5*(H(j, k+1)+H(j, k-1)) - 0.5*e/sr * (H(j, k+1) * U(j, k+1) - H(j, k-1)*U(j, k-1));
    end

    H(j+1, 1) = H(j+1, 2);
    H(j+1, 501) = H(j+1, 500);
    
    for k = 2:500
        U(j+1, k) = (0.5*(U(j, k+1)*H(j, k+1) + H(j, k-1)*U(j, k-1)) - 0.5*e/sr*(H(j, k+1) * (U(j, k+1)^2) + 0.5*(9.81)*H(j, k+1)^2 - H(j, k-1)*(U(j, k-1))^2 -0.5*9.81*H(j, k-1)^2))/H(j+1, k);
    end

    U(j+1, 1) = U(j+1, 2);
    U(j+1, 501) = U(j+1, 500);
end

x_data = linspace(0, 5, 501);
plot(x_data, H(index, :), 'red')
plot(x_data, U(index, :), 'blue')

for k = 1:index
    plot(x_data, H(k, :), 'r')
    xlabel('x');
    ylabel('y');
    axis([0 5 1 2])
    pause(0.05);
end

