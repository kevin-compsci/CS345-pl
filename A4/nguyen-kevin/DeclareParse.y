-- Kevin Nguyen
-- kdn433

{
module DeclareParse where
import Data.Char
import Declare
import Lexer
}

%name parser
%tokentype { Token }

%token 
    var    { TokenKeyword "var" }
    ','    { Symbol "," }
    ';'    { Symbol ";" }
    id     { TokenIdent $$ }
    digits { Digits $$ }
    '='    { Symbol "=" }
    '+'    { Symbol "+" }
    '-'    { Symbol "-" }
    '*'    { Symbol "*" }
    '/'    { Symbol "/" }
    '('    { Symbol "(" }
    ')'    { Symbol ")" }

%%

Expr : var ItemList ';' Expr {Declare $2 $4}
     | Term { $1 }

ItemList : id '=' Expr {[($1, $3)]} 
         | id '=' Expr ',' ItemList { ($1, $3):$5 }

Term : Term '+' Factor    { Add $1 $3 }
     | Term '-' Factor    { Subtract $1 $3 }
     | Factor             { $1 }

Factor : Factor '*' Primary    { Multiply $1 $3 }
       | Factor '/' Primary    { Divide $1 $3 }
       | Primary               { $1 }

Primary : digits            { Number $1 }
        | '-' digits        { Number (- $2) }
        | id                { Variable $1 }
        | '(' Expr ')'       { $2 }

{

symbols = ["+", "-", "*", "/", "(", ")", ";", "=", ","]
keywords = ["var"]
parseExp str = parser (lexer symbols keywords str)

parseInput = do
  input <- getContents
  print (parseExp input)

}
