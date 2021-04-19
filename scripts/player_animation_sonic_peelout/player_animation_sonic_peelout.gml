/// @description  player_animation_sonic_peelout(tick)
/// @param tick
function player_animation_sonic_peelout() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprSonicWalk;
	        image_index = 0;
	        break;
	    }
    
	    case 4:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 8:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 12:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 16:
	    {
	        image_index = 4;
	        break;
	    }
    
	    case 20:
	    {
	        image_index = 5;
	        break;
	    }
    
	    case 24:
	    {
	        sprite_index = sprSonicRun;
	        image_index = 0;
	        break;
	    }
    
	    case 26:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 28:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 30:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 32:
	    {
	        sprite_index = sprSonicSprint;
	        image_index = 0;
	        break;
	    }
    
	    case 34:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 36:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 38:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 40:
	    {
	        sprite_index = sprSonicSprint;
	        image_index = 0;
	        animation_tick = 32;
	        break;
	    }
	}



}
