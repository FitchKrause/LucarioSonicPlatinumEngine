/// @description  player_animation_tails_spindash(tick)
/// @param tick
function player_animation_tails_spindash() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprTailsSpindash;
	        image_index = 0;
	        break;
	    }
    
	    case 1:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 2:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 3:
	    {
	        image_index = 0;
	        animation_tick = 0;
	        break;
	    }
	}



}
