close all;
clear all;

tempo = [0,10000];
r0 = (6.371*10^3)*[1/sqrt(2);1/sqrt(2)];
v0 = 7930*[1;0];
y0 = [r0;v0];
h = 0.1;
%% 
eps = 0.01;
alpha = 0.2;
range = 1:1;
% [t,Y5, c] = euler_adapt(@f_orbita,tempo, y0, h, eps, alpha);
dt = 0.01;
% size(Y5);
% size(t);
hold on;
% % plot(t,Y5(:,1),t,Y5(:,2),'r')
% for i = range,
%     
% %      [t, Y4] = euler_adaptativo(@f_massa_mola,tempo,y0,h)
% %      plot(t,Y4(:,1),t,Y4(:,2),'r')
% end 
%     dt = dt + 0.0001;
%     
     [t,Y1] = for_euler(@f_orbita,tempo,y0,dt);
     Y1;
     plot(Y1(:,1),Y1(:,2));
%     sol = 3*exp(-t)-2*exp(-2*t);
%    erro_for(i) = max(abs(sol - Y(:, 1)));
%     
%    plot(t,Y(:,1),t,Y(:,2),'r')
%     title('Forward Euler');
% 
%     [t,Y2] = bak_euler(@f_massa_mola,tempo,y0,dt);
%     erro_bak(i) = max(abs(sol - Y(:, 1)));
% 
%    figure;
%     plot(t,Y(:,1),t,Y(:,2),'r')
%     title('Backward Euler');
% 
%     [t,Y3] = runge_kutta(@f_massa_mola,tempo,y0,dt);
%     erro_rk(i) = max(abs(sol - Y(:, 1)));
% 
%    figure;
%     plot(t,Y(:,1),t,Y(:,2),'r')
%     title('Runge-Kutta 4');
% 
%     [t,Y4] = crank_nicolson(@f_massa_mola,tempo,y0,dt);
%     erro_cn(i) = max(abs(sol - Y(:, 1)));
%     
%    figure;
%     plot(t,Y(:,1),t,Y(:,2),'r')
%     title('Crank-Nicolson');
%     
%    figure;    
%     plot(t, 3*exp(-t)-2*exp(-2*t),t,Y1(:,1),t,Y2(:,1),t,Y3(:,1),t,Y4(:,1), 'LineWidth', 1 );
%     legend('solução','for-euler','back-euler','runge-kutta', 'crank-nicolson','Location','southeast');
%     title('Solução Sistema');
%     figure;
%     plot( t, -3*exp(-t)+4*exp(-2*t),'-',t,Y1(:,2),t,Y2(:,2),t,Y3(:,2),t,Y4(:,2),'LineWidth', 1);
%     legend('solução','for-euler','back-euler','runge-kutta', 'crank-nicolson','Location','southeast');
%     title('Derivada Solução');
%     set(handle,'LineWidth',[5])
% end
% dt = 0.0001;
% axis([0 10^-2 10^-15 10^-3]);
% loglog(dt * range, erro_for,'o-', dt * range, erro_bak,'o-k', dt * range, erro_rk, '*-g', dt * range, erro_cn,'x-r');
% legend('for-euler','back-euler','runge-kutta', 'crank-nicolson','Location','southeast');
% grid on;
% title('Gráfico dos erros conforme aumenta o dt');
% ylabel('log(valor absoluto do erro)'); % y-axis label
% xlabel('log(dt)'); % y-axis label

% t_fino = linspace(tempo(1),tempo(2),150);
% 
% figure
% hold on
% plot(t,Y,'r.') 
% h = plot(t_fino,y0*exp(-a*t_fino),'b');
% set(h,'LineWidth',2)
% hold off