function [A,B,C,D]=cubic_spline(x,y)

if any(size(x) ~= size(y))
    error('inputs x and y must be of same length');
end

n = length(x);

h = x(2:n) - x(1:n-1);
b = (y(2:n) - y(1:n-1))./h;

l = h(1:end-1);
u  = 2*(h(1:end-1) + h(2:end));
up = h(2:end);

g = spdiags([l u up], [-1 0 1], n-2, n-2);
v = 6*(b(2:end)-b(1:end-1));

m = g\v;

%natural spline bounds
m = [ 0; m; 0];
%coefficients
A = y;
B = b - h.*(2*m(1:end-1) + m(2:end))/6;
C = m/2;
D =(m(2:end)-m(1:end-1))./(6*h);
yy = A(n) + B(n-1)*(10) + ... 
         C(n-1)*(10).^2 + D(n-1)*(10).^3
zz = A(8) + B(8-1)*(5) + ... 
         C(8-1)*(5).^2 + D(8-1)*(5).^3
     
x=[x;2010;1975];
y=[y;yy;zz];
plot(x, y, 'bo');
axis([1900 2010 0 400]);
title('Population of the U.S. 1900-1990');
ylabel('Millions');
% disp('press any key to continue')
% pause 
% plot(1975,214.9544,'ks');
% text(1975,214.9544-10,num2str(214.9544));
hold off
    