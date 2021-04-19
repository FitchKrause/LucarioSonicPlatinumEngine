/// @description  player_animation_sonic_getair(tick)
/// @param tick
function player_animation_sonic_getair() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprSonicGetAir;
	        image_index = 0;
	        break;
	    }
    
	    case 24:
	    {
	        animation_new = "walk";
	        animation_speed = 0.125;
	        break;
	    }
	}



}
