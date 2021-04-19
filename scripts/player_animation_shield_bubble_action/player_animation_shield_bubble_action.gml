/// @description  player_animation_shield_bubble_action(tick)
/// @param tick
function player_animation_shield_bubble_action() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprShieldBubbleAction;
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
	        image_index = 1;
	        break;
	    }
    
	    case 12:
	    {
	        image_index = 0;
	        break;
	    }
    
	    case 14:
	    {
	        animation_script = player_animation_shield_bubble;
	        animation_speed = 1;
	        animation_running = true;
	        animation_reset = true;
	        break;
	    }
	}



}
