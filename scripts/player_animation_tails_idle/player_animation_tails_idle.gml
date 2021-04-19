/// @description  player_animation_tails_idle(tick)
/// @param tick
function player_animation_tails_idle() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprTailsIdle;
	        image_index = 0;
	        break;
	    }
    
	    case 80:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 88:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 96:
	    {
	        image_index = 0;
	        break;
	    }
    
	    case 160:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 168:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 176:
	    {
	        image_index = 0;
	        break;
	    }
    
	    case 248:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 376:
	    {
	        image_index = 4;
	        break;
	    }
    
	    case 384:
	    {
	        image_index = 5;
	        break;
	    }
    
	    case 392:
	    {
	        image_index = 6;
	        break;
	    }
    
	    case 400:
	    {
	        image_index = 5;
	        break;
	    }
    
	    case 408:
	    {
	        image_index = 6;
	        break;
	    }
    
	    case 416:
	    {
	        image_index = 5;
	        break;
	    }
    
	    case 424:
	    {
	        image_index = 6;
	        break;
	    }
    
	    case 432:
	    {
	        image_index = 5;
	        break;
	    }
    
	    case 440:
	    {
	        image_index = 6;
	        break;
	    }
    
	    case 448:
	    {
	        image_index = 5;
	        break;
	    }
    
	    case 456:
	    {
	        image_index = 6;
	        break;
	    }
    
	    case 464:
	    {
	        image_index = 4;
	        break;
	    }
    
	    case 472:
	    {
	        image_index = 3;
	        animation_tick = 248;
	        break;
	    }
	}



}
