dx = 0.52;
dt = 0.01;
alpha = 3;
lambda = alpha * (dt/(dx^2));
rows = .1/dt + 1;
cols = floor(pi/dx) + 1;
U = zeros(rows, cols);

for i = 1:cols
    U(1, i) = sin((i-1)*dx);
end
U(1, 1) = 0;
U(1, cols) = 0;

a = 2*(1+lambda);
b = -lambda;
c = -lambda;

A = diag(a*ones(1,cols-2)) + diag(b*ones(1,cols-3),1) + diag(c*ones(1,cols-3),-1);

a = 2*(1-lambda);
b = lambda;
c = lambda;
B = diag(a*ones(1,cols-2)) + diag(b*ones(1,cols-3),1) + diag(c*ones(1,cols-3),-1);

for i = 2:rows
    x = B*U(i-1, 2:cols-1)'\A;
    for j = 1:cols-2
        U(i, j+1) = x(j);
    end
end

U
x1 = linspace(0, pi, floor(pi/0.52)+ 1);
y1 = U(rows, :);
plot(linspace(0, pi, floor(pi/0.52)+ 1), U(rows, :),'r')

dx = pi/50;
lambda = 0.5;
alpha = 3;
dt = lambda*(dx^2)/alpha;

rows = floor(.1/dt) + 1;
cols = floor(pi/dx) + 1;
W = zeros(rows, cols);

for i = 1:cols
    W(1, i) = sin((i-1)*dx);
end

for i = 2:rows
    for j = 2:cols-1
        W(i, j) = W(i-1, j) + lambda*(W(i-1, j+1) -2*W(i-1, j) + W(i-1, j-1));
    end
end
plot(linspace(0, pi, 50), W(152, :))
x2 = linspace(0, pi, 50);
y2 = W(152, :);
plot(x1, y1, "r", x2, y2, "blue")



    

