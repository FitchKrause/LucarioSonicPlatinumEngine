/// @description  player_animation_tails_cliff(tick)
/// @param tick
function player_animation_tails_cliff() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprTailsCliff;
	        image_index = 0;
	        break;
	    }
    
	    case 20:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 39:
	    {
	        image_index = 0;
	        animation_tick = 0;
	        break;
	    }
	}



}
