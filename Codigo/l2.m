close all
tempo = [0,12];
% r0 = [1;0];
% v0 = [-.5;1];
hold on
r0 = [1];
v0 = [1];
y0 = [r0;v0];
dt = 0.002;
% plot(t,Y2(:,1),t, Y2(:,2))
h = 0.1; 
eps = 0.01;
alpha = 0.2;
% tic
% [t,Y, c, passos,hk] = euler_adapt(@f_massa_mola,tempo, y0, h, eps, alpha);
% toc
tic
[t,Y, c, passos,hk] = euler_adaptativo(@f_massa_mola,tempo, y0, h, eps, alpha);
toc
figure;
surface([t(:),t(:)],[Y(:,1),Y(:,1)],[hk(:),hk(:)],'EdgeColor','flat','FaceColor','none');
set('LineWidth',[5])
m = max(hk)
hk - m;
i = 0;

j = 1;
k = j;
% while k < passos
%     
%     if ((hk(j)/hk(k) > 1.0125) | (hk(j)\hk(k) > 1.0125))
%         i = i + 1;
%         mk(i) = j;
%         j = k+1;
%        
%     else
%         j
%         j = j-1;
%         k = k*2;
%         if (k > passos)
%             break;
%         end
%     end
%     j = j + 1;
% end
% 
% t = 1/i;
% 
% for j=1:i-1
%     t*j
%     plot(Y2(mk(j):mk(j+1),1), Y2(mk(j):mk(j+1),2),'Color', [t*j, 0, 1 - t*j]);
% end
%     plot(Y2(mk(i):passos,1), Y2(mk(i):passos,2),'Color', [1, 0,  1 ]);
    %  for j = 1:pas0sos-1
   
%      plot(Y2(j:(j+1),1), Y2(j:(j+1),2),'Color', [hk(j), hk(j), hk(j)]/m);
%  end
%  plot(Y2(1:2,1), Y2(1:2,2),'Color',[hk(1),hk(1),hk(1)]);
%   whitebg([1 1 1])

% % plot(t2,Y2(:,1),t2, Y2(:,2));
% title('Massa mola');
% surface([Y2(:,1),Y2(:,1)],[Y2(:,2),Y2(:,2)],[hk(:),hk(:)],'EdgeColor','flat','FaceColor','none');
% 
% legend('funcao', 'derivada');
% ylabel('f'); % y-axis label
% xlabel('t'); % y-axis label
% % figure;
% %  sol = 3*exp(-t)-2*exp(-2*t);
% % % hk = hk/max(hk);
% % % pcolor(t,Y(:,1),hk)
% %   erro_adapt = abs(sol - Y(:, 1));
% % %   semilogy(t, erro_adapt)
% %   sol = 3*exp(-t2)-2*exp(-2*t2);
% %   erro_adapt2 = abs(sol - Y2(:, 1));
% %   semilogy(t2, erro_adapt2,t, erro_adapt)
% %   title('erro massa mola');
% %   legend('w','2*w - v');
% %   ylabel('erro(f)'); % y-axis label
% %   xlabel('t'); % y-axis label
% %   
% % % passos
% % dt = (tempo(2)-tempo(1))/(passos)
% % % n = ceil((tempo(2)-tempo(1))/dt)
% % tic
% % [t,Y2] = for_euler(@f_massa_mola,tempo,y0,dt);
% % toc
% % sol = 3*exp(-t)-2*exp(-2*t);
% % erro_for = abs(sol - Y2(:,1))/2;
% % semilogy(t, erro_for)
% % title('Gráfico h_k x k');
% % legend('h_k');
% % ylabel('h_k'); % y-axis label
% % xlabel('k'); % y-axis label
% % figure;
% % semilogy(1:passos,hk,'*')
% % 
% % title('Gráfico log_{10}(h_k) x k');
% % legend('h_k');
% % ylabel('h_k'); % y-axis label
% % xlabel('k'); % y-axis label
% 
% % h = plot(t,Y(:,1),t,Y(:,2));
% passos
% % set(h,'LineWidth',2)
% % axis([0 10]);
% 
% % close all
% 
% % plot(Y(:,1),Y(:,2))
% 
% % axis equal
% 
% % t_fino = linspace(tempo(1),tempo(2),150);
% % 
% % figure
% % hold on
% % plot(t,Y,'r.') 
% % h = plot(t_fino,y0*exp(-a*t_fino),'b');
% % set(h,'LineWidth',2)
% % hold off