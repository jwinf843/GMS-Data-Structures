/// Movement

// ----- Player Input Variables
input_left	= keyboard_check(vk_left)
input_right	= keyboard_check(vk_right)
input_up	= keyboard_check(vk_up)
input_down	= keyboard_check(vk_down)
input_walk	= keyboard_check(vk_control)
input_run	= keyboard_check(vk_shift)

// ----- Collision Detection Variables
moveX = 0
moveY = 0

// ----- Set Player Speed
if(input_walk)		{spd = w_spd}
else if(input_run)	{spd = r_spd}
else				{spd = n_spd}	

// ----- Initialize Movement
moveX = (input_right - input_left) * spd
	// ----- Limit Horizontal Movement if Moving Vertically
if(moveX == 0){moveY = (input_down - input_up) * spd}

// ----- Collision Check
	// ----- Horizontal
if(moveX != 0){
	if(place_meeting(x + moveX, y, o_collision)){
		repeat(abs(moveX)){
			if(!place_meeting(x + sign(moveX), y, o_collision)){x += sign(moveX)}
			else{break}
		}
		moveX = 0
	}
}
	// ----- Vertical
if(moveY != 0){
	if(place_meeting(x, y + moveY, o_collision)){
		repeat(abs(moveY)){
			if(!place_meeting(x, y + sign(moveY), o_collision)){x += sign(moveY)}
			else{break}
		}
		moveY = 0
	}
}
// ----- Apply Movement
x += moveX
y += moveY