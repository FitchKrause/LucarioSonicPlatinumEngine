/// @description  player_animation_sonic_hurt(tick)
/// @param tick
function player_animation_sonic_hurt() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprSonicHurt;
	        image_index = 0;
	        animation_tick = -1;
	        break;
	    }
    
	    /*case 8:
	    {
	        image_index = 1;
	        break;
	    }
    
	    case 16:
	    {
	        animation_tick = -1;
	        break;
	    }*/
	}



}
