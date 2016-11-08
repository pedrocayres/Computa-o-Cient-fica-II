function [f,J] = f_orbita( u, ~ )
   G = 1;
   M = 1;
   x  = u(1);
   y  = u(2);
   vx = u(3);
   vy = u(4);
   r = norm([x;y]);
   f = [    vx;       ...
            vy;       ...
        -G*M*x/(r^3); ...
        -G*M*y/(r^3)      ];
   if nargout==2,
      a = -G*M/(r^5);
      J = [      0,             0,       1, 0; ...
                 0,             0,       0, 1; ...
           a*(y^2-2*x^2),   -3*a*x*y   , 0, 0; ...
             -3*a*x*y   , a*(x^2-2*y^2), 0, 0      ];
   end
end

