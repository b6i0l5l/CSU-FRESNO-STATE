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
{-
Type:Enum a => a -> a
Explanation: returns the next item
Input:succ 5
Output:6
Input:succ Orange
Output:Yellow
-}

--pred
{-
Type:Enum a => a -> a
Explanation: returns the previous item
Input:pred 6
Output:5
Input:pred Yellow
Output:Orange
-}

-- toEnum, fromEnum, enumFrom, enumFromThen, enumFromTo, enumFromThenTo
-- As one of your examples, try  (toEnum 3) :: Color

--toEnum
{-
Type:Enum a => Int -> a
Explanation:returns the item which is the position you enter from the enumeration
Input:toEnum 5::Color
Output:Violet
Input:toEnum 2::Color
output:Yellow
-}

--fromEnum
{-
Type:Enum a => a -> Int
Explanation:returns the position of the item of the enumeration
Input:fromEnum Yellow
Output:2
Input:fromEnum Orange
output:1
-}

--enumFrom
{-
Type:Enum a =>  a -> [a]
Explanation:returns an array of members of an enumeration starting with the argument
Input:enumFrom Yellow
Output:[Yellow,Green,Blue,Violet]
Inout:enumFrom Green
Output:[Green,Blue,Violet]
-}

--enumFromThen
{-
Type:Enum a => a -> a -> [a]
Explanation:returns an array of members of an enumeration starting with the first argument and distance to the second one
Input:enumFromThen Red Orange
Output:[Red,Orange,Yellow,Green,Blue,Violet]
Input: enumFromThen Red Yellow
Output:[Red,Yellow,Blue]
-}

--enumFromTo
{-
Type:Enum a =>  a -> a -> [a]
Explanation:returns an array of members of an enumeration starting with the first argument and finishing till the second one
Input: enumFromTo Red Yellow
Output:[Red,Orange,Yellow]
Input: enumFromTo Red Blue
Output:[Red,Orange,Yellow,Green,Blue]
-}

--enumFromThenTo
{-
Type:Enum a =>  a -> a -> a -> [a]
Explanation:returns an array of members of an enumeration starting with the first argument and finishing with the third one in distances determined by the second one
Input:enumFromThenTo Red Yellow Violet
Output:[Red,Yellow,Blue]
Input: enumFromThenTo Red Orange Blue
output:[Red,Orange,Yellow,Green,Blue]
-}

-- ==, /=

-- ==
{-
Type:Eq a => a -> a -> Bool
Explanation:returns true if it is equal, and return false if it is not equal
Input:2==3
Output:False
Input:3==3
Output:True
-}

-- /=
{-
Type:Eq a => a -> a -> Bool
Explanation:returns False if it is equal, and return true if it is not equal
Input:2/=3
Output:True
Input:2/=2
Output:False
-}


-- quot, div            (Q: what is the difference? Hint: negative numbers)

--quot
{-
Type:Integral a => a -> a -> a
Explanation:integer division, it divides the first argument by the second one discarding remainder
Input: 33 `quot`11
Output:3
Input: 33`quot`10
Output:3
Input:33`quot`(-10)
Output:-3
-}

--div
{-
Type:Integral a => a -> a -> a
Explanation:returns how many times the first number can be divided by the second one
Input:33 `div`11
Output:3
Input: 33`div`10
Output:3
Input:33`div`(-11)
Output:-4
-}

{-
Different between div and quot is on the second argument.
quot:33`quot`(-10)=> (-10)*(-3)+3=33, returns 3
div:33`div`(-10)=> (-10)*(-4)-6=33, returns -4
-}

-- rem, mod             (Q: what is the difference? Hint: negative numbers)

--rem
{-
Type: Integral a => a -> a -> a
Explanation:returns reminder of integer division of the arguments
Input:33 `rem`10
Output:3
Input:24`rem`10
Output:4
Input:33`rem`(-10)
Output:3
-}

--mod
{-
Type: Integral a => a -> a -> a
Explanation:returns the remainder which  first argument / second argument
Input:33 `mod`10
Output:3
Input:24`mod`10
Output:4
Input:33`mod`(-10)
Output:-7
-}

{-
Different between rem and mod
rem: 33`rem`(-10)   => (-10)*(-3)+3=33, returns 3
mod: 33`mod`(-10)   =>(-10)*(-4)-7=33, returns -7
-}

-- quotRem, divMod

--qutoRem
{-
Type:Integral a => a -> Rational
Explanation:returns the result of the division and reminder
Input: quotRem 4 3
Output:(1,1)
Input: quotRem 10 5
Output:(2,0)
-}

--divMod
{-
Type:Integral a => a -> a -> (a,a)
Explanation:returns a tuple containing the result of integral division and modulo
Input:divMod 10 5
Output:(2,0)
Input: divMod 10 (-5)
Output:(-2,0)
-}

-- &&, ||

{-
Type:Bool -> Bool -> Bool
Explanation:is "and" operator, a && b = both a and b are correct, then returns true, else returns false
Input: True && True
Output:True
Input: True && False
Output:False
-}

