/// @description  player_animation_knuckles_brake(tick)
/// @param tick
function player_animation_knuckles_brake() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprKnucklesBrake;
	        image_index = 0;
	        break;
	    }
    
	    case 4:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 10:
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
    
	    /*case 8:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 12:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 15:
	    {
	        if (abs(xspeed) >= 6)
	        {
	            animation_new = "run";
	        }
	        else
	        {
	            animation_new = "walk";
	            animation_speed = 1 / (9 - median(abs(xspeed), 1, 8));
	        }
	        break;
	    }*/
	}



}
