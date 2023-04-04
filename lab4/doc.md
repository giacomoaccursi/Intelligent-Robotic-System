# Intelligent Robotic System - Lab 4

###### Author: Accursi Giacomo

## Explanation

The program was implemented following the principles of motor schema architecture. Three types of behavior were identified:
+ **random walk**: the robot moves randomly within the arena. This happens when the brightness and proximity sensors do not detect obstacles or light sources. 
The maximum value detected by the proximity and brightness sensors is calculated. If these detect nothing then an angle between -90 and + 90 degrees is generated.
+ **phototaxis**: light in the arena has an attractive potential field. Only the sensor that detects the maximum brightness is considered. The angle is the angle returned by the sensor taken into consideration. Length is calculated as 1 - brightness.
+ **obstacle avoidance**: obstacles within the arena have repulsive potential fields. Angles and values are calculated for all 24 proximity sensors. As for the length the same value is kept, so the potential fields will be less in the vicinity of the obstacle and the behavior will appear smoother. The angle is calculated as the opposite of the angle detected by the sensor. The formula for calculating it was suggested by colleague Andrea Giulianelli. 
All the resulting potential fields are then summed. 
---
## Variants
+ variant 1 (add more robots) : everything continues to work as before.
+ variant 2 (add noise in actuator and sensors) : the robot struggles more but still achieves the goal.
+ variant 3 (light of diffrent intensity and height): the robot is less likely to happen upon areas where it cannot see light, so in general it is less likely to move randomly.


