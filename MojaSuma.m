function y = MojaSuma(i, k, l, m, L, U)
% funkcja licz�ca sum� od l do m L(i,p)*U(p,k)

y = 0;
for p = l : m
    y = y + L(i,p) * U(p,k);
end
