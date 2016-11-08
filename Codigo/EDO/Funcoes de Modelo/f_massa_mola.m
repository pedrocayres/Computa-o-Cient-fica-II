function [f,J] = f_massa_mola( u, ~ )
   m = 1;
   k = 2;
   mi = 3;
   x  = u(1);
   vx = u(2);
   f = [vx; (-k * x - mi * vx) / m];
   if nargout==2,
      J = [0, 1; -k/m, -mi/m];
   end
end

