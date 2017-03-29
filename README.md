# Dirichlet characters mod l 
In this repository we store raw data for the collection [Dirichlet_char_modl] in the database [mod_l_eigenvalues] for the [LMFDB](https://github.com/LMFDB/lmfdb).


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