-- ||
{-
Type:Bool -> Bool -> Bool
Explanation:is "or" operator, a || b = one of a and b is correct, then returns ture
Input: True || True
Output:True
Input:True || False
Output: True
-}

-- ++
{-
Type: [a] -> [a] -> [a]
Explanation:combines two items
Input:[1,2,3]++[5,5]
Output:[1,2,3,5,5]
Input:"Hi"++" MIKE"
Output:"Hi MIKE"
-}

-- compare
{-
Type: Ord a => a -> a -> Ordering
Explanation:compares the first argument and second one. If it is less then return (LT). If it is equal then return (EQ). If it is greater then return (GT).
Input:compare 55 63
Input:compare "AA" "AZ"
output:LT
Input: compare 55 55
Output:EQ
-}

-- <, >
-- <
{-
Type: Ord a => a -> a -> Bool
Explanation:compares first argument and second one. If it is less return True, else return False.
Input:66<55
Output:False
Input:"ADS"<"ACS"
Output:False
-}

-- >
{-
Type: Ord a => a -> a -> Bool
Explanation:compares first argument and second one. If it is greater return True, else return False.
Input:66>55
Output:True
Input:"ADS">"ACS"
Output:True
-}

-- max, min
-- max
{-
Type: Ord a => a -> a -> a
Explanation:returns the larger one of two arguments
Input:max 5 10
Output:10
Input:max "ADS" "ACS"
Output:"ADS"
-}

-- min
{-
Type: Ord a => a -> a -> a
Explanation:returns the smaller one of two arguments
Input:min 5 10
Output:5
Input:min "ADS" "ACS"
Output:"ACS"
-}

-- ^
{-
Type: (Num a, Integral b) => a -> b -> a
Explanation:exponentiate of the argument
Input:2^2
Output:4
Input:3^2
Output:9
-}

-- all, any
-- all
{-
Type: Foldable t => (a -> Bool) -> t a -> Bool
Explanation:returns True if all the items in the list fulfills the condition
Input: all(==1)[1,1,0,1,1]
Output:False
Input: all(>5)[10,6,9,15]
Output:True
-}

-- any
{-
Type:  Foldable t => (a -> Bool) -> t a -> Bool
Explanation:returns True if at least one item in the list fulfills the condition
Input: any(==1)[1,5,3]
Output:True
Input: any(>5)[1,2,3,4]
Output:False
-}

-- break
{-
Type:(a -> Bool) -> [a] -> ([a], [a])
Explanation:seperates two tuple when the item matches the condition
Input:break(==5)[6,5,8,9]
Output:([6],[5,8,9])
Input: break(=="A")["G","A","R"]
Output:(["G"],["A","R"])
-}

-- concat
{-
Type: Foldable t => t [a] -> [a]
Explanation:returns a list of lists and concatenates them
Input:concat[[5,8],[6,9]]
Output:[5,8,6,9]
Input:concat[["B","DD"],["A","F"]]
Output:["B","DD","A","F"]
-}

-- const
{-
Type: a -> b -> a
Explanation:const the first argument
Input: const 1 2
Output:1
Input:const 12 3
Output:12
-}

-- cycle
{-
Type:[a] -> [a]
Explanation:returns a circular list from a infinite one
Input:cycle[1,2]
Output:[1,2,1,2,1..]
Input:cycle["A","F"]
Output:["A","F","A"..]
-}

-- drop, take
-- drop
{-
Type: Int -> [a] -> [a]
Explanation:drops the items which you want and returns rest of the arguments
Input:drop 3 [1,2,3,4,5,6,8]
Output:[4,5,6,8]
Input:drop drop 2 ["A","B","C"]
Output:["C"]
-}

-- take
{-
Type: Int -> [a] -> [a]
Explanation:creates a list and determines how many items should be in the list from the arguments
Input: take 3 [1,2,3,4,5,6,8]
Output:[1,2,3]
Input:take 2 ["A","B","C"]
Output:["A","B"]
-}

-- dropWhile, takeWhile
-- dropWhile
{-
Type: (a -> Bool) -> [a] -> [a]
Explanation:creates a list from another one, it inspects the original list and takes from it its elements from the moment when the condition fails for the first time till the end of the list
Input: dropWhile(<5) [1,2,9,5,6]
Output:[9,5,6]
Input:dropWhile(>5)[1,2,9,5,6]
Output:[1,2,9,5,6]
-}

-- takeWhile
{-
Type: (a -> Bool) -> [a] -> [a]
Explanation:creates a list from another one, when the condtion fails then it stop taking items from the list
Input:takeWhile(>2)[1,2,3,4,5,6,7,8]
Output:[]
Input:takeWhile (<3)[1,2,3,4,5,6,7]
Output[1,2]
-}

-- elem
{-
Type:(Eq a, Foldable t) => a -> t a -> Bool
Explanation:returns true when the item is in the lists
Input: elem 1 [2,5,6,8,1]
Output:True
Input: elem "A" ["B","f","A"]
Output:True
-}

