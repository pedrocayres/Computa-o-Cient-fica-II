function [t, Y] = runge_kutta(f, tempo, y0, dt)
    
   t0 = tempo(1);
   tf = tempo(2);
   N = ceil((tf - t0) / dt);
   t = t0+(0:N)' * dt;
   Y = zeros(N+1,length(y0));
   Y(1,:) = y0';
   
   for i = 1:N,
       eps(1, :) = Y(i, :);
       fun(1, :) = f(eps(1, :), t(i))';
       eps(2, :) = Y(i, :) + dt * fun(1, :) / 2;
       fun(2, :) = f(eps(2, :), t(i) + dt / 2)';
       eps(3, :) = Y(i, :) + dt * fun(2, :) / 2;
       fun(3, :) = f(eps(3, :), t(i) + dt / 2)';
       eps(4, :) = Y(i, :) + dt * fun(3, :);
       Y(i + 1, :) = Y(i, :) + dt * (fun(1, :) + 2 * (fun(2, :) + fun(3, :)) + f(eps(4, :), t(i + 1))') / 6;
   end

end

