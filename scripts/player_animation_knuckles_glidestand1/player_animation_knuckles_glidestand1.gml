/// @description  player_animation_knuckles_glidestand1(tick)
/// @param tick
function player_animation_knuckles_glidestand1() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprKnucklesCrouch;
	        image_index = 1;
	        break;
	    }
    
	    case 7:
	    {
	        image_index = 0;
	        break;
	    }
    
	    case 15:
	    {
	        animation_new = "idle";
	        break;
	    }
	}



}
