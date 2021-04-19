/// @description  player_animation_knuckles_walk(tick)
/// @param tick
function player_animation_knuckles_walk() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprKnucklesWalk;
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
	        image_index = 4;
	        break;
	    }
    
	    case 5:
	    {
	        image_index = 5;
	        break;
	    }
    
	    case 6:
	    {
	        image_index = 6;
	        break;
	    }
    
	    case 7:
	    {
	        image_index = 7;
	        break;
	    }
    
	    case 8:
	    {
	        image_index = 0;
	        animation_tick = 0;
	        break;
	    }
	}



}
