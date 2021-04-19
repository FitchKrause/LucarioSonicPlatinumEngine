/// @description  draw_progressbar(x, y, width, height, percent, color, outline_length, outline_color, infinite)
/// @param x
/// @param  y
/// @param  width
/// @param  height
/// @param  percent
/// @param  color
/// @param  outline_length
/// @param  outline_color
/// @param  infinite
function draw_progressbar() {
	// SRB2 progress bar like style
	// INCOMPLETE


	var xx = argument[0];
	var yy = argument[1];
	var ww = xx + argument[2];
	var hh = yy + argument[3];
	//var perc = argument[4];
	var colour = argument[5];
	//var outline_length = argument[6];
	//var outline_color = argument[7];
	var infinite = argument[8];
	var color_offset = (objScreen.image_index div 8) mod 14;

	// Background
	draw_set_alpha(1);
	draw_set_colour(c_black);
	draw_rectangle(xx, yy, ww, hh, false);

	// Foreground
	if infinite
	{
	    draw_set_alpha(1);
	    for (i = 0; i < ((ww * 2) / infinite); i += 1)
	    {
	        draw_set_colour(darken_colour(colour, (100 - (7 * i)) + (color_offset * 7)));
	        draw_rectangle(xx + (((ww * 2) / infinite) * i), yy, xx + ((ww * 2) / infinite) + (((ww * 2) / infinite) * i), hh, false)
	    }
	}



}
