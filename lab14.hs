import Data.List (nub,sort)

---- Part 1: Databases

-- Database of two tables, customers and orders
-- Source: http://www.sql-join.com/sql-join-types

customers :: [(Int,String,String,String,String,String,String,Int)]
-- customer_id, first_name, last_name, email, address, city, state, zipcode
customers = [
  (1, "George", "Washington", "gwashington@usa.gov",
   "3200 Mt Vernon Hwy", "Mount Vernon", "VA", 22121),
  (2, "John", "Adams", "jadams@usa.gov",
   "1250 Hancock St", "Quincy" , "MA", 02169),
  (3, "Thomas", "Jefferson", "tjefferson@usa.gov",
   "931 Thomas Jefferson Pkwy", "Charlottesville", "VA", 22902),
  (4, "James", "Madison", "jmadison@usa.gov",
   "11350 Constitution Hwy", "Orange", "VA", 22960),
  (5, "James", "Monroe", "jmonroe@usa.gov",
   "2050 James Monroe Parkway", "Charlottesville", "VA", 22902)
  ]

orders :: [(Int,String,Float,Int)]
-- order_id, order_date, amount, customer_id
orders = [
  (1, "07/04/1776", 234.56, 1),
  (2, "03/14/1760", 78.50, 3),
  (3, "05/23/1784", 124.00, 2),
  (4, "09/03/1790", 65.50, 3),
  (5, "07/21/1795", 25.50, 10),
  (6, "11/27/1787", 14.40, 9)
  ]

-- Write "queries" to give answers to the following questions.
-- You must not "hard code" any parts of your answers, but assume that the
-- data can change or be expanded.

-- 1. What are all of the zipcodes from which orders were placed, in sorted
-- order and without duplicates? (Use nub and sort)
q1 :: [Int]
q1 =sort(nub( [l|(a,b,c,d)<-orders,(e,f,g,h,i,j,k,l)<-customers,d==e]))

-- 2. What are all of dates on which orders were placed by people living in VA?
q2 :: [String]
q2 = nub([b|(e,f,g,h,i,j,k,l)<-customers,(a,b,c,d)<-orders,e==d,k=="VA"])

-- 3. Who are all the people (first_name ++ " " ++ last_name) who've ordered
-- something more expensive than $50?
q3 :: [String]
q3 = nub([(f++" "++g)|(e,f,g,h,i,j,k,l)<-customers,(a,b,c,d)<-orders,c>50,e==d])

-- 4. What is the total amount ordered by people whose first name is Thomas?
q4 :: Float
q4 = sum[c|(e,f,g,h,i,j,k,l)<-customers,(a,b,c,d)<-orders,d==e,f=="Thomas"]

-- 5 - 7. Come up with three more questions about this data and answer them.

-- 5.  What are all of emails on which orders were placed by people living in VA?
q5 :: [String]
q5 = nub([h|(e,f,g,h,i,j,k,l)<-customers,(a,b,c,d)<-orders,e==d,k=="VA"])

-- 6. Who are all the people (first_name ++ " " ++ last_name) who've ordered
-- something more expensive than $10?
q6 :: [String]
q6 = nub([(f++" "++g)|(e,f,g,h,i,j,k,l)<-customers,(a,b,c,d)<-orders,c>10,e==d])

-- 7. What is the total amount ordered by people whose first name is George?
q7 :: Float
q7 = sum[c|(e,f,g,h,i,j,k,l)<-customers,(a,b,c,d)<-orders,d==e,f=="George"]


---- Part 2: Graph searching

type Graph = [(Int, [Int])]

-- The example graph from April 30 lecture; try some others as well
gr :: Graph
gr = [(1,[2,3,4,5]), (2,[6,7]), (3,[4,7]), (4,[8]), (5,[]), (6,[3]), (7,[8,9]),
     (8,[10]), (9,[]), (10,[]), (11,[12]), (12,[11])]

-- Depth-first search
-- dfs g a == xs if xs are the vertices of g visited by a depth-first search
-- starting with the node a
dfs :: Graph -> Int -> [Int]
dfs g a = dfs' g [a] [] where
  -- Recursive dfs' using a list of nodes to visit as well as a list of
  -- visited nodes to avoid duplication/loops. In dvs' g as vs, as are the
  -- nodes still to visit (in order) and vs are the nodes we already visted
  -- Invariant: as and vs are both without duplicates and are disjoint.
  dfs' :: Graph -> [Int] -> [Int] -> [Int]
  dfs' g [] vs = []
  dfs' g (a:as) vs = a:(dfs' g as' vs') where
                     as' = [z|(x,y)<-gr,x==a,z<-y,notElem z vs, notElem z as]++as
                     vs' = a:vs



-- Breadth-first search
-- bfs g a == xs if xs are the vertices of g visited by a breadth-first search
-- starting with the node a
bfs :: Graph -> Int -> [Int]
bfs g a = bfs' g [a] [] where
  -- Recursive bfs' using a list of nodes to visit as well as a list of
  -- visited nodes to avoid duplication/loops. In bfss' g as vs, as are the
  -- nodes still to visit (in order) and vs are the nodes we already visted
  -- Invariant: as and vs are both without duplicates and are disjoint.
  bfs' :: Graph -> [Int] -> [Int] -> [Int]
  bfs' g [] vs = []
  bfs' g (a:as) vs = a:(bfs' g as' vs') where
                     as' = as ++ [z|(x,y)<-gr,x==a,z<-y,notElem z vs, notElem z as]
                     vs' = a:vs
