/// @description  player_trasformation(detransformation)
/// @param detransformation
function player_trasformation()
{
	if not argument[0]
	{
	    if (character_id == CHARACTER_SONIC) and not super_form
	    {
	        animation_table = objResources.anim_sonic;
	        palette_anim_script = palette_animation_sonic_transformation;
	        palette_anim_speed = 1;
	        palette_anim_tick = 0;
	        palette_anim_running = true;
        
	        // Shape 1
	        pallete_color[0, 0] = "4848B6 | 1";
	        pallete_color[0, 1] = "6D48DA | 2";
	        pallete_color[0, 2] = "242491 | 3";
	        pallete_color[0, 3] = "9191FF | 6";
        
	        // Shape 2
	        pallete_color[1, 0] = "8181B4 | 1";
	        pallete_color[1, 1] = "A1A1D9 | 2";
	        pallete_color[1, 2] = "59598F | 3";
	        pallete_color[1, 3] = "BCBCFF | 6";
        
	        // Shape 3
	        pallete_color[2, 0] = "B3B3B2 | 1";
	        pallete_color[2, 1] = "C8C8D8 | 2";
	        pallete_color[2, 2] = "93938D | 3";
	        pallete_color[2, 3] = "D9D9FF | 6";
        
	        // Shape 4
	        pallete_color[3, 0] = "D4D4B0 | 1";
	        pallete_color[3, 1] = "E0E0D7 | 2";
	        pallete_color[3, 2] = "E0E0E0 | 3";
	        pallete_color[3, 3] = "EAEAFF | 6";
        
	        // Shape 5
	        pallete_color[4, 0] = "E8E8AE | 1";
	        pallete_color[4, 1] = "EEEED6 | 2";
	        pallete_color[4, 2] = "DCDC89 | 3";
	        pallete_color[4, 3] = "F4F4FF | 6";
	    }
	}
	else
	{
	    if (character_id == CHARACTER_SONIC) and super_form
	    {
	        animation_table = objResources.anim_sonic;
	        palette_anim_script = palette_animation_sonic_detransformation;
	        palette_anim_speed = 1;
	        palette_anim_tick = 0;
	        palette_anim_running = true;
        
	        // Shape 1
	        pallete_color[0, 0] = "4848B6 | 1";
	        pallete_color[0, 1] = "6D48DA | 2";
	        pallete_color[0, 2] = "242491 | 3";
	        pallete_color[0, 3] = "9191FF | 6";
        
	        // Shape 2
	        pallete_color[1, 0] = "8181B4 | 1";
	        pallete_color[1, 1] = "A1A1D9 | 2";
	        pallete_color[1, 2] = "59598F | 3";
	        pallete_color[1, 3] = "BCBCFF | 6";
        
	        // Shape 3
	        pallete_color[2, 0] = "B3B3B2 | 1";
	        pallete_color[2, 1] = "C8C8D8 | 2";
	        pallete_color[2, 2] = "93938D | 3";
	        pallete_color[2, 3] = "D9D9FF | 6";
        
	        // Shape 4
	        pallete_color[3, 0] = "D4D4B0 | 1";
	        pallete_color[3, 1] = "E0E0D7 | 2";
	        pallete_color[3, 2] = "E0E0E0 | 3";
	        pallete_color[3, 3] = "EAEAFF | 6";
        
	        // Shape 5
	        pallete_color[4, 0] = "E8E8AE | 1";
	        pallete_color[4, 1] = "EEEED6 | 2";
	        pallete_color[4, 2] = "DCDC89 | 3";
	        pallete_color[4, 3] = "F4F4FF | 6";
	    }
	}
}