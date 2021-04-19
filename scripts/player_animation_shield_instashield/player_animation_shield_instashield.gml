/// @description  player_animation_shield_instashield(tick)
/// @param tick
function player_animation_shield_instashield() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprShieldInstashield;
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
	        image_index = 3;
	        break;
	    }
    
	    case 8:
	    {
	        image_index = 4;
	        break;
	    }
    
	    case 10:
	    {
	        instance_destroy();
	        break;
	    }
	}



}
