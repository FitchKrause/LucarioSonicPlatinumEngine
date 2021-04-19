/// @description  player_animation_shield_lightning(tick)
/// @param tick
function player_animation_shield_lightning() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprShieldLightning;
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
    
	    case 10:
	    {
	        image_index = 4;
	        break;
	    }
    
	    case 14:
	    {
	        image_index = 5;
	        break;
	    }
    
	    case 18:
	    {
	        image_index = 6;
	        break;
	    }
    
	    case 22:
	    {
	        image_index = 7;
	        break;
	    }
    
	    case 26:
	    {
	        image_index = 8;
	        break;
	    }
    
	    case 30:
	    {
	        image_index = 9;
	        break;
	    }
    
	    case 34:
	    {
	        image_index = 10;
	        break;
	    }
    
	    case 38:
	    {
	        image_index = 11;
	        break;
	    }
    
	    case 42:
	    {
	        image_index = 0;
	        break;
	    }
    
	    case 44:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 46:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 50:
	    {
	        image_index = 11;
	        depth = -depth;
	        break;
	    }
    
	    case 54:
	    {
	        image_index = 10;
	        break;
	    }
    
	    case 58:
	    {
	        image_index = 9;
	        break;
	    }
    
	    case 62:
	    {
	        image_index = 8;
	        break;
	    }
    
	    case 66:
	    {
	        image_index = 7;
	        break;
	    }
    
	    case 70:
	    {
	        image_index = 6;
	        break;
	    }
    
	    case 74:
	    {
	        image_index = 5;
	        break;
	    }
    
	    case 78:
	    {
	        image_index = 4;
	        break;
	    }
    
	    case 82:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 86:
	    {
	        depth = -depth;
	        animation_tick = -1;
	        break;
	    }
	}



}
