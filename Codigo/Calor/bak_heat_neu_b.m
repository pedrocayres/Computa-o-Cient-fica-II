function [U, t, x] = bak_heat_neu_b(u0, vl, ur, f, T, N, M)
   dt = T / M;
   t = 0:dt:T;
   dx = 1 / (N+1);
   x = 0:dx:1;
   l = dt / (dx*dx);
   U = zeros(N+2, M+1);
   U(:, 1) = u0(linspace(0, 1, N+2)');
   U(N+2, 2:end) = ur((1:M)*dt);
   B = spdiags(ones(N+1, 1)*[-l, 1+2*l, -l], [-1, 0, 1], N+1, N+1);
   B(1, 1:3) = [-1.5, 2, -0.5];
   for n = 1:M,
      b(1, 1) = dx * vl(n*dt);
      b(2:N+1, 1) = U(2:(N+1), n) + dt*f((1:N)'*dx, n*dt);
      b(N+1, 1) = b(N+1, 1) + l * ur(n*dt);
      U(1:(N+1), n+1) = B\b;
   end
end

