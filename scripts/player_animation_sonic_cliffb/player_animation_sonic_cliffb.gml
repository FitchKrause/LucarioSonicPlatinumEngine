/// @description  player_animation_sonic_cliffb(tick)
/// @param tick
function player_animation_sonic_cliffb() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprSonicCliffB;
	        image_index = 0;
	        break;
	    }
    
	    case 10:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 20:
	    {
	        image_index = 2;
	        break;
	    }
    
	    case 30:
	    {
	        image_index = 3;
	        break;
	    }
    
	    case 40:
	    {
	        image_index = 0;
	        animation_tick = 0;
	        break;
	    }
	}



}
