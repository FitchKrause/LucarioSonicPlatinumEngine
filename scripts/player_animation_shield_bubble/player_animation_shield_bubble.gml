/// @description  player_animation_shield_bubble(tick)
/// @param tick
function player_animation_shield_bubble() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprShieldBubble;
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
	        image_index = 0;
	        break;
	    }
    
	    case 9:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 12:
	    {
	        image_index = 0;
	        break;
	    }
    
	    case 15:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 18:
	    {
	        image_index = 0;
	        break;
	    }
    
	    case 21:
	    {
	        image_index = 4;
	        break;
	    }
    
	    case 24:
	    {
	        image_index = 0;
	        break;
	    }
    
	    case 27:
	    {
	        image_index = 5;
	        break;
	    }
    
	    case 30:
	    {
	        image_index = 0;
	        break;
	    }
    
	    case 33:
	    {
	        image_index = 6;
	        break;
	    }
    
	    case 36:
	    {
	        image_index = 0;
	        break;
	    }
    
	    case 39:
	    {
	        image_index = 7;
	        break;
	    }
    
	    case 42:
	    {
	        image_index = 0;
	        break;
	    }
    
	    case 45:
	    {
	        image_index = 8;
	        break;
	    }
    
	    case 48:
	    {
	        image_index = 0;
	        break;
	    }
    
	    case 51:
	    {
	        image_index = 9;
	        break;
	    }
    
	    case 54:
	    {
	        animation_tick = -1;
	        break;
	    }
	}



}
