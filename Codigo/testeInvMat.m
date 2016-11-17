N = 3000;
n = 250;
l = 0.3;
B = spdiags(ones(N,1)*[-l, 1+2*l, -l], [-1, 0, 1], N, N);
b = rand(N, 1);

tic
% *** primeira forma ***
for k = 1:n,
  x = B\b;
end
toc

tic
% *** segunda forma ***
invB = inv(B);
for k = 1:n,
  x = invB*b;
end
toc

tic
% *** terceira forma ***
fullinvB = full(inv(B));
for k = 1:n,
  x = fullinvB*b;
end
toc

tic
% *** quarta forma ***
[L, U] = lu(B);
for k = 1:n,
  x = U\(L\b);
end
toc

size(nonzeros(B))
size(nonzeros(invB))
h = figure;
spy(B);
saveas(h, "B.png");
spy(invB);
saveas(h, "invB.png");
