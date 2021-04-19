/// @description  rotate_coord(x, y, offset_x, offset_y, angle)
/// @param x
/// @param  y
/// @param  offset_x
/// @param  offset_y
/// @param  angle
function rotate_coord() {

	var rads = degtorad(argument[4]);
	var coord;
	var newX = argument[0] - argument[2];
	var newY = argument[1] - argument[3];

	edgeX = newX * cos(rads) - newY * sin(rads);
	edgeY = newX * sin(rads) + newY * cos(rads);

	coord[0] = edgeX + argument[2];
	coord[1] = edgeY + argument[3];

	return coord;




}
