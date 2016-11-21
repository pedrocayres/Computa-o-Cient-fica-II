% % Testando o back_heat_mat com com a condição de neuman
% % esse arquivo ira testar a funcao de u(1,t) = ur(t) = 0
% % u(0,t) = 0, vl(t) = 2*pi*exp(-4*pi*pi*t) e u(x,0) = sin(2*pi*x) cuja solução é 
% % exp(-4*pi*pi*t)*sin(2*pi*x)
% 
% %--------------------------------------------------------------------------
% %-------------------------- Com M fixos -----------------------------------
% %--------------------------------------------------------------------------
close all
hold on

Ms = [80, 100, 200, 400];
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
        [U,t,x] = bak_heat_neu_c(@u0_expsin, @vl_expsin, @ur_expsin, @f_expsin, T, N, M);
        [xx,tt] = meshgrid(x,t);
        u_exact = sol_expsin(x,t');
	dx = [dx,1/(N+0.5)];
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
Ns = [1400,5600,22400];
Ms = linspace(20,15220,41);
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
        [U,t,x] = bak_heat_neu_c(@u0_expsin, @vl_expsin, @ur_expsin, @f_expsin, T, N, M);
        [xx,tt] = meshgrid(x,t);
        u_exact = sol_expsin(x,t');
        dt = [dt,T/M];
        erros = [erros, max(max(abs(U-u_exact')))];
    end;
    plot(log10(dt), log10(erros),'-o');
end;

xlabel('dt');
ylabel('erros');
title('N fixo');
