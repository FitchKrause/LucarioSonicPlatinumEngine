/// @description  player_animation_knuckles_push(tick)
/// @param tick
function player_animation_knuckles_push() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprKnucklesPush;
	        image_index = 0;
	        break;
	    }
    
	    case 8:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 16:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 24:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 31:
	    {
	        image_index = 0;
	        animation_tick = 0;
	        break;
	    }
	}



}
