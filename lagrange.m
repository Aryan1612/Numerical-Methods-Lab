x_values = [0, 2, 4, 6]; 
fx_values = [1, -1, 3, 4]; 

x_input = input('Enter the value of x: '); 
result = lagrange_poly(x_input, x_values, fx_values); 
fprintf('Value of polynomial at x = %.2f: %.6f\n', x_input, result);

function f_val = lagrange_poly(x, x_values, fx_values) 
    f_val = 0; 
    for i = 1:length(x_values) 
        product = 1; 
        for j = 1:length(x_values) 
            if j ~= i 
                product = product * (x - x_values(j)) / (x_values(i) - x_values(j)); 
            end 
        end 
        f_val = f_val + product * fx_values(i); 
    end 
end 