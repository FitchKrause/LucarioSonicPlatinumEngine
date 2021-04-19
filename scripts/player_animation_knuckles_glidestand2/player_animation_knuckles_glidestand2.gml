/// @description  player_animation_knuckles_glidestand2(tick)
/// @param tick
function player_animation_knuckles_glidestand2() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprKnucklesGlideSlide;
	        image_index = 1;
	        break;
	    }
    
	    case 7:
	    {
	        animation_new = "idle";
	        break;
	    }
	}



}
