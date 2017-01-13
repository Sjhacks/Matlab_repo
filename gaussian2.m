function y = gaussian2(f,a,b,n)

    h = (b-a)/(2*n);
    srt3 = sqrt(3.0)/3.0;
    x = linspace ( a, b, n+1 );

    sum = 0;
    for i = 1:n
        sum = sum + feval ( f, x(i) + h - srt3 * h )...
        + feval ( f, x(i) + h + srt3 * h );
    end

    y = (h) * sum;
end
