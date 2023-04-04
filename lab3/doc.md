# Intelligent Robotic System - Lab 3

###### Author: Accursi Giacomo

The program was developed following the principles of *subsumption architecture*. The proposed architecture consists of three levels described below: 

+ **Random Walk**: basic behavior of the robot that moves randomly within the arena.
+ **Phototaxis**: this layer implements the robot's ability to approach a light source using its own light sensors. 
+ **Obstacle Avoidance**: this level allows the robot to avoid obstacles in the arena, detected using its proximity sensors. 

The strategies for approaching light and avoiding obstacles were taken from the previous lab.

In the step function obstacle avoidance is performed, then it invokes phototaxis which invokes random walk. In this way, random walk is the first to make its decision, and obstacle avoidance is the last. This is because obstacle avoidance must always take precedence.
