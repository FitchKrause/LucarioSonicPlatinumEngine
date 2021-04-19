/// @description  player_animation_tails_swimend(tick)
/// @param tick
function player_animation_tails_swimend() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprTailsSwim;
	        image_index = 5;
	        break;
	    }
    
	    case 12:
	    {
	        image_index = 6;
	        break;
	    }
    
	    case 24:
	    {
	        image_index = 7;
	        break;
	    }
    
	    case 35:
	    {
	        image_index = 0;
	        animation_tick = 0;
	        break;
	    }
	}



}
