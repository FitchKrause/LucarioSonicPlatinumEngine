/// @description  object_animation_spring(tick)
/// @param tick
function object_animation_spring() {

	switch argument[0]
	{
	    case 1:
	    {
	        image_index = 0;
	        break;
	    }
    
	    case 3:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 10:
	    {
	        animation_tick = 0;
	        animation_running = false;
	        image_index = 1;
	        break;
	    }
	}



}
