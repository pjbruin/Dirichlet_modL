# Dirichlet characters mod &#8467;
In this repository we store raw data for the collection [Dirichlet_char_modl] in the database [mod_l_eigenvalues] for the [LMFDB](https://github.com/LMFDB/lmfdb).

Notation:
* &#8467; is a prime
* GF(&#8467;) is the finite field of size l
* Conway(&#8467;,d)(T) is the Conway polynomial of degree d over GF(l) in the indeterminate T
* F is the model GF(&#8467;)[T] / Conway(&#8467;,d)(T) of the finite field of size &#8467;^d, and t is the image of T in F
* m is an integer
* We decompose m as m' × &#8467;^v, where m' is prime to &#8467;
* We consider a (not necessarily primitive) character X : (Z/mZ)* -> F*
* Z&#8467; is the ring of &#8467;-adic integers
* Teich : (Z/&#8467;Z)* -> Z&#8467;* is the Teichmüller lift, so that Teich(x) is the unique (&#8467;-1)^th root of 1 that is congruent to x mod l
* C is the field of the complex numbers
* mu(n) is the group of n-th roots of 1 in C
* e(x) is exp(2 Pi I x).

The label of the character X is of the form &#8467;.d-m-i, where &#8467;,d, and m are defined above, and i is an index which lies in (Z/mZ)* which we now define.

By CRT, X factors uniquely as X' × Y, where X': (Z/m'Z)* -> GF(&#8467;^d)* and Y : (Z/&#8467;^v Z)* -> F*. The m'-part of i will come from X', and the &#8467;-part of i will come from Y.

* Embed F* into mu(&#8467;^d-1) by sending t to e(1/(l^d-1)). This allows us to view X' as a character from (Z/m'Z)* to C*. This character has a Conrey index i' which lies in (Z/m'Z)*.

* Since F* has no l-torsion, the conductor of Y is either 1 or l. Either way, Y factors as a character (Z/&#8467;Z)* -> F*, which must assume values in GF(l)*. Let Conway(&#8467;,1)=T-g where g in GF(&#8467;)* is a generator of GF(&#8467;)*. Identify canonically (Z/&#8467;Z)* = GF(&#8467;)*, and let h = Y(g), and element of (Z/&#8467;Z)*. Let j be the image of Teich(h) in (Z/&#8467;^v Z)*.

The index i is defined by CRT as the unique element of (Z/mZ)* that is i' mod m' and j mod &#8467;^v.



# Dirichlet groups mod &#8467;
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
