/// @description  player_animation_sonic_cliff(tick)
/// @param tick
function player_animation_sonic_cliff() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprSonicCliff;
	        image_index = 0;
	        break;
	    }
    
	    case 12:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 24:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 36:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 48:
	    {
	        image_index = 0;
	        animation_tick = 0;
	        break;
	    }
	}



}
