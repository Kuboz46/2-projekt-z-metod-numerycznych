function c = Najmniejszy_blad_sredniokwadratowy(M, f, x, n)
% Funkcja wyznacza c = (c_0, c_1, c_2, ..., c_n)' tak, aby znimalizowaæ
% wartoœæ wyra¿enia g(c_0, c_1, c_2, ..., c_n) = (f_0 - q(x_0))^2 + .... +
% (f_n - q(x_n))^2, gdzie f jest funkcj¹ aproksymowan¹, natomiast q funkjc¹
% aproksymuj¹c¹.
p = zeros(n + 1, 1);
f1 = zeros(n + 1, 1);
for i = 1:n+1
   % p(i,1) = f(x(i,1)); %x(i,1) = x_0
   f1(i)=f(x(i));
end
G = M'*M;
f1 = f1(:);
g=M'*f1
%
disp('Macierz M');
disp(M);
[a_1, b_1] = size(G);
            if (a_1 ~= 4)
                disp('Liczba wierszy macierzy G nie jest równa 4!');
                return;           
            end
            if(rank(G) ~= 4)
                disp('Rz¹d macierzy G nie jest równy 4!. Rozwi¹zanie nie jest jednoznaczne.');
                return;
            end
            L = zeros(4, 4);
            U = eye(4, 4);
            
            for k = 1 : 4
                for i = k : 4
                    L(i,k) = G(i, k) - MojaSuma(i, k, 1, k - 1, L, U);
                end
                for j = k + 1 : 4
                    U(k, j) = (G(k, j) - MojaSuma(k, j, 1, k - 1, L, U)) / L(k, k);
                end
            end
            y = Rozwiaz_uklad_LYB(L, g); % Moja funkcja -tutaj L jest trojkatna dolna
            c = Rozwiaz_uklad_UXY(U, y);  % Moja funkcja -tutaj U jest trojkatna gorna              
end

