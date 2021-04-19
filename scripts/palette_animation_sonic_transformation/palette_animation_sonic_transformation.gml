/// @description  palette_animation_sonic_transformation(tick)
/// @param tick
function palette_animation_sonic_transformation()
{
	switch argument[0]
	{
	    case 0:
	    {
	        palette_index = 0;
	        break;
	    }
    
	    case 3:
	    {
	        palette_index = 1;
	        break;
	    }
    
	    case 6:
	    {
	        palette_index = 2;
	        break;
	    }
    
	    case 9:
	    {
	        palette_index = 3;
	        break;
	    }
    
	    case 12:
	    {
	        palette_index = 4;
	        break;
	    }
	}
}