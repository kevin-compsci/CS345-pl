-- Kevin Nguyen
-- kdn433



import Prelude hiding (LT, GT, EQ, id)
import Declare
import DeclareParse
import Base

-- execute evaluates an expression in an empty environment
execute exp = show (evaluate exp [])

main = testMain parseExp execute
      
  
