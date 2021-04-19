/// @description  draw_quad(x1, y1, x2, y2, x3, y3, x4, y4, colour)
/// @param x1
/// @param  y1
/// @param  x2
/// @param  y2
/// @param  x3
/// @param  y3
/// @param  x4
/// @param  y4
/// @param  colour
function draw_quad() {

	/********************************************************
	  Draws a quad with given 4-vertex coordinates and colour.
  
	  > x1, y1: Vertex 1 coordinates.
	    x2, y2: Vertex 2 coordinates.
	    x3, y3: Vertex 3 coordinates.
	    x4, y4: Vertex 4 coordinates.
	    colour: The given colour to render.
	*********************************************************/

	draw_set_colour(argument[8]);   //pr_trianglefan  pr_linestrip

	draw_primitive_begin(pr_trianglefan);
	draw_vertex(argument[0], argument[1]);
	draw_vertex(argument[2], argument[3]);
	draw_vertex(argument[4], argument[5]);
	draw_vertex(argument[6], argument[7]);
	draw_primitive_end();

	draw_set_color(c_white);



}
