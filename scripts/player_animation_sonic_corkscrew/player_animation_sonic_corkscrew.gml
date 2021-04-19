/// @description  player_animation_sonic_corkscrew(tick)
/// @param tick
function player_animation_sonic_corkscrew() {

	switch argument[0]
	{
	    case 0:
	    {
	        if (facing == 1)
	        {
	            sprite_index = sprSonicFlip;
	        }
	        else if (facing == -1)
	        {
	            sprite_index = sprSonicFlipReverse;
	        }
	        break;
	    }
	}



}
