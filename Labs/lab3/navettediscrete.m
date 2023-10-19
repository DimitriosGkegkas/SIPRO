function xeplus = navettediscrete(n,xe,Atilde,Btilde,ts)
    xe = xe(:);
    xeplus = Atilde*xe;
    if(n*ts>=1)
        xeplus = xeplus + 0.05*Btilde;
    end
end
