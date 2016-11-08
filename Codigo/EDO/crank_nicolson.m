function [t,Y] = crank_nicolson(f,tempo,y0,dt)
   t0 = tempo(1);
   tf = tempo(2);
   N = ceil((tf-t0)/dt);
   t = t0+(0:N)'*dt;
   Y = zeros(N+1,length(y0));
   Y(1,:) = y0';

   for j = 1 : N,
      fun = @(y) g(y,f,Y(j,:)',dt,t(j+1));
      Y(j+1,:) = newton(fun,Y(j,:)')';
   end
   
end

function [g,Jg] = g(y,fun,yn,dt,tnp1)
   [f, Jf] = fun(y, tnp1);
   g = y - yn - dt*(f + fun(yn, tnp1 - dt)) / 2;
   Jg = eye(length(y)) - dt * Jf / 2;
end

