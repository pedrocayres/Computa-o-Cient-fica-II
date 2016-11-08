function [t,u,c, passos, hk] = euler_adaptativo(f,tempo,y0,h, eps, alpha)
    c = 0;
    passos = 1;
    t0 = tempo(1);
    tf = tempo(2);
    ro = eps/(tf - t0);
    num = ceil((tf - t0)/h);
    n = 1;
    u = zeros(num+1,length(y0));
    t = zeros(num+1,1);
    t(1) = t0;
    u(1,:) = y0';
    x = y0'; 
    hk(1) = h;
    while t(n) < tf
        passos = passos + 1;
        fu = f(x', t(n))';
        hfu = h*fu;
        fu1 =  f(x + hfu/2 , t(n) + h/2)';
        v = x + hfu;
        a = (fu +fu1)/2;
        w = x +  a*h;
        teta = norm((fu - fu1)/2)/(ro);
        if teta < 1
            n = n + 1;
            teta;
            t(n) = t(n-1)+h;
            hk(n) = h;
            x = w;
            u(n,:) = x;
        else
            c = c + 1;
        end 
        h = alpha * h / teta;
        
    end 
    passos = n;
end

