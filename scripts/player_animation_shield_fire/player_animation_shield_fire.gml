/// @description  player_animation_shield_fire(tick)
/// @param tick
function player_animation_shield_fire() {

	switch argument[0]
	{
	    case 0:
	    {
	        sprite_index = sprShieldFire;
	        image_index = 0;
	        shield_backlayer.sprite_index = sprShieldFireBack;
	        shield_backlayer.image_index = 0;
	        break;
	    }
    
	    case 5:
	    {
	        image_index = 1;
	        shield_backlayer.image_index = 1;
	        break;
	    }
    
	    case 10:
	    {
	        image_index = 2;
	        shield_backlayer.image_index = 2;
	        break;
	    }
    
	    case 15:
	    {
	        image_index = 3;
	        shield_backlayer.image_index = 3;
	        break;
	    }
    
	    case 20:
	    {
	        image_index = 4;
	        shield_backlayer.image_index = 4;
	        break;
	    }
    
	    case 25:
	    {
	        image_index = 5;
	        shield_backlayer.image_index = 5;
	        break;
	    }
    
	    case 30:
	    {
	        image_index = 6;
	        shield_backlayer.image_index = 6;
	        break;
	    }
    
	    case 35:
	    {
	        image_index = 7;
	        shield_backlayer.image_index = 7;
	        break;
	    }
    
	    case 40:
	    {
	        image_index = 8;
	        shield_backlayer.image_index = 8;
	        break;
	    }
    
	    case 45:
	    {
	        animation_tick = -1;
	        break;
	    }
	}



}
