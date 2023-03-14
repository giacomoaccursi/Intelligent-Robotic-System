MOVE_STEPS = 15
MAX_VELOCITY = 15
PROXIMITY_THRESHOLD = 0.4

n_steps = 0

function maxProximityIndex()
	max = 0
	max_index = 1
	for i = 1, 24 do 
		if robot.proximity[i].value > max then 
			max = robot.proximity[i].value
			max_index = i
		end
	end
	return max_index
end

function init()
	left_v = robot.random.uniform(0,MAX_VELOCITY)
 	right_v = robot.random.uniform(0,MAX_VELOCITY)
	robot.wheels.set_velocity(left_v,right_v)
end

function step()
	n_steps = n_steps + 1

	if n_steps % MOVE_STEPS == 0 then
		left_v = robot.random.uniform(0,MAX_VELOCITY)
		right_v = robot.random.uniform(0,MAX_VELOCITY)
		n_steps = 0
	end

	max_prox_index = maxProximityIndex()

	if max_prox_index >= 1 and max_prox_index <= 6 and robot.proximity[max_prox_index].value >= PROXIMITY_THRESHOLD then
		left_v = MAX_VELOCITY
		right_v = -MAX_VELOCITY
	elseif max_prox_index >= 19 and max_prox_index <= 24 and robot.proximity[max_prox_index].value >= PROXIMITY_THRESHOLD then
		left_v = -MAX_VELOCITY
		right_v = MAX_VELOCITY
	end

	robot.wheels.set_velocity(left_v,right_v)
end

function reset()
end

function destroy()
end
