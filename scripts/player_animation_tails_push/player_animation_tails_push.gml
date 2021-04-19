/// @description  player_animation_tails_push(tick)
/// @param tick
function player_animation_tails_push() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprTailsPush;
	        image_index = 0;
	        break;
	    }
    
	    case 32:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 64:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 96:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 127:
	    {
	        image_index = 0;
	        animation_tick = 0;
	        break;
	    }
	}



}
