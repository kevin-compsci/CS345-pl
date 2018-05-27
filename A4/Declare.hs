-- Kevin Nguyen
-- kdn433

module Declare where
import Base
import Data.Maybe

-- Define the data type for the abstract syntax of expressions, including variable declarations
data Exp = Number     Int
         | Add        Exp Exp
         | Subtract   Exp Exp
         | Multiply   Exp Exp
         | Divide     Exp Exp
         | Variable   String
         | Declare    [(String, Exp)] Exp
   deriving Show

-- An environment is a list of strings and values
type Env = [(String, Int)]

-- Evaluate an expression in an environment
evaluate :: Exp -> Env -> Int
evaluate (Number i) env      = i
evaluate (Add a b) env       = evaluate a env + evaluate b env
evaluate (Subtract a b) env  = evaluate a env - evaluate b env
evaluate (Multiply a b) env  = evaluate a env * evaluate b env
evaluate (Divide a b) env    = evaluate a env `div` evaluate b env
evaluate (Variable x) env    = fromJust (lookup x env)
evaluate (Declare list body) env =
	if (hasDuplicates list)
		then 
			error "Expression has duplicates"
		else
			evaluate body newEnv
			where newEnv = ([(x, evaluate e env) | (x,e) <- list])++env


--DUPLICATES FUNCTION
hasDuplicates :: Eq a => [(a,b)] -> Bool
hasDuplicates [] = False
hasDuplicates ((a,_):xs) = if (isJust (lookup a xs))
    then 
    	True
    else
    	hasDuplicates xs


-- ((a,_) 'elem' xs) 

-- someList = [x | (x,y) <- someList] 
-- (x:xs) = (x `elem` xs)



--look through list and return True or False --

--

--newEnv
--	where newEnv = ( [(x, evaluate e env) | (x, e) <- expr] )


-- evaluate (Declare x exp body) env = evaluate body newEnv
--   where newEnv = (x, evaluate exp env) : env

--where newEnv = [(x, evaluate e env) | (x,e) <- list]
