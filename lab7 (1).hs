-- CSci 60 Lab 7

bools = [True, False]

-- Similar to one of the answers from Lab 6, the following code exhaustively
-- checks whether not(P) \/ Q is equivalent to P -> Q.
not_equiv = and [(not p || q) == (p <= q) | p <- bools, q <- bools]


-- Write similar defintions that check each of the following equivalences:

-- P /\ Q = Q /\ P                           and is commutative
-- P \/ Q = Q \/ P                           or is commutative
-- P /\ (P -> Q) = P /\ Q
-- P -> (P -> Q) = P -> Q

-- P /\ (Q /\ R) = (P /\ Q) /\ R             and is associative
-- P \/ (Q \/ R) = (P \/ Q) \/ R             or is associative
-- P /\ (Q \/ R) = (P /\ Q) \/ (P /\ R)      and distributes over or
-- P \/ (Q /\ R) = (P \/ Q) /\ (P \/ R)      or distributes over and

-- P -> (Q /\ R) = (P -> Q) /\ (P -> R)      implies distributes over and
-- (P \/ Q) -> R = (P -> R) /\ (Q -> R)
-- P -> (Q -> R) = (P /\ Q) -> R


-- The exclusive-or (xor) operation is equivalent to the /= operator in Haskell
-- Which of the following properties of exclusive-or are true? Answer each by
-- supplying Haskell code to check.

-- xor is commutative
-- xor is associative
-- xor distributes over and
-- xor distributes over or
-- and distributes over xor
-- or distributes over xor
-- implies distributes over xor


-- Translate each of the statements below, first, in a comment after "A: ",
-- into a logical statement involving forall, exists, /\, \/, ->, and not,
-- and then into Haskell code that checks ("brute force") whether the
-- statement is true. The universe of discourse in each case is u. Your
-- code should work with any universe u (try out several!), but here is
-- a particular one you can use (the order of elements shouldn't matter,
-- since both `and` and `or` are commutative):

u = [13,4,12,22,9,1,2,17,5]

-- I'll work the first example in two different ways

-- 1. "Every number that's greater than 2 is greater than 1"
-- A: forall n, (n > 2) -> (n > 1)
prob1  = and [(n > 2) <= (n > 1) | n <- u]    -- direct solution
prob1' = and [n > 1 | n <- u, n > 2]          -- using a bounded quantifier

-- 2. Every number is either greater than 5 or less than 6
-- A: 
prob2 = undefined

-- 3. Every two numbers are comparable with <= (i.e., either one is <=
--    the other or vice-versa)
-- A: 
prob3 = undefined

-- 4. For every odd number, there is a greater even number (use the Haskell
--    predicates odd, even :: Integral a => a -> Bool)
-- A: 
prob4 = undefined

-- 5. For every even number, there is a greater odd number
-- A: 
prob5 = undefined

-- 6. There are two odd numbers that add up to 6
-- A: 
prob6 = undefined

-- 7. There are two even numbers that add up to 20
-- A: 
prob7 = undefined

-- 8. There is a largest number (i.e., there is a number that is >= all numbers)
-- A: 
prob8 = undefined

-- 9. For every two different numbers, there is a third number in between.
-- A:
prob9 = undefined

-- 10. For every number, there is a different number such that there are no
--     numbers between these two.
-- A: 
prob10 = undefined


