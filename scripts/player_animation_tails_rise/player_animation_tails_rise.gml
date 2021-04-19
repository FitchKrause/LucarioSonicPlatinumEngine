/// @description  player_animation_tails_rise(tick)
/// @param tick
function player_animation_tails_rise() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprTailsRise;
	        image_index = 0;
	        break;
	    }
    
	    case 4:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 7:
	    {
	        image_index = 0;
	        animation_tick = 0;
	        break;
	    }
	}



}
