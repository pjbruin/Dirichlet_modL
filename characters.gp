\r conway.gp

prime_to_l_part(n, l) = n / l^valuation(n, l);

\\ assume c has order not divisible by l in (Z/mZ)^*
min_degree(l, m, c) = znorder(Mod(l, znorder(Mod(c, m))));

dirichlet_label(l, m, c) =
{
   concat([Str(l), "-", Str(m), ".", Str(c)]);
}

\\ indices for which c has order not divisible by l
indices(l, m) =
{
   [c | c <- [0..m-1], gcd(c, m) == 1 && znorder(Mod(c, m)) % l != 0];
}

\\ format: see data-format.txt
dirichlet_group(l, m) =
{
   my(H = znstar(m, 1),
      order = prime_to_l_part(H.no, l),
      v = [valuation(e, l) | e <- H.cyc],
      cyc = [prime_to_l_part(e, l) | e <- H.cyc],
      gen, gen_labels, labels);
   cyc = [e | e <- cyc, e > 1];
   gen = vector(#cyc, i, lift(Mod(H.gen[i], m)^(l^v[i])));
   gen_labels = [dirichlet_label(l, m, c) | c <- gen];
   labels = [dirichlet_label(l, m, c) | c <- indices(l, m)];
   [l, m, order, cyc, gen_labels, labels];
}

fftolist(x) =
{
   x = component(x, 1);
   x = Vec(x[2..length(x)]);
}

listtoff(y, ff) =
{
   subst(Polrev(y), 'x, ff);
}

\\ format: see data-format.txt
dirichlet_data(l, m, H, c, Hl) =
{
   my(o = charorder(H, c),
      d = znorder(Mod(l, o)),
      f = conway_polynomial(l, d),
      a = ffgen(f, 'a),
      z = a^((l^d - 1)/o),
      conductor = zncharconductor(H, c),
      beta = if(l == 2 || m % l, 0, znconreylog(Hl, c % l)[1]),
      values = [if(gcd(m, x) > 1, [],
		   fftolist(chareval(H, c, x, [z, o])))
		| x <- [0..m-1]],
      values_on_gens = [values[g + 1] | g <- H.gen],
      parity = if(l == 2, "", values[m] != [1]),
      is_primitive = (conductor == m),
      primitive_label = dirichlet_label(l, conductor, c % conductor),
      galois_orbit = [dirichlet_label(l, m, charpow(H, c, l^i))
		      | i <- [0..d-1]]);
   [[l, d, Vecrev(liftint(f))], m, c, conductor, beta, o, parity, is_primitive,
    primitive_label, galois_orbit, H.gen, values_on_gens, values];
}

empty_value_data() =
{
   [[], [1], [[1]], [[[[1]], 1]], 1, 1, []];
}

value_data(x, a) =
{
   my(chi = [-x % characteristic(a), [1]]);
   [x, x, chi, [[chi, 1]], fforder(listtoff(x, a)), 1, [[1]]];
}

\\ format: see data-format.txt
galois_data(H, chi) =
{
   my(field, l, d, f, a, m, c, conductor, beta, o, parity, is_primitive,
      primitive_label, galois_orbit, gens, values_on_gens, values,
      m_prime_to_l, factorisation, kernel, subcyclo, subcyclo_poly);
   [field, m, c, conductor, beta, o, parity, is_primitive,
    primitive_label, galois_orbit, gens, values_on_gens, values] = chi;
   [l, d, f] = field;
   a = ffgen(Mod(Polrev(f), l));
   if(!is_primitive,
      error("non-primitive character"));
   m_prime_to_l = prime_to_l_part(m, l);
   factorisation = factorint(m_prime_to_l);
   kernel = charker(H, c);
   \\ galoissubcyclo does not accept znstar(, 1)
   subcyclo = galoissubcyclo(znstar(m), kernel, 2);
   if(subcyclo[2] != m,
      error("conductors of character and Artin field do not agree"));
   subcyclo_poly = apply(x->Str(x), Vecrev(polredabs(subcyclo[1])));
   ["1.1.1.1", 1, "GL", [l, d, f], m_prime_to_l, Col(factorisation)~,
    beta, "", if(o == 1, "trivial", "cyclic"), concat("C", o),
    [1, o == l^d - 1, 1, 1, o == l^d - 1], o, 1, "trivial", "C1", [1, 1],
    1, [concat([p], value_data(values[p % m + 1], a))
	| p <- primes(25), m % p != 0],
    [concat(["0.0"], value_data(values[-1 % m + 1], a))],
    [concat([p], empty_value_data()) | p <- factorisation[,1]],
    [subcyclo_poly], [["1"]],
    [["Dirichlet character", dirichlet_label(l, m, c)]]];
}

dirichlet_characters(l, m, H, Hl) =
{
   apply(c -> dirichlet_data(l, m, H, c, Hl), indices(l, m));
}

generate_data(l_bound, m_bound) =
{
   forprime(l = 1, l_bound,
	    Hl = znstar(l, 1);
	    for(m = 1, m_bound,
	       H = znstar(m, 1);
	       d = znorder(Mod(l, prime_to_l_part(lcm(H.cyc), l)));
	       if(mapisdefined(conway, [l, d]),
		  write("dirichlet_groups.txt", dirichlet_group(l, m));
		  \\ Dirichlet data for all characters
		  chars = dirichlet_characters(l, m, H, Hl);
		  apply(c -> write("dirichlet_characters.txt", c), chars);
		  \\ Artin data for primitive characters
		  chars = [galois_data(H, c) | c <- chars, c[8]];
		  apply(c -> write("galois_characters.txt", c), chars))));
}

generate_data(5, 6);
