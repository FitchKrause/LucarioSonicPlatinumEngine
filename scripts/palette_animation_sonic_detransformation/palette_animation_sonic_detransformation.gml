/// @description  palette_animation_sonic_detransformation(tick)
/// @param tick
function palette_animation_sonic_detransformation()
{
	switch argument[0]
	{
	    case 0:
	    {
	        palette_index = 4;
	        break;
	    }
    
	    case 3:
	    {
	        palette_index = 3;
	        break;
	    }
    
	    case 6:
	    {
	        palette_index = 2;
	        break;
	    }
    
	    case 9:
	    {
	        palette_index = 1;
	        break;
	    }
    
	    case 12:
	    {
	        palette_index = 0;
	        break;
	    }
    
	    case 15:
	    {
	        player_reset_palette();
	        break;
	    }
	}
}