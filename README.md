# Dirichlet characters mod l 
In this repository we store raw data for the collection [Dirichlet_char_modl] in the database [mod_l_eigenvalues] for the [LMFDB](https://github.com/LMFDB/lmfdb).

Notation:
* l is a prime
* GF(l) is the finite field of size l
* Conway(l,d)(T) is the Conway polynomial of degree d over GF(l) in the indeterminate T
* F is the model GF(l)[T] / Conway(l,d)(T) of the finite field of size l^d, and t is the image of T in F
* m is an integer
* We decompose m as m' × l^v, where m' is prime to l
* We consider a (not necessarily primitive) character X : (Z/mZ)* -> F*
* Zl is the ring of l-adic integers
* Teich : (Z/lZ)* -> Zl* is the Teichmüller lift, so that Teich(x) is the unique (l-1)^th root of 1 that is congruent to x mod l
* C is the field of the complexes, I²=-1
* mu(n) is the group of n-th roots of 1 in C
* e(x) is exp(2 Pi I x).

The label of the character chi is of the form l.d-m-i, where l,d, and m are defined above, and i is an index which lies in (Z/mZ)* which we now define.

By CRT, X factors uniquely as X' × Y, where X': (Z/m'Z)* -> GF(l^d)* and Y : (Z/l^v Z)* -> F*. The m'-part of i will come from X', and the l-part of i will come from Y.

* Embed F* into mu(l^d-1) by sending t to e(1/(l^d-1)). This allows us to view X' as a character from (Z/m'Z)* to C*. This character has a Conrey index i' which lies in (Z/m'Z)*.

* Since F* has no l-torsion, the conductor of Y is either 1 or l. Either way, Y factors as a character (Z/lZ)* -> F*, which must assume values in GF(l)*. Let Conway(l,1)=T-g where g in GF(l)* is a generator of GF(l)*. Identify canonically (Z/lZ)* = GF(l)*, and let h = Y(g), and element of (Z/lZ)*. Let j be the image of Teich(h) in (Z/l^v Z)*.

The index i is defined by CRT as the unique element of (Z/mZ)* that is i' mod m' and j mod l^v.



# Dirichlet groups mod l
In this repository we store raw data for the collection [Dirichlet_gp_modl] in the database [mod_l_eigenvalues] for the [LMFDB](https://github.com/LMFDB/lmfdb).

# Finite fields database

In this repository we store raw data for the collection [finite_fields] in the database [mod_l_eigenvalues] for the [LMFDB](https://github.com/LMFDB/lmfdb).

This collection contains the following data: each entry represents a finite field in the follwoing format:
 - characteristic: (int) characteristic of the finite field
 - degree: (int) degree of the finite field 
 - polynomial: (list of ints) coefficient of the minimal polynomial of a generator of the field 
 - conway: (Boolean) 1 True 0 False (at the moment all fields in the database are given by Conway polynomials)
 
A requirement for the choice of the representation of the finite field is compatibility between roots of unity and field extensions.
The database includes the sage library ConwayPolynomials. 

Here is one entry in the database:
```
{u'polynomial': [2, 1, 1, 0, 1, 4, 3, 4, 2, 2, 0, 2, 3, 4, 4, 0, 4, 4, 0, 3, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 1], 
u'characteristic': 5, 
u'_id': ObjectId('58d00706ffe979233bcc472a'), 
u'degree': 30, 
u'conway': 1}
```
