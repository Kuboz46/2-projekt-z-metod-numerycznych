function s = Suma_funkcji(i, j, x, q)
s = 0;
for k = i:j
    d = q(x(k+1,1)); % Wartoœæ funkcji q(x)
    s = s + d(i + 1, 1) * d(j + 1, 1); % d(k + 1, 1) = q_k(x), 
end
end

