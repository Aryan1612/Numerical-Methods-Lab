x_values = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]; 
fx_values = [14.5, 19.5, 30.5, 53.5, 94.5, 159.5]; 
n = length(x_values); 
div_diff = zeros(n, n); 
for i = 1:n 
    div_diff(i, 1) = fx_values(i); 
end 
for j = 2:n 
    for i = j:n 
        div_diff(i, j) = (div_diff(i, j-1) - div_diff(i-1, j-1)) / (x_values(i) - x_values(i-1)); 
    end 
end 
coeff = diag(div_diff); 

disp('Newton''s Polynomial Coefficients:') 
disp(coeff) 
x0_val = 4; 
estimated_val = newton_poly(x0_val, x_values, coeff); 
exact_val = 53.5; 
fprintf('\nEstimated value at %.1f: %.6f\n', x0_val, estimated_val); 
fprintf('\nExact value at %.1f: %.6f\n', x0_val, exact_val); 
fprintf('Error: %.6f\n', abs(exact_val - estimated_val));

function result = newton_poly(x, x_values, coeff) 
    n = length(coeff); 
    result = coeff(1); 
    product = 1; 
    for i = 2:n 
        product = product * (x - x_values(i-1)); 
        term = coeff(i) * product / factorial(i-1); 
        result = result + term; 
    end 
end 
