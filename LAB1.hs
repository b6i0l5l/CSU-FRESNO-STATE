--succ
{-
Type:Enum a => a -> a
Explanation: return the next item
Input:succ 5
Output:6
Input:succ Orange
Output:Yellow
-}

--pred
Type:Enum a => a -> a
Explanation: return the previous item
Input:pred 6
Output:5
Input:pred Yellow
Output:Orange

--toEnum
Type:Enum a => Int -> a
Explanation:return the item which you enter the position from the enumeration
Input:toEnum 5::Color
Output:Violet
Input:toEnum 2::Color
output:Yellow

--fromEnum
Type:Enum a => a -> Int
Explanation:return the position which you enter the item of the enumeration
Input:fromEnum Yellow
Output:2
Input:fromEnum Orange
output:1

--enumFrom
Type:Enum a =>  a -> [a]
Explanation:returns an array of members of an enumeration starting with the argument
Input:enumFrom Yellow
Output:[Yellow,Green,Blue,Violet]
Inout:enumFrom Green
Output:[Green,Blue,Violet]

--enumFromThen
Type:Enum a => a -> a -> [a]
Explanation:returns an array of members of an enumeration stating starting with the first argument and with the distances 0,1,2,... * distance from the first argument to the second one
Input:enumFromThen Red Orange
Output:[Red,Orange,Yellow,Green,Blue,Violet]
Input: enumFromThen Red Yellow
Output:[Red,Yellow,Blue]

--enumFromTo
Type:Enum a =>  a -> a -> [a]
Explanation:returns an array of members of an enumeration starting with the first argument and finishing with the second one
Input: enumFromTo Red Yellow
Output:[Red,Orange,Yellow]
Input: enumFromTo Red Blue
Output:[Red,Orange,Yellow,Green,Blue]

--enumFromThenTo
Type:Enum a =>  a -> a -> a -> [a]
Explanation:
Input:enumFromThenTo Red Yellow Violet
Output:[Red,Yellow,Blue]
Input: enumFromThenTo Red Orange Blue
output:[Red,Orange,Yellow,Green,Blue]

--==
Type:Eq a => a -> a -> Bool
Explanation:return true if it is equal return false if it is not equal
Input:2==3
Output:False
Input:3==3
Output:True

--/=
Type:Eq a => a -> a -> Bool
Explanation:return FALSE if it is equal return true if it is not equal
Input:2/=3
Output:True
Input:2/=2
Output:False

--quot
Type:Integral a => a -> a -> a
Explanation:integer division, it divides the first argument by the second one discarding remainder
Input: 33 `quot`11
Output:3
Input: 33`quot`10
Output:3
Input:33`quot`(-10)
Output:-3

--div
Type:Integral a => a -> a -> a
Explanation:returns how many times the first number can be divided by the second one
Input:33 `div`11
Output:3
Input: 33`div`10
Output:3
Input:33`div`(-11)
Output:-4

Different between div and quot is on the second argument.
quot:33`quot`(-10)=> (-10)*(-3)+3=33
div:33`div`(-10)=> (-10)*(-4)-6=33

--rem
Type: Integral a => a -> a -> a
Explanation:returns reminder of integer division of the arguments
Input:33 `rem`10
Output:3
Input:24`rem`10
Output:4
Input:33`rem`(-10)
Output:3

--mod
Type: Integral a => a -> a -> a
Explanation:modulo
Input:33 `mod`10
Output:3
Input:24`mod`10
Output:4
Input:33`mod`(-10)
Output:-7

Different between rem and mod
rem: 33`rem`(-10)   => (-10)*(-3)+3=33
mod: 33`mod`(-10)   =>(-10)*(-4)-7=33

--qutoRem
Type:Integral a => a -> Rational
Explanation:return the result of the division and reminder
Input: quotRem 4 3
Output:(1,1)
Input: quotRem 10 5
Output:(2,0)

--divMod
Type:Integral a => a -> a -> (a,a)
Explanation:
Input:divMod 10 5
Output:(2,0)
Input: divMod 10 (-5)
Output:(-2,0)

--&&
Type:Bool -> Bool -> Bool
Explanation: and operator
Input: True && True
Output:True
Input: True && False
Output:False

--||
Type:Bool -> Bool -> Bool
Explanation: or operator
Input: True || True
Output:True
Input:True || False
Output: True
--++
Type: [a] -> [a] -> [a]
Explanation:combine two items
Input:[1,2,3]++[5,5]
Output:[1,2,3,5,5]
Input:"Hi"++" MIKE"
Output:"Hi MIKE"

