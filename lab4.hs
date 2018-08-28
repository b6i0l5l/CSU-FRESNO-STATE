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
coprime_with x []= True
coprime_with 0 ys= False
coprime_with x ys|gcd x (head ys) == 1 = coprime_with x (tail ys)
coprime_with x ys|otherwise = False





-- Pairwise Coprime
-- usage: pairwise_coprime xs = ans
-- assumes: nothing
-- insures: ans == True, if the elements of the list xs are pairwise coprime
--          ans == False, otherwise
pairwise_coprime :: [Integer] -> Bool
pairwise_coprime (x:[]) = True
pairwise_coprime (x:xs) | coprime_with x xs == True = pairwise_coprime xs
                        | otherwise = False

-- Multiplicative inverse (using extGCD)
-- usage: minv a m = ainv
-- assumes: a >= 0, m >= 2, and gcd(a,m) = 1
-- insures: 0 <= ainv < m, a * ainv ≡ 1 (mod m)
minv :: Integer -> Integer -> Integer
minv 1 m = 1
minv a m = let (d,m',n)=extGCD a m
           in m'




---- Part II: Chinese Remainder Theorem and Exponential Mod ----

-- Does a given Chinese Remainder Theorem problem have a solution?
-- usage: crtHasSolution as ms = ans
-- insures: ans == True, if
--                  (1) the lists as and ms are the same length and nonempty,
--                  (2) each element mi of ms satisfies mi >= 2, and
--                  (3) the elements of ms are pairwise coprime;
--          ans == False, otherwise.
crtHasSolution :: [Integer] -> [Integer] -> Bool
crtHasSolution as ms =  let cond1 = length as == length ms && as/=[]  && ms /=[]
                            cond2 = all(>=2)ms
                            cond3 = pairwise_coprime ms
                        in cond1 && cond2 && cond3



-- Is a given number a solution to a CRT problem?
-- usage: crtIsSolution n as ms = ans
-- insures: ans == True, if crtHasSolution as ms == True and n is a solution
--          ans == False, otherwise
crtIsSolution :: Integer -> [Integer] -> [Integer] -> Bool
crtIsSolution n as ms = crtHasSolution as ms && map (mod n) ms == as





-- Chinese Remaninder Theorem
-- usage: crt as ms = ans
-- assumes: nothing
-- insures: ans == Nothing, if crtHasSolution as ms == False
--          ans == Just n, if n is such that crtIsSolution n as ms == True
--                         and 0 <= n < product ms
crt :: [Integer] -> [Integer] -> Maybe Integer
crt as ms | crtHasSolution as ms == False = undefined
          | otherwise = let prod = product ms
                          mseive = map (div prod) ms
                          minvs = zipWith (minv) mseive ms
                          n = zipWith3 (\a b c -> a * b * c) as mseive minvs
                      in Just ((sum n)`mod` prod)


-- Implement (efficient) modular exponentiation
-- usage:expmod a n m = b
-- assumes: n >= 0, m >= 2
-- insures: a^n ≡ b (mod m), 0 <= b < m
expmod :: Integer -> Integer -> Integer -> Integer
expmod a 0 m   = 1
expmod a n m   = let (q,r)=divMod n 2
                     ans = expmod a q m
                     in (ans^2)*(a^r) `mod` m
