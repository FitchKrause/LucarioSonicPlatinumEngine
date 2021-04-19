/// @description  player_animation_shield_normal(tick)
/// @param tick
function player_animation_shield_normal()
{
	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprShieldNormal;
	        image_index = 0;
			image_alpha = 0.5;
	        break;
	    }
    
	    case 4:
	    {
	        image_index = 1;
			image_alpha = 0.5;
	        break;
	    }
    
	    case 8:
	    {
	        image_index = 2;
			image_alpha = 0.5;
	        break;
	    }
    
	    case 12:
	    {
	        animation_tick = -1;
	        break;
	    }
	}
}