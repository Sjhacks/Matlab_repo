function x = gepp(A,b)
% genp.m GE with partial pivoting
% input:  A is an n x n nonsingular matrix
% b is an n x p vector
% output: x is the solution of Ax=b.
n = size(b,1);
for k = 1:n-1
    [maxval, maxindex] = max(abs(A(k:n,k)));
    q = maxindex+k-1;
    if maxval == 0, error('A is singular'), end
    A([k,q],k:n) = A([q,k],k:n);
    for j=1:size(b,2)
        b([k,q],j) = b([q,k],j);
    end
    for i = k+1:n
        mult = A(i,k)/A(k,k);
        A(i,k+1:n) = A(i,k+1:n)-mult*A(k,k+1:n);
        for j=1:size(b,2)
            b(i,j) = b(i,j) - mult*b(k,j);
        end
    end;
end;
x = zeros(n,size(b,1));
for j=1:size(b,2)
x(n,j) = b(n,j)/A(n,n);
end
for k = n-1:-1:1
    for j=1:size(b,2)
        x(k,j) = (b(k,j) - A(k,k+1:n)*x(k+1:n,j))/A(k,k);
    end
end