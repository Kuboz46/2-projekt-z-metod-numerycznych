function [Y] = Rozwiaz_uklad_LYB(L, B)
Y = zeros(4, 1);

for k = 1 : 4
        Y(k,1) = (B(k,1) - MojaSuma(k, 1, 1, k - 1, L, Y)) / L(k,k);
end

end