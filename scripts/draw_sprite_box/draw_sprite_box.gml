/// @description  draw_sprite_box(sprite, index, x, y, width, height, scale, color, alpha, [scaled])
/// @param sprite
/// @param  index
/// @param  x
/// @param  y
/// @param  width
/// @param  height
/// @param  scale
/// @param  color
/// @param  alpha
/// @param  [scaled]
function draw_sprite_box() {

	var sprite = argument[0];
	var size = sprite_get_width(sprite) / 3;
	var index = argument[1];
	var xx = argument[2];
	var yy = argument[3];
	var width = xx + argument[4];
	var height = yy + argument[5];
	var scale = argument[6];
	var color = argument[7];
	var alpha = argument[8];
	var scaled = false;
	if (argument_count > 9) { scaled = argument[9]; }

	// Top
	draw_sprite_part_ext(sprite, index, 0, 0, size, size, xx, yy, scale, scale, color, alpha); // Left
	draw_sprite_part_ext(sprite, index, size * 2, 0, size, size, width, yy, scale, scale, color, alpha); // Right

	// Bottom
	draw_sprite_part_ext(sprite, index, 0, size * 2, size, size, xx, height, scale, scale, color, alpha); // Left
	draw_sprite_part_ext(sprite, index, size * 2, size * 2, size, size, width, height, scale, scale, color, alpha); // Right

	if not scaled
	{
	    // Top-Middle
	    var total_length = ceil((width - xx) / (size * scale));
	    for (var i = 0; i < total_length - 1; i += 1) { draw_sprite_part_ext(sprite, index, size, 0, size * select((i == (total_length - 2)), 1, frac((width - xx) / (size * scale))), size, xx + (size * scale) + ((size * scale) * i), yy, scale, scale, color, alpha); }
    
	    // Bottom-Middle
	    var total_length = ceil((width - xx) / (size * scale));
	    for (var i = 0; i < total_length - 1; i += 1) { draw_sprite_part_ext(sprite, index, size, size * 2, size * select((i == (total_length - 2)), 1, frac((width - xx) / (size * scale))), size, xx + (size * scale) + ((size * scale) * i), height, scale, scale, color, alpha); }
    
	    // Left-Middle
	    var total_length = ceil((height - yy) / (size * scale));
	    for (var i = 0; i < total_length - 1; i += 1) { draw_sprite_part_ext(sprite, index, 0, size, size, size * select((i == (total_length - 2)), 1, frac((height - yy) / (size * scale))), xx, yy + (size * scale) + ((size * scale) * i), scale, scale, color, alpha); }
    
	    // Right-Middle
	    var total_length = ceil((height - yy) / (size * scale));
	    for (var i = 0; i < total_length - 1; i += 1) { draw_sprite_part_ext(sprite, index, size * 2, size, size, size * select((i == (total_length - 2)), 1, frac((height - yy) / (size * scale))), width, yy + (size * scale) + ((size * scale) * i), scale, scale, color, alpha); }
    
	    // Center-Middle
	    var total_length = ceil((height - yy) / (size * scale));
	    var total_length2 = ceil((width - xx) / (size * scale));
	    for (var i = 0; i < total_length - 1; i += 1) { for (var j = 0; j < total_length2 - 1; j += 1) { draw_sprite_part_ext(sprite, index, size, size, size * select((i == (total_length2 - 2)), 1, frac((width - xx) / (size * scale))), size * select((i == (total_length - 2)), 1, frac((height - yy) / (size * scale))), xx + (size * scale) + ((size * scale) * j), yy + (size * scale) + ((size * scale) * i), scale, scale, color, alpha); } }
	}
	else
	{
	    // Top-Middle
	    draw_sprite_part_ext(sprite, index, size, 0, size, size, xx + (size * scale), yy, ((width - xx) - (size * scale)) / size, scale, color, alpha); 
    
	    // Bottom-Middle
	    draw_sprite_part_ext(sprite, index, size, size * 2, size, size, xx + (size * scale), height, ((width - xx) - (size * scale)) / size, scale, color, alpha); // Middle
    
	    // Middle
	    draw_sprite_part_ext(sprite, index, 0, size, size, size, xx, yy + (size * scale), scale, ((height - yy) - (size * scale)) / size, color, alpha); // Left
	    draw_sprite_part_ext(sprite, index, size * 2, size, size, size, width, yy + (size * scale), scale, ((height - yy) - (size * scale)) / size, color, alpha); // Right
	    draw_sprite_part_ext(sprite, index, size, size, size, size, xx + (size * scale), yy + (size * scale), ((width - xx) - (size * scale)) / size, ((height - yy) - (size * scale)) / size, color, alpha); // Middle
	}



}
