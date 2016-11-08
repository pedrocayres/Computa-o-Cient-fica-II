function [t,Y] = RK4(f,tempo,y0,dt)

   t0 = tempo(1);
   tf = tempo(2);
   N = ceil((tf-t0)/dt);
   t = t0+(0:N)'*dt;
   Y = zeros(N+1,length(y0));
   Y(1,:) = y0';
   
   for j = 1 : N,
      qsi1 = Y(j,:);
      qsi2 = Y(j,:) + (dt/2)*f(qsi1',t(j))'; 
      qsi3 = Y(j,:) + (dt/2)*f(qsi2',(t(j)+dt/2))';
      qsi4 = Y(j,:) + dt*f(qsi3', (t(j)+dt/2))';
      Y(j+1,:) = Y(j,:) + dt*(f(qsi1', t(j))' + 2*f(qsi2', (t(j) + dt/2))' + 2*f(qsi3', (t(j)+dt/2))' + f(qsi4', dt+t(j))')/6;
   end
   
end

