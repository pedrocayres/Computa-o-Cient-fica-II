function [U] = bak_heat_mat(u0, ul, ur, f, T, N, M)
   dt = T / M;
   dx = 1 / (N+1);
   l = dt / (dx*dx);
   U = zeros(N+2, M+1);
   U(:, 1) = u0(linspace(0, 1, N+2)');
   U(1, 2:end) = ul((1:M)*dt);
   U(N+2, 2:end) = ur((1:M)*dt);
   B = spdiags(ones(N, 1)*[-l, 1+2*l, -l],[-1, 0, 1], N, N);
   for n = 1:M,
      b = U(2:(N+1), n) + dt*f((1:N)'*dx, n*dt);
      b(1) = b(1) + l * ul(n*dt);
      b(N) = b(N) + l * ur(n*dt);
      U(2:(N+1), n+1) = B\b;
   end
end

