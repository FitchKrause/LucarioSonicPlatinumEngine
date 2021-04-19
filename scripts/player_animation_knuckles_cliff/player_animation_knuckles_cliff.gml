/// @description  player_animation_knuckles_cliff(tick)
/// @param tick
function player_animation_knuckles_cliff() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprKnucklesBrake;
	        image_index = 2;
	        break;
	    }
    
	    case 8:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 16:
	    {
	        image_index = 4;
	        break;
	    }
    
	    case 24:
	    {
	        image_index = 5;
	        break;
	    }
    
	    case 32:
	    {
	        image_index = 6;
	        break;
	    }
    
	    case 40:
	    {
	        image_index = 7;
	        break;
	    }
    
	    case 48:
	    {
	        image_index = 8;
	        break;
	    }
    
	    case 108:
	    {
	        image_index = 9;
	        break;
	    }
    
	    case 120:
	    {
	        image_index = 10;
	        break;
	    }
    
	    case 132:
	    {
	        image_index = 11;
	        break;
	    }
    
	    case 140:
	    {
	        image_index = 12;
	        break;
	    }
    
	    case 148:
	    {
	        image_index = 13;
	        break;
	    }
    
	    case 156:
	    {
	        image_index = 10;
	        break;
	    }
    
	    case 163:
	    {
	        image_index = 11;
	        animation_tick = 132;
	        break;
	    }
	}



}