-- even
{-
Type: Integral a => a -> Bool
Explanation:returns True if it is even,else returns False
Input:even 2
Output:True
Input:even 3
Output:False
-}

-- filter
{-
Type:(a -> Bool) -> [a] -> [a]
Explanation:returns a list constructed from members of a list (the second argument) fulfilling a condition given by the first argument
Input:filter(>5)[5,8,1,2,6,9]
Output:[8,6,9]
Input:filter(=="A")["A","G","A","V"]
Output:["A","A"]
-}

-- fst
{-
Type: (a, b) -> a
Explanation:returns the first item of the tuple
Input:fst(1,20)
Output:1
Input:fst(5,20)
Output:5
-}

-- gcd
{-
Type:Integral a => a -> a -> a
Explanation:returns the great common divisor of two arguments
Input: gcd 12 2
Output:2
Input:gcd 10 45
Output:5
-}

-- head
{-
Type:[a] -> a
Explanation:return the first item in the list
Input:head [5,8,9]
Output:5
Input:head ["A","G","F"]
Output:"A"
-}

-- id
{-
Type: a -> a
Explanation:identify function
Input:id 55
Output:55
Input: id "SAFAF"
Output:"SAFAF"
-}

-- init
{-
Type: [a] -> [a]
Explanation:returns the list but delete the last item
Input: init[1,2,5,6,8]
Output:[1,2,5,6]
Input:init"GOOD"
Output:"GOO"
-}

-- iterate
{-
Type: (a -> a) -> a -> [a]
Explanation:returns a list which repeat the time of the first argument to do the function with the second argument.
Input:iterate(+10)20
Output:[20,30,40,50,60,70,80,90..]
Input:iterate(1-)10
Output:[10,-9,10,-9,..]
-}

-- last
{-
Type: [a] -> a
Explanation:returns the last item in the list
Input:last[5,6,8,9]
Output:9
Input:last["A","V","S"]
Output:"S"
-}

-- lcm
{-
Type: Integral a => a -> a -> a
Explanation:returns the lowest common muliple of the two arguments
Input:lcm 5 10
Output:10
Input:lcm 13 7
Output:91
-}

-- length
{-
Type: Foldable t => t a -> Int
Explanation:returns the number of items in a list
Input:length[1,2,3,4,5,6]
Output:6
Input: length"ASD"
Output:3
-}

-- map
{-
Type:(a -> b) -> [a] -> [b]
Explanation:returns a list which can be updated to all the items by the funtion which is provided by the user
Input: map(+1)[1,2,3,4]
Output:[2,3,4,5]
Input:map (++"A")["F","A"]
Output:["FA","AA"]
-}


-- null
{-
Type: Foldable t => t a -> Bool
Explanation:returns True if it is an empty list, else returns False
Input:null[1,2,3]
Output:False
Input:null[]
Output:True
-}

-- odd
{-
Type: Integral a => a -> Bool
Explanation:returns True if it is odd, else returns False
Input: odd 13
Output:True
Input: odd 2
Output:False
-}

-- repeat
{-
Type: a -> [a]
Explanation:it creates an infinite list where all items are the first argument
Input:repeat 5
Output:[5,5..]
Input:repeat 'a'
Output:"aaa.."
-}

-- replicate
{-
Type:Int -> a -> [a]
Explanation:creats a list which first  argument decide the times and second argument decide what is that item.
Input:replicate 4 'b'
Output:"bbbb"
Input:replicate 2 "b"
Output:["b","b"]
Input:replicate 4 2
Output:[2,2,2,2]
-}


-- reverse
{-
Type: [a] -> [a]
Explanation:returns the reverse of the argument
Input:reverse[1,2,3,4,5]
Output:[5,4,3,2,1]
Input:reverse["a","v","f","r"]
Output:["r","f","v","a"]
-}

-- snd
{-
Type: (a, b) -> b
Explanation:returns the second item in the tuple
Input:snd(5,6)
Output:6
Input:snd('q','i')
Output:'i'
-}

-- span
{-
Type: (a -> Bool) -> [a] -> ([a], [a])
Explanation:returns two arguments. First argument contains the items which are in the condition. Second argument contains the rest of them.
Input:span(/="a")["b","f","a","r","G"]
Output:(["b","f"],["a","r","G"])
Input:span(/=3)[1,2,3,4,5,6,7,8,9]
Output:([1,2],[3,4,5,6,7,8,9])
-}

-- splitAt
{-
Type: Int -> [a] -> ([a], [a])
Explanation:seperates one list by the position which you enter to two lists
Input:splitAt 4[1,2,4,5,8]
Output:([1,2,4,5],[8])
Input:splitAt 3[5,8,6,9,6,5]
Output:([5,8,6],[9,6,5])
-}

-- zip
{-
Type:[a] -> [b] -> [(a, b)]
Explanation:makes a list of tuples, each tuple conteining elements of both lists occuring at the same position
Input: zip[1,2,5][9,7,6]
Output:[(1,9),(2,7),(5,6)]
Input:zip["a","b","C"][9,7,6]
Output:[("a",9),("b",7),("C",6)]
-}
