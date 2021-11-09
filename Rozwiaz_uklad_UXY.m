function [X] = Rozwiaz_uklad_UXY(U, Y)
X = zeros(4, 1);

for k = 4:-1:1
        X(k,1) = Y(k,1) - MojaSuma(k, 1, k + 1, 4, U, X);
end

end