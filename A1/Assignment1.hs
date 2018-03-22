--Kevin Nguyen
--kdn433
--Assignment 1

--
--Main Driver
main = do
	print (take 10 fib)
	print (take 10 prime)
	print (take 10 partC)
	print (take 10 partD)

--Fib function
fib = (map (\x -> (fibLogic x)) initFList)

--prime function
prime = primeLogic initPList

--partC Function
partC = [(fib !! (i-1)) | i <- prime]

--partD functoin
partD = [(prime !! (i-1)) | i <- fib]

--Initial list fib
initFList = [1,2..]

--Initial List prime
initPList = [2,3..]

--logic of Fibonanci from Google--
fibLogic :: Int -> Int
fibLogic 0 = 0
fibLogic 1 = 1
fibLogic n = fibLogic (n-1) + fibLogic (n-2)

--Logic of prime from Google--
primeLogic (p:iList) = p:(primeLogic [x | x <- iList, ((x `mod` p) /= 0)])

--Logic of PartC--
partCLogic i ilist2 = (ilist2 !! i) --list2 = forM_ list2 $ \x2 -> do
