function xpoint = navettecontinue(t,x,A,B)
    x = x(:);
    xpoint = A*x;
    if(t>=1)
        xpoint = xpoint + 0.05*B;
    end
end