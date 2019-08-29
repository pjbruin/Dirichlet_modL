def dirichlet_character_label(chi):
    """
    Return the LMFDB label of `\chi`.

    INPUT:

    - ``chi`` -- a :class:`DirichletCharacter` with values in a finite
      field

    TESTS::

        sage: G = DirichletGroup(55, GF(11))
        sage: chi = G([1, 2])
        sage: dirichlet_character_label(chi)
        '11-55.46'
    """
    G = chi.parent()
    m = G.modulus()
    l = G.base_ring().characteristic()
    z = G.zeta()
    o = G.zeta_order()
    H = pari('znstar({},1)'.format(m))
    cyc = H.getattr('cyc')
    gen = H.getattr('gen')
    v = [chi(g).log(z) * c/o for c, g in zip(cyc, gen)]
    c = H.znconreyexp(v)
    return "{}-{}.{}".format(l, m, c)

def dirichlet_character_from_label(label):
    """
    Return the Dirichlet character with the given LMFDB label.

    TESTS::

        sage: chi = dirichlet_character_from_label('11-55.46')
        sage: chi(12)
        1
        sage: chi(46)
        2
    """
    l, mc = label.split('-')
    m, c = mc.split('.')
    l, m, c = map(ZZ, (l, m, c))
    o = Mod(c, m).multiplicative_order()
    d = Mod(l, o).multiplicative_order()
    F.<a> = GF(l^d, modulus='conway')
    G = DirichletGroup(ZZ(m), F, zeta=a)
    H = pari('znstar({},1)'.format(m))
    z = a^(G.zeta_order() / o)
    chi = G([z^(o*H.chareval(c, g)) for g in G.unit_gens()])
    return chi

def all_dirichlet_characters(l, m):
    """
    Return labels and values for all Dirichlet characters modulo `m`
    with values in a suitable finite field of characteristic `l`.

    TESTS::

        sage: all_dirichlet_characters(7, 5)
        [['7-5.1', [0, 1, 1, 1, 1]],
         ['7-5.2', [0, 1, 6*a + 4, a + 3, 6]],
         ['7-5.4', [0, 1, 6, 6, 1]],
         ['7-5.3', [0, 1, a + 3, 6*a + 4, 6]]]
        sage: def test(l, m):
        ....:     labels = [x[0] for x in all_dirichlet_characters(l, m)]
        ....:     chars = map(dirichlet_character_from_label, labels)
        ....:     return labels == map(dirichlet_character_label, chars)
        sage: test(3, 8)
        True
        sage: test(11, 55)
        True
    """
    U = Zmod(m).unit_group()
    d = Mod(l, U.exponent()).multiplicative_order()
    F.<a> = GF(l^d, modulus='conway')
    G = DirichletGroup(m, F, zeta=a)
    return [[dirichlet_character_label(chi), chi.values()] for chi in G]

def galois_character_label(chi):
    """
    Return the LMFDB label of `\chi`.

    INPUT:

    - ``chi`` -- a Galois character with values in a finite field
    """
    raise NotImplementedError
