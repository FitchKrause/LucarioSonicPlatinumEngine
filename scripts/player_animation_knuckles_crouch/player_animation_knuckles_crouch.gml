/// @description  player_animation_knuckles_crouch(tick)
/// @param tick
function player_animation_knuckles_crouch() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprKnucklesCrouch;
	        image_index = 0;
	        break;
	    }
    
	    case 5:
	    {
	        image_index = 1;
	        break;
	    }
	}



}
