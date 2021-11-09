% MENU
clear 
clc
zakoncz_program = 14;
kontrol = 1;
while kontrol ~= zakoncz_program 
    kontrol = menu('Aproksymacja œredniokwadratowa dyskretna', 'Podaj funkcjê f', 'Wyznacz c', 'Wyznacz macierz M i macierz Grama', 'Oblicz wskaŸnik uwarunkowania macierzy G', 'Oblicz wspó³czynnik stabilnoœci', 'Oblicz wspó³czynnik poprawnoœci', 'Oblicz b³¹d wzglêdny', 'Wyznacz wêz³y Czebyszewa', 'Podaj wêz³y x_0, ..., x_n', 'f(x) = x', 'f(x) = 1 + sin(x)', 'f(x) = x^2', 'Rysuj wykres funkcji', 'Zakoñcz program.');
    switch kontrol
        case 1
            f = input('Podaj funkcjê f.');
        case 2 
            c = Najmniejszy_blad_sredniokwadratowy(M,f, x, n);
        case 3  
            q_0 = @(t) 1;
            q_1 = @(t) t;
            q_2 = @(t) sin(t);
            q_3 = @(t) exp(-t);
            q = @(t) [q_0(t), q_1(t), q_2(t), q_3(t)]';
            M = zeros(n+1,4);
            for i = 1:n+1
                for j = 1:4
                    a = q(x(i,1));
                    M(i,j) = a(j,1);
                end
            end
            G=M'*M;
        case 4
            % Obliczanie wskaŸnika uwarunkowania macierzy G metod¹ Gaussa.
            I = eye(4);
            GI = [G I];          
            for i = 1:4
                for j = (i + 1):4
                    GI(j, (1:8)) = GI(j, (1:8)) - (GI(j,i) / G(i,i)) * GI(i, (1:8));
                end
            end
            for i = 1:4
                GI(i,(1:8)) = (1/G(i,i))*GI(i,(1:8));
            end
            for j = 2:4
                for i = 1: (j - 1)
                    GI(i,(1:8)) = GI(i, (1:8)) - GI(j, (1:8)) * GI(i, j);
                end
            end
            Ginv = GI((1:4),(5:8));
            wsk_uwarunkowania = norm(Ginv) * norm(G);
        case 5
            wspolczynnik_stabilnosci(c, rozw_pop, G);
        case 6
            wspolczynnik_poprawnosci(G,g,c);
        case 7
            blad_wzgledny(c, rozw_pop)
        case 8
             n = input('Ile chcesz wêz³ów ') - 1;
             x = zeros(n, 1);
            for i = 0:n
                x(i + 1, 1) = cos(((2 * i + 1) * pi) / (2*n+2));
            end
        case 9
            n = input('Ile chcesz wêz³ów ') - 1;
            disp('Podaj x');
            x = input('x=      '); % linspace(-pi,pi,n)
        case 10
            f = @(t) t;
        case 11
            f = @(t) 1 + sin(t);
        case 12
            f = @(t) t.^2;
        case 13            
            fun1 = @(t) c(1) + c(2).*t + c(3).*sin(t) + c(4).*exp(-t); 
            p = linspace(x(1), x(n + 1), 100);
            p = p(:);
            y1 = zeros(n + 1, 1); % Funkcja aproksymuj¹ca 
            y2 = zeros(100, 1); % Funkcja aproksymowana
            for i = 1:50
                z = p(i);
                y2(i) = f(z);
            end
            for i=1:n + 1
                z = x(i);
                y1(i) = fun1(z);                
            end            
            y1 = y1(:);
            y2 = y2(:);            
            hold on
            plot(p, y2);
                        
            ph1 = plot(x,y1);
            set(ph1,'MarkerEdgeColor', 'black', 'MarkerFaceColor', 'black');
            set(ph1,'Marker', '+', 'MarkerSize', 5);
            set(ph1,'LineStyle', 'none');
                                
            hold off
        case 14
            disp('Koniec programu.');
            return;
    end
end
