/// @description  player_animation_knuckles_glideend(tick)
/// @param tick
function player_animation_knuckles_glideend() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprKnucklesGlideFall;
	        image_index = 0;
	        break;
	    }
    
	    case 8:
	    {
	        image_index = 1;
	        break;
	    }
	}



}
