function [f,J] = f_exp_decay ( y, ~ )
   global a;
   f = -a*y;
   if nargout == 2,
      J = -a;
   end
end

