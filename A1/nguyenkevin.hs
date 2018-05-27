--Kevin Nguyen
--kdn433
--Assignment 1

--
--Main Driver
main = do
	print (take 10 fibs)
	print (take 10 primes)
	print (take 10 partC)
	print (take 10 partD)

--Fib function
fibs = (map (\x -> (fibLogic x)) initFList)

--prime function
primes = primeLogic initPList

--partC Function
partC = [(fibs !! (i-1)) | i <- primes]

--partD functoin
partD = [(primes !! (i-1)) | i <- fibs]

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
