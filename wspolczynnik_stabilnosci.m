function wsp_stab = wspolczynnik_stabilnosci(rozw_otrz, rozw_pop, A)
e = blad_wzgledny(rozw_otrz, rozw_pop);
wsp_stab = e / cond(A);
disp('Wsp�czynnik stabilno�ci:');
disp(wsp_stab);
end

