function root = regfals(f,a, b, iter)
%f is the inline function
%a is interval lower bound
%b is interval upper bound
%iter is the max number of iterations until the end
error = 1; 
tol = 1e-15; 
n = 0; 
 
% Main loop.
while (error >= tol && n<iter)
    c = b - (f(b)*(b-a)) / (f(b)-f(a));
    if f(a)*f(c) < 0
        error = b - c;
        b = c;
    else
        error = c - a;
        a = c;
    end
    n = n + 1;
end
 
root = c;
fprintf('The root after %d iterations is: %12.15f',n,c);