/// @description  player_animation_knuckles_climb(tick)
/// @param tick
function player_animation_knuckles_climb() {

	switch argument[0]
	{
	    case -4:
	    {
	        image_index = 5;
	        animation_tick = 20;
	    }
    
	    case 0:
	    {
	        sprite_index = sprKnucklesClimb;
	        image_index = 0;
	        break;
	    }
    
	    case 4:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 8:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 12:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 16:
	    {
	        image_index = 4;
	        break;
	    }
    
	    case 20:
	    {
	        image_index = 5;
	        break;
	    }
    
	    case 24:
	    {
	        image_index = 0;
	        animation_tick = 0;
	        break;
	    }
	}



}
