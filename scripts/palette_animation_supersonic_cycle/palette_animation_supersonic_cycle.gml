/// @description  palette_animation_supersonic_cycle(tick)
/// @param tick
function palette_animation_supersonic_cycle()
{
	switch argument[0]
	{
	    case 0:
	    {
	        palette_index = 0;
	        break;
	    }
    
	    case 12:
	    {
	        palette_index = 1;
	        break;
	    }
    
	    case 24:
	    {
	        palette_index = 2;
	        break;
	    }
    
	    case 36:
	    {
	        palette_index = 3;
	        break;
	    }
    
	    case 48:
	    {
	        palette_index = 4;
	        break;
	    }
    
	    case 60:
	    {
	        palette_index = 5;
	        break;
	    }
    
	    case 72:
	    {
	        palette_index = 6;
	        break;
	    }
    
	    case 84:
	    {
	        palette_index = 7;
	        break;
	    }
    
	    case 96:
	    {
	        palette_index = 8;
	        break;
	    }
    
	    case 108:
	    {
	        palette_index = 9;
	        break;
	    }
    
	    case 120:
	    {
	        palette_anim_tick = -1;
	        break;
	    }
	}
}