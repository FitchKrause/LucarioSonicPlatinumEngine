/// @description  player_reset_physics()
function player_reset_physics()
{
	/*
	Initializes all physics variables and then applies all active modifications.

	< return value: n/a
	*/

	speed_cap = base_speed_cap; // speed values
	acceleration = 0.046875;
	deceleration = 0.5;
	ground_friction = 0.046875;
	air_acceleration = 0.09375;
	roll_deceleration = 0.125;
	roll_friction = 0.0234375;
	jump_constant = 6.5 - (character_id == CHARACTER_KNUCKLES); // gravity values
	jump_release = 4;
	gravity_force = 0.21875;
	hit_force = 0.1875;

	if super_form // superform
	{
	    switch character_id
	    {
	        case CHARACTER_SONIC:
	        {
	            speed_cap *= 2.6;
	            acceleration *= 2.6;
	            air_acceleration *= 2.6;
	            roll_friction *= 2.6;
	            jump_constant = 8;
	            jump_release = 6.5;
	            break;
	        }
	    }
    
	}

	if superspeed // superspeed modification
	{
	    speed_cap *= 2;
	    acceleration *= 2;
	    air_acceleration *= 2;
	    roll_friction *= 2;
	}

	if outspace // outspace modification
	{
	    air_acceleration *= 0.5;
	    roll_friction *= 0.5;
	    jump_constant -= 3;
	    jump_release *= 0.5;
	    gravity_force = 0.02734375;
	    hit_force = 0.046875;
	}
	
	if underwater // underwater modification
	{
	    speed_cap *= 0.5;
	    acceleration *= 0.5;
	    deceleration *= 0.5;
	    air_acceleration *= 0.5;
	    roll_friction *= 0.5;
	    jump_constant -= 3;
	    jump_release *= 0.5;
	    gravity_force = 0.0625;
	    hit_force = 0.0625;
	}
}