MAX_VELOCITY = 15

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
	for i = 1, 24 do
		if robot.light[i].value > 0 then 
			return true
		end 
	end 
	return false
end 

n_steps = 0	n_steps = 0

function init()
end

function step()
	
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
		left_v = robot.random.uniform(0,MAX_VELOCITY)
		right_v = robot.random.uniform(0,MAX_VELOCITY)
	end 

	robot.wheels.set_velocity(left_v,right_v)

end

function reset()

end

function destroy()

end
