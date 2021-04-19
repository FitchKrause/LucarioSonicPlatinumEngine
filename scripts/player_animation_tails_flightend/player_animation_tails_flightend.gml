/// @description  player_animation_tails_flightend(tick)
/// @param tick
function player_animation_tails_flightend() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprTailsFlight;
	        image_index = 1;
	        break;
	    }
    
	    case 12:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 23:
	    {
	        image_index = 1;
	        animation_tick = 0;
	        break;
	    }
	}



}
