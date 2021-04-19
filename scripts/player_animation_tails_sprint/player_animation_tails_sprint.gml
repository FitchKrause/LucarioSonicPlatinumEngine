/// @description  player_animation_tails_sprint(tick)
/// @param tick
function player_animation_tails_sprint() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprTailsRun;
	        image_index = 4;
	        break;
	    }
    
	    case 2:
	    {
	        image_index = 5;
	        break;
	    }
    
	    case 4:
	    {
	        break;
	    }
    
	    case 6:
	    {
	        image_index = 4;
	        animation_tick = 0;
	        break;
	    }
	}



}