--compare
Type: Ord a => a -> a -> Ordering
Explanation:compare the first argument and second one. If it is less then return (LT). If it is equal then return (EQ). If it is greater then return (GT).
Input:compare 55 63
Output:LT
Input:compare "AA" "AZ"
output:LT
Input: compare 55 55
Output:EQ

--<
Type: Ord a => a -> a -> Bool
Explanation:compare  argument and second one. If it is less return True, else return False.
Input:66<55
Output:False
Input:"ADS"<"ACS"
Output:False

-->
Type: Ord a => a -> a -> Bool
Explanation:compare  argument and second one. If it is greater return True, else return False.
Input:66>55
Output:True
Input:"ADS">"ACS"
Output:True

--max
Type: Ord a => a -> a -> a
Explanation:return the larger one of two arguments
Input:max 5 10
Output:10
Input:max "ADS" "ACS"
Output:"ADS"

--min
Type: Ord a => a -> a -> a
Explanation:return the smaller one of two arguments
Input:min 5 10
Output:5
Input:min "ADS" "ACS"
Output:"ACS"

--^
Type: (Num a, Integral b) => a -> b -> a
Explanation:exponentiate of the argument
Input:2^2
Output:4
Input:3^2
Output:9

--all
Type: Foldable t => (a -> Bool) -> t a -> Bool
Explanation:returns True if all the items in the list fulfills the condition
Input: all(==1)[1,1,0,1,1]
Output:False
Input: all(>5)[10,6,9,15]
Output:True

--any
Type:  Foldable t => (a -> Bool) -> t a -> Bool
Explanation:returns True if at least one item in the list fulfills the condition
Input: any(==1)[1,5,3]
Output:True
Input: any(>5)[1,2,3,4]
Output:False

--break
Type:(a -> Bool) -> [a] -> ([a], [a])
Explanation:seperates two tuple when the item match the condition
Input:break(==5)[6,5,8,9]
Output:([6],[5,8,9])
Input: break(=="A")["G","A","R"]
Output:(["G"],["A","R"])

--concat
Type: Foldable t => t [a] -> [a]
Explanation:
Input:concat[[5,8],[6,9]]
Output:[5,8,6,9]
Input:concat[["B","DD"],["A","F"]]
Output:["B","DD","A","F"]

--const
Type: a -> b -> a
Explanation:const the first argument
Input: const 1 2
Output:1
Input:const 12 3
Output:12

--cycle
Type:[a] -> [a]
Explanation:
Input:take 5 (cycle[1,2])
Output:[1,2,1,2,1]
Input:take 3 (cycle["A","F"])
Output:["A","F","A"]

--drop
Type: Int -> [a] -> [a]
Explanation:drop the items you want and return rest of the arguments
Input:drop 3 [1,2,3,4,5,6,8]
Output:[4,5,6,8]
Input:drop drop 2 ["A","B","C"]
Output:["C"]

-- take
Type: Int -> [a] -> [a]
Explanation:creates a list and determines how many items should be in the list from the arguments
Input: take 3 [1,2,3,4,5,6,8]
Output:[1,2,3]
Input:take 2 ["A","B","C"]
Output:["A","B"]

-- dropWhile
Type: (a -> Bool) -> [a] -> [a]
Explanation:creates a list from another one, it inspects the original list and takes from it its elements from the moment when the condition fails for the first time till the end of the list
Input: dropWhile(<5) [1,2,9,5,6]
Output:[9,5,6]
Input:dropWhile(>5)[1,2,9,5,6]
Output:[1,2,9,5,6]

-- takeWhile
Type: (a -> Bool) -> [a] -> [a]
Explanation:creates a list from another one, when the condtion fails then it stop taking items from the list
Input:takeWhile(>2)[1,2,3,4,5,6,7,8]
Output:[]
Input:takeWhile (<3)[1,2,3,4,5,6,7]
Output[1,2]

-- elem
Type:  (Eq a, Foldable t) => a -> t a -> Bool
Explanation:returns true when the item is in the lists
Input: elem 1 [2,5,6,8,1]
Output:True
Input: elem "A" ["B","f","A"]
Output:True

-- even
Type: Integral a => a -> Bool
Explanation:returns True if it is even,else returns False
Input:even 2
Output:True
Input:even 3
Output:False

