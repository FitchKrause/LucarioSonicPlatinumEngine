/// @description  player_animation_sonic_transform(tick)
/// @param tick
function player_animation_sonic_transform() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprSonicTransform;
	        image_index = 0;
	        break;
	    }
    
	    case 3:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 6:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 9:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 12:
	    {
	        image_index = 4;
	        break;
	    }
    
	    case 15:
	    {
	        image_index = 2;
	        break;
	    }
	}



}
