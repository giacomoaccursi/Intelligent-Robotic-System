MOVE_STEPS = 15
MAX_VELOCITY = 15
n_steps = 0
vector = require "vector"
L = robot.wheels.axis_length

function max_sensor(sensorList)
    max = -1
    max_index = -1
    for i = 1, #sensorList do 
        if sensorList[i].value > max then 
            max = sensorList[i].value
            max_index = i
        end
    end
    return max, max_index 
end

function random_walk()
    max_light, max_light_index = max_sensor(robot.light)
    max_proximity, max_proximity_index = max_sensor(robot.proximity)
   
    if (max_light < 0.01 and max_proximity < 0.01) then
        log("light not detected")
        randomAngle = 0
        if n_steps % MOVE_STEPS == 0 then
            randomAngle = robot.random.uniform(-math.pi / 2, math.pi / 2)
            n_steps = 0
        end 
        n_steps = n_steps + 1
        return {length = 0.5, angle = randomAngle}
    end

    return {length = 0.0, angle = 0.0}
end

function phototaxis()
    max_light, max_light_index = max_sensor(robot.light)
    if max_light == -1 then 
        length = 0
        angle = 0
    else 
        length = 1 - robot.light[max_light_index].value
        angle = robot.light[max_light_index].angle
    end
    return {length = length, angle = angle}
end
    
function obstacle_avoidance()
    vec = {length = 0, angle = 0}
    for i = 1, #robot.proximity do 
        length = robot.proximity[i].value
        angle = robot.proximity[i].angle
        vec[i] = {length = length, angle = (-(angle / angle) * math.pi + angle)}
    end 
    return vec
end

function init()
end  

function limit_velocity(velocity)
    return math.min(MAX_VELOCITY, velocity)
end

function step()
    random_walk_behavior = random_walk()
    phototaxis_behavior = phototaxis()
    obstacle_avoidance_behavior = obstacle_avoidance()

    obstacle_avoidance_behavior_sum = {length = 0, angle = 0}
    for i=1, #obstacle_avoidance_behavior do
        obstacle_avoidance_behavior_sum = vector.vec2_polar_sum(obstacle_avoidance_behavior_sum, obstacle_avoidance_behavior[i])
    end

    allBehaviors = {
        random_walk_behavior, 
        phototaxis_behavior,
        obstacle_avoidance_behavior_sum
    }

    result = {length = 0, angle = 0}
    for i=1, #allBehaviors do
        result = vector.vec2_polar_sum(result, allBehaviors[i])
    end

    left_v = ((1 * result.length * MAX_VELOCITY) - L / 2 * result.angle)
    right_v = ((1 * result.length * MAX_VELOCITY) + L / 2 * result.angle)

    robot.wheels.set_velocity(limit_velocity(left_v), limit_velocity(right_v))
end

function reset()
    left_v = robot.random.uniform(0,MAX_VELOCITY)
    right_v = robot.random.uniform(0,MAX_VELOCITY)
    robot.wheels.set_velocity(left_v,right_v)
    n_steps = 0
end

function destroy()
    x = robot.positioning.position.x
    y = robot.positioning.position.y
    d = math.sqrt(x^2 + y^2)
    log("distance: "..d)
end
