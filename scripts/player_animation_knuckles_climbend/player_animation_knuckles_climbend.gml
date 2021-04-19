/// @description  player_animation_knuckles_climbend(tick)
/// @param tick
function player_animation_knuckles_climbend() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprKnucklesClamber;
	        image_index = 0;
	        break;
	    }
    
	    case 7:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 13:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 19:
	    {
	        break;
	    }
	}



}
