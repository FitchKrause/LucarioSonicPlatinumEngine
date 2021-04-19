/// @description  collision_pixel(ox, oy, rotation, index)
/// @param ox
/// @param  oy
/// @param  rotation
/// @param  index
function collision_pixel(argument0, argument1, argument2, argument3) {

	var xx = floor(x) + (cosine[argument2] * argument0) + (sine[argument2] * argument1);
	var yy = floor(y) + (sine[argument2] * argument0) + (cosine[argument2] * argument1);
	return collision_point(xx, yy, argument3, true, true);



}
