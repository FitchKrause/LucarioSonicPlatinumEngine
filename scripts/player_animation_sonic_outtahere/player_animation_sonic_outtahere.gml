/// @description  player_animation_sonic_outtahere(tick)
/// @param tick
function player_animation_sonic_outtahere() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprSonicOuttaHere;
	        image_index = 0;
	        break;
	    }
    
	    case 36:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 46:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 56:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 66:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 76:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 100:
	    {
	        image_index = 4;
	        break;
	    }
    
	    case 116:
	    {
	        image_index = 5;
	        break;
	    }
    
	    case 128:
	    {
	        image_index = 6;
	        break;
	    }
	}



}
