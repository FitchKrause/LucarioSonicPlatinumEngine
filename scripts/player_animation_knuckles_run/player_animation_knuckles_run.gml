/// @description  player_animation_knuckles_run(tick)
/// @param tick
function player_animation_knuckles_run() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprKnucklesRun;
	        image_index = 0;
	        break;
	    }
    
	    case 1:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 2:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 3:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 4:
	    {
	        image_index = 0;
	        animation_tick = 0;
	        break;
	    }
	}



}
