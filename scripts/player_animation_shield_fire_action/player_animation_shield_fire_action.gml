/// @description  player_animation_shield_fire_action(tick)
/// @param tick
function player_animation_shield_fire_action() {

	switch argument[0]
	{
	    case 0:
	    {
	        depth = player_id.depth - 1
	        sprite_index = sprShieldFireAction;
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
	        image_index = 2;
	        break;
	    }
    
	    case 10:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 12:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 14:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 16:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 18:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 20:
	    {
	        animation_script = player_animation_shield_fire;
	        animation_speed = 1;
	        animation_running = true;
	        animation_reset = true;
	        break;
	    }
	}



}
