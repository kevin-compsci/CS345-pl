4

# 4

-4 - 6

# -10

var x = 3; x

# 3

var x = 3; var y = x*x; x

# 3

var x = 3; var x = x*x; x

# 9

var x = 3; var y = x*x; y

# 9

2 + (var x = 2; x)

# 4








(var x = 3, y = 3; (x + y))

# 6

(var x = 3, x = 2; (x + y))

# Error: Expression has duplicates

(var x=3, y=2, z=x; (x+y))

# 5

(var x = 1, y = 1, x = 2; (x+x))

# Error: Expression has duplicates

(var x = 2, z = 1; (z+1))

#2