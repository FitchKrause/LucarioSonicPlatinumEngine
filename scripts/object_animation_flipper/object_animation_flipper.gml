/// @description  object_animation_flipper(tick)
/// @param tick
function object_animation_flipper() {

	switch argument[0]
	{
	    case 0:
	    {
	        image_index = 0;
	        break;
	    }
    
	    case 2:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 4:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 6:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 8:
	    {
	        image_index = 0;
	        animation_tick = 0;
	        animation_running = false;
	        break;
	    }
	}
}