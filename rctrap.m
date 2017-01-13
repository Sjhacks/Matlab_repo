function T = rctrap(f,a,b)

v = 1;
h = b - a;
Tp = 0;
T = h/2*(feval(f,a) + feval(f,b));
n=2;

while(abs(T-Tp)>=10^-4)
  v = 2*v;
  h = h/2;
  sum = 0;
  for i=1:v/2
    x = a + h*(2*i-1);
    sum = sum + feval(f,x);
    n = n+1;
  end
  Tp = T;
  T= T/2 + h*sum;
  %n = n+1;
end
n