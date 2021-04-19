/// @description  Pause

if (screenshot > -1) and paused and not global.force_paused
{
	draw_rectangle_colour(0, 0, gui_width, gui_height, c_black, c_black, c_black, c_black, false);
	
    // Disable alpha to avoid problems
    display_set_gui_size(width, height);
	gpu_set_blendenable(false);
    
    // Temporal variables for rendering
    var hlen = 40;
    var xoffset = 0;
    var reallen = ((hlen / 2));
    var divoffset = 1;
    var muloffset = 1;
	
    // Render distorsion
    for (j = 0; j < reallen; j += 1)
    {
        if (j == (reallen / 2)) { muloffset = -1; }
        draw_sprite_part_ext(screenshot, 0, 0, (offset + j) - reallen, width, 1, (reallen - xoffset) - (reallen - 1), ((offset + j) - reallen), 1, 1, c_ltgray, 1);
        xoffset += (1 / divoffset) * muloffset;
    }
	
	// Render normal
	for (h = 0; h < height; h += 1)
	{
		if (h >= (offset - 20)) and not (h >= (offset)) { continue; }
		draw_sprite_part_ext(screenshot, 0, 0, h, width, 1, irandom_range(-1, 1), h, 1, 1, c_gray, 1);
	}
    
    /*var xoffset = 0;
    var muloffset = -1;
    for (i = 0; i < reallen; i += 1)
    {
        if (i == (reallen / 2)) { muloffset = 1; }
        draw_sprite_part_ext(screenshot, 0, 0, (offset2 + i) - reallen, width, 1, (reallen - xoffset) - (reallen - 1), ((offset2 + i) - reallen), 1, 1, c_ltgray, 1);
        xoffset += (1 / divoffset) * muloffset;
    }*/

    // Re-enable alpha
	gpu_set_blendenable(true);
    display_set_gui_size(gui_width, gui_height);
}
display_set_gui_size(gui_width, gui_height);