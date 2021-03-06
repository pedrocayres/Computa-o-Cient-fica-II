% % Testando o back_heat_mat com com a condi��o de neuman
% % esse arquivo ira testar a funcao de u(1,t) = ur(t) = 0
% % u(0,t) = 0, vl(t) = 2*pi*exp(-4*pi*pi*t) e u(x,0) = sin(2*pi*x) cuja solu��o � 
% % exp(-4*pi*pi*t)*sin(2*pi*x)
% 
% %--------------------------------------------------------------------------
% %-------------------------- Com M fixos -----------------------------------
% %--------------------------------------------------------------------------
close all
hold on

Ms = [1000,4000,16000];%, 1600, 1800, 2000];
Ns = linspace(20,5220,21);

n = size(Ns);
n = n(2);

m = size(Ms);
m = m(2);

T = 0.02;

for i=1:m
    M = Ms(i);
    erros = [];
    dx = [];
    for j=1:n
        N = Ns(j);
        [U,t,x] = bak_heat_neu_a(@u0_expcos, @vl_expcos, @ur_expcos, @f_expcos, T, N, M);
        [xx,tt] = meshgrid(x,t);
        u_exact = sol_expcos(x,t');
        dx = [dx,1/(N+1)];
        erros = [erros, max(max(abs(U-u_exact')))];
    end;
    plot(log10(dx),log10(erros),'-o');
end;

xlabel('dx');
ylabel('erros');
title('M fixo');

% %--------------------------------------------------------------------------
% %----------------------N fixo ---------------------------------------------
% %--------------------------------------------------------------------------

figure;
hold on;
Ns = [200,400,800,1600,3200];
Ms = linspace(20,5220,21);
n = size(Ns);
n = n(2);

m = size(Ms);
m = m(2);
legenda='';
for i=1:n
    N = Ns(i);
    erros = [];
    dt = [];
    for j=1:m
        M = Ms(j);
        [U,t,x] = bak_heat_neu_a(@u0_expcos, @vl_expcos, @ur_expcos, @f_expcos, T, N, M);
        [xx,tt] = meshgrid(x,t);
        u_exact = sol_expcos(x,t');
        dt = [dt,T/M];
        erros = [erros, max(max(abs(U-u_exact')))];
    end;
    plot(log10(dt), log10(erros),'-o');
end;

xlabel('dt');
ylabel('erros');
title('N fixo');
