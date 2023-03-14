# Intelligent Robotic System - Lab 1

###### Author: Accursi Giacomo

## Exercise 1

The objective of the exercise is to lead the robot to the bright light source. 
The robot used has 24 light sensors, distributed along its circumference. Each sensor returns a value between 0 and 1. 
The strategy adopted is to read, at each step, the values of the brightness sensors in front (1 and 24), left (6 and 7) and right (18 and 19). Once the values of the two sensors for each direction are summed, the robot is moved in the direction where the highest brightness is detected. 
In the case where all sensors give brightness of 0, the robot will move randomly.

**Variant 1 (extra light) :** The robot goes to the nearest light in the case of lights with the same illumination.

**Variant 2 (actuator/sensor noise):** The robot struggles more to find the light but still reaches the goal.

## Exercise 2

The goal of the exercise is to have the robot move randomly within the arena while avoiding obstacles within it. 
The strategy adopted is to read, at each step, the values of all proximity sensors, placed all around the robot. 
If one of these sensors returns a value greater than a set threshold, in our case 0.4, then the robot will turn left if the obstacle is to its right, left in case the obstacle is to its right. 
In case no obstacle is detected, the robot will continue to move randomly.

**Variant 1 (actuator/sensor noise):** The robot struggles more to find the light but still reaches the goal.

**Variant 2 (more robots) :** The robots still succeed in their purpose.

## Exercise 3

The goal of this exercise is to combine the first two objectives, that is, to have the robot reach the light while avoiding obstacles in the arena. 
To achieve this goal the strategies from the first two exercises were combined: first we check that there are no obstacles nearby, in case there are then we move in the opposite direction. In case the way is clear then if the robot sees the light the robot moves in that direction, otherwise it moves randomly.

**Variant 1 (more robot) :** behavior seems to be identical, the two robots detect each other and try to avoid each other.

**Variant 2 (more obstacles of different shapes):** increase the difficulty for the robot to reach the light, and high ones may prevent the robot from seeing the light.

**Variant 3 (actuator/sensor noise):** The robot struggles more to find the light but still reaches the goal.





