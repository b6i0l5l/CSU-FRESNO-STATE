---- Lab 10 ----

-- Sets (of Ints) as lists
--
-- Sets are collections of elements for which order and duplicates don't matter.
-- So, the set {5,3,2,3,5,2} is the same as the set {2,3,5}. All that matters
-- is which elements are members, in this case 2, 3, and 5 (in no particular
-- order). In Haskell, we can represent sets as lists, although we then have
-- to be careful not to care about the order or introduce duplicates when we
-- compute with them. Here are type definitions for Sets and Relations:

type Set = [Int]
type Reln = [(Int,Int)]

-- Implement the following set functions as LIST RECURSIONS. You are not
-- allowed to use other list operations, like comprehension, map, ++, etc.
-- You can ASSUME that the inputs do not have any duplicates, and must
-- INSURE that the outputs also do not contain duplicates.


-- element x xs = True if x is an element in the set xs
-- Examples: element 3 [5,2,3,6] == True, element 1 [5,2,3,6] == False
element :: Int -> Set -> Bool
element n [] =False
element n (x:xs) | n==x=True
                 | otherwise = element n xs


-- subset xs ys = True if every element of xs is also an element of ys
-- Examples: subset [2,6,3] [5,2,3,6] == True, subset [2,7] [5,2,3,6] == False
subset :: Set -> Set -> Bool
subset [] (y:ys) = True
subset (x:xs) (y:ys) | element x (y:ys) == True = subset xs (y:ys)
                     | otherwise = False




-- cardinal xs = n if the number of elements in xs is n
-- Examples: cardinal [5,2,3,6] = 4, cardinal [2,7] = 2
cardinal :: Set -> Int
cardinal [] = 0
cardinal (x:xs)= 1 + cardinal xs


-- inters xs ys = zs if zs is the INTERSECTION of xs and ys, i.e., all the
-- elements the sets xs and ys have in common.
-- Example: inters [5,2,3,6] [3,7,4,2] = [2,3]
inters :: Set -> Set -> Set
inters [] (y:ys)=[]
inters (x:xs) (y:ys) | element x (y:ys)==True= x:(inters xs (y:ys))
                     |otherwise =inters xs (y:ys)


-- union xs ys = zs if zs is the UNION of xs and ys, i.e., all the
-- elements that appear in either of the sets xs and ys (or both).
-- Example: union [5,2,3,6] [3,7,4,2] = [5,6,3,7,4,2]
union :: Set -> Set -> Set
union [] ys=ys
union (x:xs) (y:ys) | element x (y:ys)==False=x:(union xs (y:ys))
                    |otherwise  = union xs (y:ys)


-- differ xs ys = zs if zs is the DIFFERENCE of xs and ys, i.e., all the
-- elements that appear in xs but do not appear in ys.
-- Example: differ [5,2,3,6] [3,7,4,2] = [5,6]
differ :: Set -> Set -> Set
differ [] ys =ys
differ (x:xs) (y:ys) | element x (y:ys) ==False = x:(differ xs (y:ys))
                     | otherwise = differ xs (y:ys)


-- For these last two, you are allowed to use map and ++ if you want,
-- but still no list coprehensions or other list operators.


-- cart xs ys = zs if zs is the CARTESIAN PRODUCT of xs and ys, i.e.,
-- as if it were defined cart xs ys = [(x,y) | x <- xs, y <- ys]
-- Example: cart [5,2,3] [3,7] = [(5,3),(5,7),(2,3),(2,7),(3,3),(3,7)]
cart :: Set -> Set -> Reln
cart [] ys = []
cart (x:xs) ys = map (\y->(x,y)) ys ++ cart xs ys


-- power xs = zs if zs is the POWERSET of xs, i.e., all sublists of xs.
-- Example: power [5,2,3] = [[],[3],[2],[2,3],[5],[5,3],[5,2],[5,2,3]]
power :: Set -> [Set]
power [] = [[]]
power (x:xs) = map(\a->x:a) (power xs) ++ (power xs)



-- Although sets do not contain duplicates, ordinary lists can, so it may
-- be useful to have functions to detect and  remove duplicates.

-- is_set xs = True if xs does not have any duplicates
-- Examples: is_set [5,3,2,3,5,2] == False, is_set [3,5,2] == True
is_set :: Set -> Bool
is_set [] = True
is_set (x:xs) | element x xs == True = False
              | otherwise = is_set xs


-- rem_dups xs = ys if ys is the list xs with the duplicates removed
-- Example: rem_dups [5,3,2,3,5,2] = [3,5,2]
rem_dups :: Set -> Set
rem_dups [] =[]
rem_dups (x:xs) | element x xs ==False =x:(rem_dups xs)
                | otherwise = rem_dups xs
