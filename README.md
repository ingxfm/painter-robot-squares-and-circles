# painter-robot-squares-and-circles
Painter-robot-squares-and-circles
ABB IRB140 robot: https://new.abb.com/products/robotics/industrial-robots/irb-140

## Task 1 Create a code for shape drawing. 
Requirements:
Functions: main, square, circle

1. Operator choose the shape to draw (square or circle) using the defined buttons.
2. Operator assign the dimension of the selected shape.
3. Dimension (Diameter/side) is limited to the range from 10 to 45mm.
4. Operator assign the amount of shapes to draw (from 1 to 5).
5. Before the robot's motion is started, it is checked that the correct tool is picked.
6. If any condition is not met, the error message is displayed on the screen and the beacon red light is triggered.
7. System draws the shapes.  For all the motion instructions, only two targets are available (pHome and pCenter). Offs function is used.
8. Shapes intersects in one point (squares have to be rotated by 45º), the pitch between the shapes is equal to the circle's diameter/diagonal of the square.
9. After the process is done, the system informs the operator about the amount of the shapes drawn.
10. When the tool is in contact with the surface, blue light is lit.



## Task 2 Pick and Place from Dural pallette
Requirements:
Functions: main, EvenLine, OddLine, Pick, Drop

1. Operator choose one of two options (Pick & Place, Exit). Exit quits the program run (using a while cycle).
2. In case that the "Pick & Place" is selected, operator is called to enter the number of the cubes to pick in range from 2 to 14.
3. The robot then sequentially picks the given number of the cubes from the stack and drops it into a box. The picking is performed by the Offs function and referenced to a pRef point (default target). 
4. After the process is done, the system, informs the operator about the amount of the cubes selected.
