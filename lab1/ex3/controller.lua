MOVE_STEPS = 15
PROXIMITY_THRESHOLD = 0.4
MAX_VELOCITY = 15

n_steps = 0

function maxSensorIndex(sensorList)
	max = 0
	max_index = 1
	for i = 1, #sensorList do 
		if sensorList[i].value > max then 
			max = sensorList[i].value
			max_index = i
		end
	end
	return max_index
end

function maxIndex(list)
	max = 0
	max_index = 1
	for i = 1, #list do 
		if list[i] > max then 
			max = list[i]
			max_index = i
		end
	end
	return max_index
end

function lightDetected()
	for i = 1, #robot.light do
		if robot.light[i].value > 0 then 
			return true
		end 
	end 
	return false
end 

function init()
	left_v = robot.random.uniform(0,MAX_VELOCITY)
	right_v = robot.random.uniform(0,MAX_VELOCITY)
end
 
function step()
	max_prox_index = maxSensorIndex(robot.proximity)

	if max_prox_index >= 1 and max_prox_index <= 6 and robot.proximity[max_prox_index].value >= PROXIMITY_THRESHOLD then
		left_v = MAX_VELOCITY
		right_v = -MAX_VELOCITY 

	elseif max_prox_index >= 19 and max_prox_index <= 24 and robot.proximity[max_prox_index].value >= PROXIMITY_THRESHOLD then
		left_v = -MAX_VELOCITY 
		right_v = MAX_VELOCITY

	else
		if lightDetected() then 

			light_front = robot.light[1].value + robot.light[24].value
			light_right = robot.light[18].value + robot.light[19].value
			light_left = robot.light[6].value + robot.light[7].value
	
			lights = {light_front, light_left, light_right}
	
			max_light = maxIndex(lights)
	
			if max_light == 1 then 
				left_v = MAX_VELOCITY
				right_v = MAX_VELOCITY
			elseif max_light == 2 then
				left_v = 0
				right_v = MAX_VELOCITY  				
			else 
				left_v = MAX_VELOCITY
				right_v = 0 
			end
		else
			if n_steps % MOVE_STEPS == 0 then
				left_v = robot.random.uniform(0,MAX_VELOCITY)
				right_v = robot.random.uniform(0,MAX_VELOCITY)
				n_steps = 0
			end
		end
	end
	robot.wheels.set_velocity(left_v,right_v)
end

function reset()
end

function destroy()
    x = robot.positioning.position.x
    y = robot.positioning.position.y
    d = math.sqrt((1-x)^2 + (-1-y)^2)
    log("distance: "..d)
end
