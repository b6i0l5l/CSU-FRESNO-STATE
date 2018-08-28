-- CSci 60 Lab 5

---------------- Given Helper Functions ----------------

import System.Random
import System.IO.Unsafe

-- Extended GCD, from earlier lab
extGCD :: Integer -> Integer -> (Integer, Integer, Integer)
extGCD a 0 = (a, 1, 0)
extGCD a b = let (q, r) = divMod a b
                 (d, m, n) = extGCD b r
             in (d, n, m - n*q)

-- Miller-Rabin primality test (made deterministic)
isPrime :: Integer -> Bool
isPrime n = unsafePerformIO (isMillerRabinPrime 100 n)

isMillerRabinPrime :: Int -> Integer -> IO Bool
isMillerRabinPrime k n
   | even n    = return (n==2)
   | n < 100   = return (n `elem` primesTo100)
   | otherwise = do ws <- witnesses k n
                    return $ and [test n (pred n) evens (head odds) a | a <- ws]
  where
    (evens,odds) = span even (iterate (`div` 2) (pred n))

test :: Integral nat => nat -> nat -> [nat] -> nat -> nat -> Bool
test n n_1 evens d a = x `elem` [1,n_1] || n_1 `elem` powers
  where
    x = powerMod n a d
    powers = map (powerMod n a) evens

witnesses :: (Num a, Ord a, Random a) => Int -> a -> IO [a]
witnesses k n
  | n < 9080191         = return [31,73]
  | n < 4759123141      = return [2,7,61]
  | n < 3474749660383   = return [2,3,5,7,11,13]
  | n < 341550071728321 = return [2,3,5,7,11,13,17]
  | otherwise           = do g <- newStdGen
                             return $ take k (randomRs (2,n-1) g)

primesTo100 :: [Integer]
primesTo100 = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]

-- powerMod m x n = x^n `mod` m (efficient version, changed order of arguments)
powerMod :: Integral nat => nat -> nat -> nat -> nat
powerMod m x n  = f (n - 1) x x `rem` m
  where
  f d a y = if d==0 then y else g d a y
  g i b y | even i    = g (i `quot` 2) (b*b `rem` m) y
          | otherwise = f (i-1) b (b*y `rem` m)


---------------- Beginning of Lab 5 ----------------

-- Convert number to base b
-- usage: toBase b n = xs
-- assumes: b >= 2, n >= 0
-- assures: xs = digits of n in base b, from most significant to least
toBase :: Integer -> Integer -> [Integer]
toBase b n = reverse (toBase' b n) where
  -- digits of n in base b, in reverse order (easier to define recursively)
  toBase' :: Integer -> Integer -> [Integer]
  toBase' b 0 = []
  toBase' b n = let (q,r) = divMod n b
                 in  (r:toBase' b q)






-- Convert digits in base b to number
-- usage: fromBase b xs = n
-- assumes: b >= 2, each element of xs is >=0 and <b
-- assures: toBase b n = xs
fromBase :: Integer -> [Integer] -> Integer
fromBase b xs = fromBase' b (reverse xs) where
  -- number associated with digits in base b, given in reverse order
  fromBase' :: Integer -> [Integer] -> Integer
  fromBase' b [] = 0
  fromBase' b (x:xs) = x+b*(fromBase' b xs)



-- nextPrime n returns the least prime number >= n
nextPrime :: Integer -> Integer
nextPrime n | isPrime n = n
            | otherwise = nextPrime (n+1)



-- nextCoprime n m returns the least number >= n that is coprime to m
nextCoprime :: Integer -> Integer -> Integer
nextCoprime n m |gcd n m ==1 = n
                |otherwise = nextCoprime (n + 1) m
