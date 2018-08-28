-- CSci 60 Lab 3

---------------- Solution to Part 2 of Lab 2

euclid :: Integer -> Integer -> Integer
euclid a 0 = a
euclid a b = euclid b (mod a b)

extGCD :: Integer -> Integer -> (Integer, Integer, Integer)
extGCD a 0 = (a, 1, 0)
extGCD a b = let (q, r) = divMod a b
                 (d, m, n) = extGCD b r
             in (d, n, m-q*n)


---------------- Part 1: List recursions

-- Read Chapters 5 - 6 of the tutorial (the last chapters I will assign).
-- Using what you read in Ch. 5, provide recursive definitions for the
-- functions below.  Note: each "primed" function should do the same as
-- the "unprimed" Prelude function of the same name.

-- Minimum element in a list, with an error on the empty list
minimum' :: Ord a => [a] -> a
minimum' xs = undefined

-- Sum of the elements in a list
sum' :: Num a => [a] -> a
sum' xs = undefined

-- The result of dropping the first n elements of a list
drop' :: Int -> [a] -> [a]
drop' n xs = undefined

-- Zip together three parallel lists
zip3' :: [a] -> [b] -> [c] -> [(a, b, c)]
zip3' xs ys zs = undefined

-- checks if something is not in a list
notElem' :: Eq a => a -> [a] -> Bool
notElem' x xs = undefined

-- "and" together all Booleans in a list (true if all are true)
and' :: [Bool] -> Bool
and' xs = undefined

-- "or" together all Booleans in a list (true if at least one is true)
or' :: [Bool] -> Bool
or' xs = undefined


---------------- Part 2: Prime factorization (implementing the FTA)

-- Two definitions of the infinite list of primes
primes_slow = sieve [2..] where
  sieve (p:xs) = p : sieve [x | x <- xs, rem x p /= 0]

primes = 2 : primesFrom3 where 
    primesFrom3 = sieve [3,5..] 9 primesFrom3
    sieve (x:xs) b ~ps@(p:q:_)
      | x < b     = x : sieve xs b ps
      | otherwise =     sieve [x | x <- xs, rem x p /= 0] (q^2) (tail ps)

-- Return the prime factorization of n, using factor
primeFact :: Integer -> [Integer]
primeFact n = factor n primes

-- Factor n using factors in ps, using the algorithm described in class.
-- If factor n ps = xs, then xs is a subset of ps and product xs == n.
factor :: Integer -> [Integer] -> [Integer]
factor n ps = undefined

