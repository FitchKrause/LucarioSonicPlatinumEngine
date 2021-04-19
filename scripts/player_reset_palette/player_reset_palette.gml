/// @description  player_reset_palette()
function player_reset_palette()
{
	palette_enabled = false;
	pallete_color = undefined;
	palette_anim_script = -1;
	palette_anim_tick = 0;
	palette_anim_speed = 0;
	palette_anim_running = false;
	if surface_exists(palette_surface) { surface_free(palette_surface); }
	switch character_id
	{
	    case CHARACTER_SONIC:
	    {
	        if super_form
	        {
	            // Shape 1
	            pallete_color[0][0] = "E0E080 | 1";
	            pallete_color[0][1] = "E0E0E0 | 2";
	            pallete_color[0][2] = "E0E020 | 3";
	            pallete_color[0][3] = "E0E0E0 | 6";
            
	            // Shape 2
	            pallete_color[1][0] = "E0E060 | 1";
	            pallete_color[1][1] = "E0E0E0 | 2";
	            pallete_color[1][2] = "E0E000 | 3";
	            pallete_color[1][3] = "E0E0A0 | 6";
            
	            // Shape 3
	            pallete_color[2][0] = "E0E040 | 1";
	            pallete_color[2][1] = "E0E0C0 | 2";
	            pallete_color[2][2] = "E0E000 | 3";
	            pallete_color[2][3] = "E0E080 | 6";
            
	            // Shape 4
	            pallete_color[3][0] = "E0E060 | 1";
	            pallete_color[3][1] = "E0E0E0 | 2";
	            pallete_color[3][2] = "E0E000 | 3";
	            pallete_color[3][3] = "E0E0A0 | 6";
            
	            // Shape 5
	            pallete_color[4][0] = "E0E080 | 1";
	            pallete_color[4][1] = "E0E0E0 | 2";
	            pallete_color[4][2] = "E0E020 | 3";
	            pallete_color[4][3] = "E0E0C0 | 6";
            
	            // Shape 6
	            pallete_color[5][0] = "E0E0A0 | 1";
	            pallete_color[5][1] = "E0E0E0 | 2";
	            pallete_color[5][2] = "E0E040 | 3";
	            pallete_color[5][3] = "E0E0E0 | 6";
            
	            // Shape 7
	            pallete_color[6][0] = "E0E0C0 | 1";
	            pallete_color[6][1] = "E0E0E0 | 2";
	            pallete_color[6][2] = "E0E060 | 3";
	            pallete_color[6][3] = "E0E0E0 | 6";
            
	            // Shape 8
	            pallete_color[7][0] = "E0E0E0 | 1";
	            pallete_color[7][1] = "E0E0E0 | 2";
	            pallete_color[7][2] = "E0E080 | 3";
	            pallete_color[7][3] = "E0E0E0 | 6";
            
	            // Shape 9
	            pallete_color[8][0] = "E0E0E0 | 1";
	            pallete_color[8][1] = "E0E0E0 | 2";
	            pallete_color[8][2] = "E0E060 | 3";
	            pallete_color[8][3] = "E0E0E0 | 6";
            
	            // Shape 10
	            pallete_color[9][0] = "E0E0A0 | 1";
	            pallete_color[9][1] = "E0E0E0 | 2";
	            pallete_color[9][2] = "E0E040 | 3";
	            pallete_color[9][3] = "E0E0E0 | 6;"

				// Animation cycle
				palette_enabled = true;
				palette_sprite = sprPaletteSonic;
	            palette_anim_script = palette_animation_supersonic_cycle;
	            palette_anim_speed = 1;
	            palette_anim_running = true;
	            break;
	        }
	        break;
	    }
	}
}