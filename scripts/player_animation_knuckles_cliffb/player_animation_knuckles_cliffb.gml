/// @description  player_animation_knuckles_cliffb(tick)
/// @param tick
function player_animation_knuckles_cliffb() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprKnucklesBrake;
	        image_index = 4;
	        break;
	    }
    
	    case 8:
	    {
	        image_index = 5;
	        break;
	    }
    
	    case 16:
	    {
	        image_index = 6;
	        break;
	    }
    
	    case 24:
	    {
	        image_index = 7;
	        break;
	    }
    
	    case 32:
	    {
	        image_index = 8;
	        break;
	    }
    
	    case 96:
	    {
	        image_index = 9;
	        break;
	    }
    
	    case 104:
	    {
	        image_index = 10;
	        break;
	    }
    
	    case 116:
	    {
	        image_index = 11;
	        break;
	    }
    
	    case 124:
	    {
	        image_index = 12;
	        break;
	    }
    
	    case 132:
	    {
	        image_index = 13;
	        break;
	    }
    
	    case 140:
	    {
	        image_index = 10;
	        break;
	    }
    
	    case 147:
	    {
	        image_index = 11;
	        animation_tick = 116;
	        break;
	    }
	}



}
