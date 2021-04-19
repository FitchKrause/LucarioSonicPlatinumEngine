/// @description  player_animation_knuckles_corkscrew(tick)
/// @param tick
function player_animation_knuckles_corkscrew() {

	switch argument[0]
	{
	    case 0:
	    {
	        if (facing == 1)
	        {
	            sprite_index = sprKnucklesFlip;
	        }
	        else if (facing == -1)
	        {
	            sprite_index = sprKnucklesFlipReverse;
	        }
	        break;
	    }
	}



}
