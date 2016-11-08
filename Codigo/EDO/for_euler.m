function [t,Y] = for_euler(f,tempo,y0,dt)

   t0 = tempo(1);
   tf = tempo(2);
   N = ceil((tf-t0)/dt);
   t = t0+(0:N)'*dt;
   Y = zeros(N+1,length(y0));
   Y(1,:) = y0';
   
   for j = 1 : N,
      Y(j+1,:) = Y(j,:) + dt*f(Y(j,:)',t(j))';
   end
   
end

