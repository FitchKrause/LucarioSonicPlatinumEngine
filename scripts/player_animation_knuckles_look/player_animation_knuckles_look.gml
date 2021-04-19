/// @description  player_animation_knuckles_look(tick)
/// @param tick
function player_animation_knuckles_look() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprKnucklesLook;
	        image_index = 0;
	        break;
	    }
    
	    case 6:
	    {
	        image_index = 1;
	        break;
	    }
	}



}
