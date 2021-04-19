/// @description  player_animation_tails_flip(tick)
/// @param tick
function player_animation_tails_flip() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprTailsFlip;
	        image_index = 0;
	        break;
	    }
    
	    case 6:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 12:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 18:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 24:
	    {
	        image_index = 4;
	        break;
	    }
    
	    case 30:
	    {
	        image_index = 5;
	        break;
	    }
    
	    case 36:
	    {
	        image_index = 6;
	        break;
	    }
    
	    case 42:
	    {
	        image_index = 7;
	        break;
	    }
    
	    case 48:
	    {
	        image_index = 8;
	        break;
	    }
    
	    case 54:
	    {
	        image_index = 9;
	        break;
	    }
    
	    case 60:
	    {
	        image_index = 10;
	        break;
	    }
    
	    case 66:
	    {
	        image_index = 11;
	        break;
	    }
    
	    case 72:
	    {
	        animation_new = "walk";
	        animation_speed = 0.125;
	        if objData.falling_animations { animation_new = "fall"; }
	        break;
	    }
	}



}
