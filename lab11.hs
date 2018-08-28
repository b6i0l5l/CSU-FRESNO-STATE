---- Lab 11 ----

---- Relations and some examples

-- For this lab, the universe U is [1..8] and all relations are on this.
u = [1..8]

-- A relation, R, on U is a list of ordered pairs of elements of U:
type Reln = [(Int,Int)]

-- As examples, here are the <, <=, =, and /= relations, as well as
-- equivalence mod 3, on u. Take a look at these for inspiration.

lt :: Reln
lt = [(i,j) | j <- u, i <- [1..j-1]]

leq :: Reln
leq = [(i,j) | j <- u, i <- [1..j]]

eq :: Reln
eq = [(i,i) | i <- u]

neq :: Reln
neq = [(i,j) | i <- u, j <- u, i /= j]

eqmod3 :: Reln
eqmod3 = [(i,j) | i <- u, j <- u, (j - i) `mod` 3 == 0]


---------------- Lab 11 begins here ----------------

-- Write a function refl that tests whether a relation is reflexive:
-- R is reflexive if: forall a, (a,a) in R (where quantification is over u)
refl :: Reln -> Bool
refl rs = and [(a,a) `elem` rs|a<-u]

-- Write a function symm that tests whether a relation is symmetric:
-- R is symmetric if: forall a b, (a,b) in R -> (b,a) in R
symm :: Reln -> Bool
symm rs = and [((a,b) `elem` rs)<=((b,a) `elem` rs)|a<-u,b<-u]

-- Write a function trans that tests whether a relation is transitive:
-- R is transistive if: forall a b c, (a,b) in R /\ (b,c) in R -> (a,c) in R
trans :: Reln -> Bool
trans rs = and[(((a,b)`elem` rs)&&((b,c)`elem` rs))<=((a,c)`elem` rs)|a<-u,b<-u,c<-u]

-- Write a function antisymm that tests whether a relation is antisymmetric:
-- R is antisymmetric if: forall a b, (a,b) in R /\ (b,a) in R -> a = b
antisymm :: Reln -> Bool
antisymm rs = and[(((a,b)`elem`rs)&&((b,a)`elem`rs))<=(a==b)|a<-u,b<-u]


-- For each of the 16 possible combinations of yes/no on reflexivity,
-- symmetry, transitivity, and antisymmetry find a MINIMAL relation on u
-- (i.e., one  with the fewest number of pairs) that has exactly that
-- combination of properties, and show the test that confirms the properties.
-- Note: please FIND the relation first, THEN test!! I've done the first one.

-- refl, symm, trans, antisymm
rsta :: Reln
rsta = [(1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8)]
rsta_test = refl rsta && symm rsta && trans rsta && antisymm rsta  -- True

-- refl, symm, trans, not antisymm
rsta' :: Reln
rsta' = [(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(1,2),(2,1)]
rsta'_test = refl rsta' && symm rsta' && trans rsta' && not (antisymm rsta')

-- refl, symm, not trans, antisymm
-- This combination is impossible! (Why?)

-- refl, symm, not trans, not antisymm
rst'a' :: Reln
rst'a' = [(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(1,2),(2,1),(2,3),(3,2)]
rst'a'_test = refl rst'a' && symm rst'a' && not (trans rst'a') && not (antisymm rst'a')

-- refl, not symm, trans, antisymm
rs'ta :: Reln
rs'ta = [(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(4,5)]
rs'ta_test = refl rs'ta && not (symm rs'ta) && trans rs'ta && antisymm rs'ta

-- refl, not symm, trans, not antisymm
rs'ta' :: Reln
rs'ta' = [(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(4,5),(5,4),(5,6),(4,6)]
rs'ta'_test = refl rs'ta' && not (symm rs'ta') && trans rs'ta' && not (antisymm rs'ta')

-- refl, not symm, not trans, antisymm
rs't'a :: Reln
rs't'a = [(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(4,5),(5,6)]
rs't'a_test = refl rs't'a && not (symm rs't'a) && not (trans rs't'a) && antisymm rs't'a

-- refl, not symm, not trans, not antisymm
rs't'a' :: Reln
rs't'a' = [(1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(4,5),(5,6),(6,5)]
rs't'a'_test = refl rs't'a' && not (symm rs't'a') && not (trans rs't'a') && not (antisymm rs't'a')

-- not refl, symm, trans, antisymm
r'sta :: Reln
r'sta = []
r'sta_test = not (refl r'sta) && symm r'sta && trans r'sta && antisymm r'sta

-- not refl, symm, trans, not antisymm
r'sta' :: Reln
r'sta' = undefined [(1,2),(2,1),(2,4),(4,2),(1,4),(4,1)]
r'sta'_test = not (refl r'sta') && symm r'sta' && trans r'sta' && not (antisymm r'sta')

-- not refl, symm, not trans, antisymm
-- This combination is impossible! (Why?)

-- not refl, symm, not trans, not antisymm
r'st'a' :: Reln
r'st'a' = [(1,2),(2,1),(2,3),(3,2)]
r'st'a'_test = not (refl r'st'a') && symm r'st'a' && not (trans r'st'a') && not (antisymm r'st'a')

-- not refl, not symm, trans, antisymm
r's'ta :: Reln
r's'ta = [(1,2)]
r's'ta_test = not (refl r's'ta) && not (symm r's'ta) && trans r's'ta && antisymm r's'ta

-- not refl, not symm, trans, not antisymm
r's'ta' :: Reln
r's'ta' = undefined[(1,2),(2,1),(2,4),(1,4)]
r's'ta'_test = not (refl r's'ta') && not (symm r's'ta') && trans r's'ta' && not (antisymm r's'ta')

-- not refl, not symm, not trans, antisymm
r's't'a :: Reln
r's't'a = [(1,2),(2,3)]
r's't'a_test = not (refl r's't'a) && not (symm r's't'a) && not (trans r's't'a) && antisymm r's't'a

-- not refl, not symm, not trans, not antisymm
r's't'a' :: Reln
r's't'a' = [(1,2),(2,3),(2,1)]
r's't'a'_test = not (refl r's't'a') && not (symm r's't'a') && not (trans r's't'a') && not (antisymm r's't'a')
