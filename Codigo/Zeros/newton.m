function [ x, nit ] = newton( f, x0 )

   nit = 0;
   x = x0;
   [fx, J] = f(x);
   norm_ini = norm(fx);
   norm_cur = norm_ini;
   while norm_cur > 1.e-6 * norm_ini
      nit = nit+1;
      x = x - J\fx;
      [fx, J] = f(x);
      norm_cur = norm(fx);
   end

end

