-- CSci 60 Lab 4

---- Solution to Extended GCD (again) ----

-- usage: extGCD a b = (d, m, n)
-- assumes: a >= 0, b >= 0
-- insures: d = gcd(a,b), m*a + n*b = d
extGCD :: Integer -> Integer -> (Integer, Integer, Integer)
extGCD a 0 = (a, 1, 0)
extGCD a b = let (q, r) = divMod a b
                 (d, m, n) = extGCD b r
             in (d, n, m - n*q)


---- Part I:  Some helper functions ----

-- Coprime with a list
-- usage: coprime_with x ys = ans
-- assumes: nothing
-- insures: ans == True, if x is coprime with each element of ys
--          ans == False, otherwise
coprime_with :: Integer -> [Integer] -> Bool
coprime_with x ys = undefined

-- Pairwise Coprime
-- usage: pairwise_coprime xs = ans
-- assumes: nothing
-- insures: ans == True, if the elements of the list xs are pairwise coprime
--          ans == False, otherwise
pairwise_coprime :: [Integer] -> Bool
pairwise_coprime xs = undefined


-- Multiplicative inverse (using extGCD)
-- usage: minv a m = ainv
-- assumes: a >= 0, m >= 2, and gcd(a,m) = 1
-- insures: 0 <= ainv < m, a * ainv ≡ 1 (mod m)
minv :: Integer -> Integer -> Integer
minv a m = undefined


---- Part II: Chinese Remainder Theorem and Exponential Mod ----

-- Does a given Chinese Remainder Theorem problem have a solution?
-- usage: crtHasSolution as ms = ans
-- insures: ans == True, if
--                  (1) the lists as and ms are the same length and nonempty,
--                  (2) each element mi of ms satisfies mi >= 2, and
--                  (3) the elements of ms are pairwise coprime;
--          ans == False, otherwise.
crtHasSolution :: [Integer] -> [Integer] -> Bool
crtHasSolution as ms = undefined


-- Is a given number a solution to a CRT problem?
-- usage: crtIsSolution n as ms = ans
-- insures: ans == True, if crtHasSolution as ms == True and n is a solution
--          ans == False, otherwise
crtIsSolution :: Integer -> [Integer] -> [Integer] -> Bool
crtIsSolution n as ms = undefined


-- Chinese Remaninder Theorem
-- usage: crt as ms = ans
-- assumes: nothing
-- insures: ans == Nothing, if crtHasSolution as ms == False
--          ans == Just n, if n is such that crtIsSolution n as ms == True
--                         and 0 <= n < product ms                 
crt :: [Integer] -> [Integer] -> Maybe Integer
crt as ms = undefined


-- Implement (efficient) modular exponentiation
-- usage: expmod a n m = b
-- assumes: n >= 0, m >= 2
-- insures: a^n ≡ b (mod m), 0 <= b < m
expmod :: Integer -> Integer -> Integer -> Integer
expmod a n m = undefined

