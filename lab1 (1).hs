-- CSci 60 Lab 1

---------------- Part 1 ----------------

-- Work through Chapters 1 - 3 of Learn You a Haskell for Great Good!
-- Type in the examples and make sure you understand the results.
-- Ask questions about anything you don't understand! This is your
-- chance to get off to a good start understanding Haskell.


---------------- Part 2 ----------------

-- The Haskell Prelude has a lot of useful built-in functions related
-- to numbers and lists.  In Part 2 of this lab, you will catalog many
-- of these functions.

data Color = Red | Orange | Yellow | Green | Blue | Violet
     deriving (Show, Eq, Ord, Enum)

-- For each of the Prelude functions listed below, give its type,
-- describe in your own words what the function does, answer any
-- questions specified, and give several examples of its use.  Does
-- the function apply at all to the "Color" type defined above?


-- succ
{-Type:Enum a => a -> a
Explanation: return the next item
Input:succ 5
Output:6
Input:succ Orange
Output:Yellow-}

-- toEnum, fromEnum, enumFrom, enumFromThen, enumFromTo, enumFromThenTo
-- As one of your examples, try  (toEnum 3) :: Color

-- ==, /=

-- quot, div            (Q: what is the difference? Hint: negative numbers)

-- rem, mod             (Q: what is the difference? Hint: negative numbers)

-- quotRem, divMod

-- &&, ||

-- ++

-- compare

-- <, >

-- max, min

-- ^

-- all, any

-- break

-- concat

-- const

-- cycle

-- drop, take

-- dropWhile, takeWhile

-- elem

-- even

-- filter

-- fst

-- gcd

-- head

-- id

-- init

-- iterate

-- last

-- lcm

-- length

-- map

-- null

-- odd

-- repeat

-- replicate

-- reverse

-- snd

-- span

-- splitAt

-- zip
