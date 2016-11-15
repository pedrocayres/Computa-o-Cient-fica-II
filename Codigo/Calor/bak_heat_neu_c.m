function [U, t, x] = bak_heat_neu_c(u0, vl, ur, f, T, N, M)
   dt = T / M;
   t = 0:dt:T;
   dx = 1 / (N+0.5);
   x = dx/2:dx:1;
   l = dt / (dx*dx);
   U = zeros(N+2, M+1);
   U(:, 1) = u0(linspace(dx/2, 1, N+1)');
   U(N+1, 2:end) = ur((1:M)*dt);
   B = spdiags(ones(N, 1)*[-l, 1+2*l, -l], [-1, 0, 1], N, N);
   B(1, 1:3) = [1+l, -l, 0];
   for n = 1:M,
      b = U(1:N, n) + dt*f(((1:N)'-0.5)*dx, n*dt);
      b(1) = b(1) - dt / dx * vl(n*dt);
      b(N) = b(N) + l * ur(n*dt);
      U(1:N, n+1) = B\b;
   end
end

