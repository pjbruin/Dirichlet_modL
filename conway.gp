\\ Conway polynomials

conway = read("conway_polynomials.gp");

conway_polynomial(l, d, v='x) = Mod(Polrev(mapget(conway, [l, d]), v), l);
