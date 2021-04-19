/// @description  player_animation_supersonic_idle(tick)
/// @param tick
function player_animation_supersonic_idle() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprSuperSonicIdle;
	        image_index = 0;
	        break;
	    }
    
	    case 4:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 8:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 12:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 16:
	    {
	        image_index = 0;
	        animation_tick = 0;
	        break;
	    }
	}



}
