/// @description  player_animation_tails_corkscrew(tick)
/// @param tick
function player_animation_tails_corkscrew() {

	switch argument[0]
	{
	    case 0:
	    {
	        if (facing == 1)
	        {
	            sprite_index = sprTailsFlip;
	        }
	        else if (facing == -1)
	        {
	            sprite_index = sprTailsFlipReverse;
	        }
	        break;
	    }
	}



}
