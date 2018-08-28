-- Lab 6: Tracing and Boolean warm-up

import Debug.Trace (trace)


---- Functions from earlier labs ----------------------------------------------

-- Implement (efficient) modular exponentiation
-- usage: expmod a n m = b
-- assumes: n >= 0, m >= 2
-- insures: a^n ≡ b (mod m), 0 <= b < m
expmod :: Integer -> Integer -> Integer -> Integer
expmod a 0 m = 1
expmod a n m = let (q,r) = divMod n 2
                   ans = expmod a q m
               in if r == 0 then ans*ans `mod` m else ans*ans*a `mod` m

toBase :: Integer -> Integer -> [Integer]
toBase b n = reverse (toBase' b n) where
  toBase' :: Integer -> Integer -> [Integer]
  toBase' b 0 = []
  toBase' b n = let (q,r) = divMod n b
                in r : toBase' b q

fromBase :: Integer -> [Integer] -> Integer
fromBase b xs = fromBase' b (reverse xs) where
  fromBase' :: Integer -> [Integer] -> Integer
  fromBase' b [] = 0
  fromBase' b (x:xs) = x + b * fromBase' b xs


-- Tracing version of extGCD (from Piazza @81)
extGCD :: Integer -> Integer -> (Integer,Integer,Integer)
extGCD a b | trace (show (a,b)) False = undefined
extGCD a 0 = let ans = (a,1,0) in trace ("---> " ++ show ans) ans
extGCD a b = let (q,r) = divMod a b
                 (d,m,n) = extGCD b r
                 ans = (d,n,m-q*n)
             in trace ("---> " ++ show ans) ans


---- Part 1: Tracing ----------------------------------------------------------

-- Create tracing versions of expmod, toBase, and fromBase above
-- and cut and paste sample output here. Note that you will also need
-- to trace the helper functions toBase' and fromBase'.


---- Part 2: Boolean warm-up --------------------------------------------------

bools = [True, False]


-- We can get a list of all possible outputs of the not and && operations

not_vals = [not p | p <- bools]
and_vals = [p && q | p <- bools, q <- bools]

-- Do the same with the operators ||, <, <=, >, >=,  ==, and /=.

or_vals = undefined
less_vals = undefined
leq_vals = undefined
greater_vals = undefined
geq_vals = undefined
eq_vals = undefined
neq_vals = undefined


-- The expressions p && q and q && p always give the same result, which we
-- can check in two different ways:

and1 = [p && q | p <- bools, q <- bools] == [q && p | p <- bools, q <- bools]
and2 = and [(p && q) == (q && p) | p <- bools, q <- bools]

-- Find combinations of &&, ||, and not that give the same results as
-- each of the other operators above: <, <=, >, >=, ==, and /=, and write a
-- test like either and1 or and2 to check this (it should return True)

less_test = undefined
leq_test = undefined
greater_test = undefined
geq_test = undefined
eq_test = undefined
neq_test = undefined
