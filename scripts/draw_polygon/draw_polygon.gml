/// @description  draw_polygon(x, y, radius, sides, colour, angle, [outline])
/// @param x
/// @param  y
/// @param  radius
/// @param  sides
/// @param  colour
/// @param  angle
/// @param  [outline]
function draw_polygon() {

	/********************************************************
	  Draws a polygon with given coordinates, radius, sides,
	  and colour.
  
	  > x, y: Coordinates.
	    radius: The size in pixels.
	    sides: Number of edges.
	    colour: The given colour to render.
	    angle: The angle rotation in degrees.
	    outline: Optional, make outline instead filled.
	*********************************************************/

	var sides = argument[3];
	var angle = argument[5];
	var kind = pr_trianglefan;
	var outline = false;
	if (argument_count > 6) { outline = argument[6]; if (outline) { kind = pr_linestrip; sides = argument[3] + 1; } }

	draw_set_colour(argument[4]);
	draw_primitive_begin(kind); 
    
	for (var i = 0; i < sides; i += 1)
	{
	    var edge_x = argument[0] + argument[2] * cos(2 * pi * i / argument[3]);
	    var edge_y = argument[1] + argument[2] * sin(2 * pi * i / argument[3]);
	    var new_coord = rotate_coord(edge_x, edge_y, argument[0], argument[1], angle);
    
	    draw_vertex(new_coord[0], new_coord[1]);
	}

	draw_primitive_end();
	draw_set_color(c_white);



}
