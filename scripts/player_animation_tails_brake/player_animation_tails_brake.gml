/// @description  player_animation_tails_brake(tick)
/// @param tick
function player_animation_tails_brake() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprTailsBrake;
	        image_index = 0;
	        break;
	    }
    
	    case 8:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 14:
	    {
	        if (abs(xspeed) >= 8)
	        {
	            animation_new = "sprint";
	        }
	        else if (abs(xspeed) >= 6)
	        {
	            animation_new = "run";
	        }
	        else
	        {
	            animation_new = "walk";
	        }
        
	        animation_speed = 1 / (9 - median(abs(xspeed), 1, 8));
	        break;
	    }
	}



}