--filter
Type:(a -> Bool) -> [a] -> [a]
Explanation:returns a list constructed from members of a list (the second argument) fulfilling a condition given by the first argument
Input:filter(>5)[5,8,1,2,6,9]
Output:[8,6,9]
Input:filter(=="A")["A","G","A","V"]
Output:["A","A"]

--fst
Type: (a, b) -> a
Explanation:returns the first item in a tuple
Input:fst(1,20)
Output:1
Input:fst(5,20)
Output:5

--gcd
Type:Integral a => a -> a -> a
Explanation:return the great common divisor
Input: gcd 12 2
Output:2
Input:gcd 10 45
Output:5

-- head
Type:[a] -> a
Explanation:return the first item in the list
Input:head [5,8,9]
Output:5
Input:head ["A","G","F"]
Output:"A"

--id
Type: a -> a
Explanation:identify function
Input:id 55
Output:55
Input: id "SAFAF"
Output:"SAFAF"

--init
Type: [a] -> [a]
Explanation:returns the list but delete last item
Input: init[1,2,5,6,8]
Output:[1,2,5,6]
Input:init"GOOD"
Output:"GOO"

--iterate
Type: (a -> a) -> a -> [a]
Explanation:returns a list which repeat the time of the first argument to do the function with the second argument.
Input:take 8(iterate(+10)20)
Output:[20,30,40,50,60,70,80,90]
Input:take 4 (iterate(1-)10)
Output:[10,-9,10,-9]

--last
Type: [a] -> a
Explanation:returns the last item in the list
Input:last[5,6,8,9]
Output:9
Input:last["A","V","S"]
Output:"S"


--lcm
Type: Integral a => a -> a -> a
Explanation:returns the lowest common muliple
Input:lcm 5 10
Output:10
Input:lcm 13 7
Output:91

--length
Type: Foldable t => t a -> Int
Explanation:returns the number of items in a list
Input:length[1,2,3,4,5,6]
Output:3
Input: length"ASD"
Output:3

--map
Type:(a -> b) -> [a] -> [b]
Explanation:returns a list which can be updated to all the items by the funtion which is provided by the user
Input: map(+1)[1,2,3,4]
Output:[2,3,4,5]
Input:map (++"A")["F","A"]
Output:["FA","AA"]

--null
Type: Foldable t => t a -> Bool
Explanation:returns True if it is an empty list, else returns False
Input:null[1,2,3]
Output:False
Input:null[]
Output:True

--odd
Type: Integral a => a -> Bool
Explanation:returns True if it is odd, else returns False
Input: odd 13
Output:True
Input: odd 2
Output:False

--repeat
Type: a -> [a]
Explanation:return a list which includes the items which you want to repeat
Input:take 2 (repeat 5)
Output:[5,5]
Input:take 3(repeat 'a')
Output:"aaa"

--replicate
Type:Int -> a -> [a]
Explanation:creats a list which first  argument decide the times and second argument decide what is that item.
Input:replicate 4 'b'
Output:"bbbb"
Input:replicate 2 "b"
Output:["b","b"]
Input:replicate 4 2
Output:[2,2,2,2]

--reverse
Type: [a] -> [a]
Explanation:return the reverse of the argument
Input:reverse[1,2,3,4,5]
Output:[5,4,3,2,1]
Input:reverse["a","v","f","r"]
Output:["r","f","v","a"]

--snd
Type: (a, b) -> b
Explanation:return the second item in the tuple
Input:snd(5,6)
Output:6
Input:snd('q','i')
Output:'i'

--span
Type: (a -> Bool) -> [a] -> ([a], [a])
Explanation:returns two arguments. First argument contains the items which are in the condition. Second argument contains the rest of them.
Input:span(/="a")["b","f","a","r","G"]
Output:(["b","f"],["a","r","G"])
Input:span(/=3)[1,2,3,4,5,6,7,8,9]
Output:([1,2],[3,4,5,6,7,8,9])

--splitAt
Type: Int -> [a] -> ([a], [a])
Explanation:seperates one list by the position which you enter to two lists
Input:splitAt 4[1,2,4,5,8]
Output:([1,2,4,5],[8])
Input:splitAt 3[5,8,6,9,6,5]
Output:([5,8,6],[9,6,5])

--zip
Type:[a] -> [b] -> [(a, b)]
Explanation:makes a list of tuples, each tuple conteining elements of both lists occuring at the same position
Input: zip[1,2,5][9,7,6]
Output:[(1,9),(2,7),(5,6)]
Input:zip["a","b","C"][9,7,6]
Output:[("a",9),("b",7),("C",6)]
