function e = blad_wzgledny(rozw_otrz, rozw_pop)
% Funkcja przyjmuje rozwi�zanie otrzymane oraz rozwi�zanie poprawne.
e = norm(rozw_otrz - rozw_pop) / norm(rozw_pop);
disp('B��d wzgl�dny:');
disp(e);
end

