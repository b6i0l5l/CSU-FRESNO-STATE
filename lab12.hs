-- Lab 12: Partitions
import Data.List
-- Sets of Ints as lists. Invariant: sets as lists always has no duplicates
type Set = [Int]

-- Relations on sets of Ints. Invariant: no duplicates
type Rel = [(Int,Int)]

-- Universe (your code should work with any non-empty universe)
u = [1..8]

-- A partitition of u is a set of blocks, each of which is a set of elements
-- of u, which satisfies certain conditions (nontrivial, total, disjoint).
-- For example, here is the partitition of u corresponding to equivalence mod 3:
eqmod3_part :: [[Int]]
eqmod3_part = [[1,4,7], [2,5,8], [3,6]]

cardinal :: Set -> Int
cardinal [] = 0
cardinal (x:xs)= 1 + cardinal xs
-- Write a function, part, that tests whether a list of lists is a partition
-- of u, including that each block is a set (i.e., has no duplicates)
part :: [[Int]] -> Bool
part bs = nontriv bs  && total bs  && disjoint bs
   where
   nontriv xs = and [cardinal x >0|x<-xs]
   total xs = and[or[x`elem`p|p<-xs]|x<-u]
   disjoint xs = and[and[not (x`elem`es)|x<-ds]|ds<-xs,es<-xs,es/=ds]


element :: [Int] -> [[Int]] -> Bool
element n [] =False
element n (x:xs) | n==x=True
                 | otherwise = element n xs

rem_dups :: [[Int]] -> [[Int]]
rem_dups [] =[]
rem_dups (x:xs) | element x xs ==False =x:(rem_dups xs)
                | otherwise = rem_dups xs

-- Write a function, eq2part, that takes an equivalence relation on u as input
-- and returns the associated partition of u. You can assume that the input is
-- really an equivalence relation on u.
eq2part :: Rel -> [[Int]]
eq2part rs = rem_dups[sort[b|(a,b)<-rs,a==x]|x<-u]


-- Write a function part2eq that takes a partition of u as input and returns
-- the associated equivalence relation on u. You can assume that the argument
-- is really a partition of u.
part2eq :: [[Int]] -> Rel
part2eq bs = [(x,y)|a<-bs,x<-a,y<-a]


-- Write a function, kernel, that takes a function on u as input (given as
-- a list of pairs), and returns the associated equivalence relation on u.
-- You can assume that the input is really a function on u.
element2 :: (Int,Int) -> Rel -> Bool
element2 (a,b) [] =False
element2 (a,b) (x:xs) | (a,b)==x=True
                 | otherwise = element2 (a,b) xs
rem_dups2 :: Rel->Rel
rem_dups2 [] =[]
rem_dups2 (x:xs) | element2 x xs ==False =x:(rem_dups2 xs)
                | otherwise = rem_dups2 xs
kernel :: [(Int,Int)] -> Rel
kernel rs =  [(x,a)|(x,y)<-rs,(a,b)<-rs,y==b,x/=a]++ nub [(x,x)|(x,y)<-rs,(a,b)<-rs,y==b,x==a]
