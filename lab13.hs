-- Lab 13: Partial Orders

type Set = [Int]
type Rel = [(Int,Int)]

u :: Set
u = [1..8]


-- For your information, here are tests for reflexivity, symmetry,
-- transitivity, and antisymmetry, along with a test for partial order
refl :: Rel -> Bool
refl ps = and [elem (x,x) ps | x <- u]

symm :: Rel -> Bool
symm ps = and [elem (y,x) ps | (x,y) <- ps]

trans :: Rel -> Bool
trans ps = and [elem (x,z) ps | (x,y1) <- ps, (y2,z) <- ps, y1 == y2]

antisymm :: Rel -> Bool
antisymm ps = and [not (elem (y,x) ps) | (x,y) <- ps, x /= y]

poset :: Rel -> Bool
poset ps = refl ps && trans ps && antisymm ps


-- A few example partial orders on u (develop some more yourself!)

eq = [(i,i) | i <- u]
leq = [(i,j) | i <- u, j <- [i..8]]
divis = [(i,j) | (i,j) <- leq, j `mod` i == 0]
two_by_four = [(i,j) | (i,j) <- leq, even i <= even j]


---- Lab 13 begins here ----

-- Note: all functions below can assume that poset ps == True (you don't need
-- to check this).


-- Least element of a subset of a poset (if it exists)
-- least ps xs == Just a, if a is the least element of xs
-- least ps xs == Nothing, if xs has no least element
least :: Rel -> Set -> Maybe Int
least ps xs = let m = [a|a<-xs,and[(a,b)`elem`ps|b<-xs]]
              in if m==[]then  Nothing else Just (head m)


-- Greatest element of a subset of a poset (if it exists)
-- greatest ps xs == Just a, if a is the greatest element of xs
-- greatest ps xs == Nothing, if xs has no greatest element
greatest :: Rel -> Set -> Maybe Int
greatest ps xs = let m = [a|a<-xs,and[(b,a)`elem`ps|b<-xs]]
              in if m==[]then Nothing else Just (head m)

-- Least upper bound of two elements of a poset (if it exists)
lub :: Rel -> Int -> Int -> Maybe Int
lub ps x y = let m =[z|z<-u,(x,z)`elem`ps,(y,z)`elem`ps]
            in if m==[]then Nothing else Just (head m)

-- Greatest lower bound of two elements of a poset (if it exists)
glb :: Rel -> Int -> Int -> Maybe Int
glb ps x y = let m =[z|z<-u,(z,x)`elem`ps,(z,y)`elem`ps]
            in if m==[]then Nothing else Just (head m)

-- linear ps == True if ps is a linear order
linear :: Rel -> Bool
linear ps = and[(a,b)`elem`ps || (b,a)`elem`ps|a<-u,b<-u]

-- lattice ps == True if ps is a lattice
lattice :: Rel -> Bool
lattice ps = least1 ps && greatest1 ps && lub1 ps && glb1 ps
        where
        least1 ps = least ps u /= Nothing
        greatest1 ps =greatest ps u /=Nothing
        lub1 ps = and [or[lub ps a b/=Nothing]|a<-u,b<-u]
        glb1 ps = and[or[glb ps a b /=Nothing]|a<-u,b<-u]

-- Coverings of an element in a poset
coverings :: Rel -> Int -> Set
coverings ps x = [y|y<-u,(a,b)<-ps,a/=b,b==y,a==x,not(or[True|(c,z)<-ps,(z',d)<-ps,z/=x,z'/=y,z==z',a==c,d==b])]


-- Minimal elements of a subset of a poset
minimal :: Rel -> Set -> Set
minimal ps xs = [a|a<-xs,and[((b,a)`elem`ps)<=(b==a)|b<-xs]]


removedup :: Set->Set->Set
removedup [] ys = []
removedup (x:xs) ys | x`elem`ys = removedup xs ys
                    | otherwise = x:removedup xs ys
-- Topological sorting of a subset of a poset
topsort :: Rel -> Set -> Set
topsort ps [] = []
topsort ps xs = let ys = minimal ps xs
                in ys ++ topsort ps (removedup xs ys)
