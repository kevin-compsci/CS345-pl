--Kevin Nguyen
--kdn433
--Assignment 2

--
-- data Geometry = Point int int | Circle Int Int Int | Rectangle Int Int Int Int | Group [Geometry]

-- 1) Area of geometric figure (counting overlaps as additional area) and 
--bounding box of the geometric figure

-- 2) Extend the data type and the two functions to include *TRIANGLES*. 
--They need six int's to specify the triangles points.

--NOTE: USE RECTANGLE FOR THE BOUNDING BOX


----------------------------
--Main Driver
main = do
	--Part 1
	print "Part 1 below: "
	print (Point 2.0 3.0)
	print (areaCircle (Circle 2.0 3.0 2.0))
	print (areaRect (Rectangle 1.0 2.0 3.0 4.0))
	print (areaGroup (Group [(Circle 10.0 10.0 10.0), (Rectangle 5.0 5.0 5.0 5.0)]))
	print (boxCircle (Circle 2.0 3.0 2.0))
	print (boxRectangle (Rectangle 1.0 3.0 2.0 1.0))
	--Part 2
	print "Part 2 below with Triangles: "
	print (areaTriangle (Triangle 2.0 3.0 4.0 5.0 6.0 2.0))
	print (boxTriangle (Triangle 2.0 3.0 2.0 2.0 3.0 5.0))
	print (areaGroup' (Group [(Circle 10.0 10.0 10.0), (Rectangle 5.0 5.0 5.0 5.0), (Triangle 2.0 3.0 2.0 2.0 3.0 5.0)]))

-- PART A
areaCircle :: Geometry -> Float -- definition
areaCircle (Circle _ _ zc) = (pi * (zc ^ 2)) -- zc is the radius, so area = pi*r^2. Other args are unneeded

areaRect :: Geometry -> Float -- definition
areaRect (Rectangle xr1 yr1 xr2 yr2) = sqrt (abs(((maximum [xr1, xr2])-xr2)^2 + ((minimum[yr1, yr2])-yr2)^2)) * sqrt (abs(((maximum [xr1, xr2])-xr1)^2 + ((minimum[yr1, yr2])-yr1)^2)) -- Tricky since points are arbitrary. First find other corners which is either the max/min of the given coordinates. Then Use Distance formula with given points and computed corner. Afterwards, apply distance formula between the corner and (x,y) then repeat for the other given coordinate. After calculating distances, multiply them together d1 = L, d2 = W. Abs is taken to avoid sqrt with negatives integers.

areaGroup (Group figureList) = (areaCircle (figureList !! 0)) + (areaRect (figureList !! 1)) --index into list and apply functions, then sum them

boxCircle :: Geometry -> Geometry -- definition
boxCircle (Circle xc yc rc) = (Rectangle (xc-rc) (yc+rc) (xc+rc) (yc-rc)) --Find the two corners of the box given the radius, add/subtract radius from coordinates as needed

boxRectangle :: Geometry -> Geometry -- definition
boxRectangle (Rectangle xr yr xr' yr') = (Rectangle xr yr xr' yr') --it should be the box itself


-- PART B
areaTriangle :: Geometry -> Float
areaTriangle (Triangle xt1 yt1 xt2 yt2 xt3 yt3) = abs((0.5) * ((xt1*(yt2-yt3)) + (xt2*(yt3-yt1)) + (xt3*(yt1-yt2))))

boxTriangle :: Geometry -> Geometry
boxTriangle (Triangle xt1' yt1' xt2' yt2' xt3' yt3') = Rectangle (maximum [xt1', xt2', xt3']) (maximum [yt1', yt2', yt3']) (minimum [xt1', xt2', xt3']) (minimum [yt1', yt2', yt3'])

areaGroup' (Group figureList') = (areaCircle (figureList' !! 0)) + (areaRect (figureList' !! 1)) + (areaTriangle (figureList' !! 2))

--data type Geometry
data Geometry = Point Float Float | Circle Float Float Float | Rectangle Float Float Float Float | Group [Geometry] | Triangle Float Float Float Float Float Float
	deriving (Show)