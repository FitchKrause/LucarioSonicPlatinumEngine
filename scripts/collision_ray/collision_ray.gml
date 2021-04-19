/// @description  collision_ray(ox, oy, rotation, index)
/// @param ox
/// @param  oy
/// @param  rotation
/// @param  index
function collision_ray(argument0, argument1, argument2, argument3) {
	/*
	Evaluates collision between the given object or instance and a line (ox * 2) length
	at (oy) height in pixels from the calling instance's center point.

	> ox: half the length of the line
	> oy: height offset from the calling instance's center point
	> rotation: angle to rotate the line
	> index: object or instance index to evaluate

	< return value: first matching instance id colliding with the rectangle, or noone on failure
	*/

	var x1 = floor(x) - (cosine[argument2] * argument0) + (sine[argument2] * argument1);
	var y1 = floor(y) + (sine[argument2] * argument0) + (cosine[argument2] * argument1);
	var x2 = floor(x) + (cosine[argument2] * argument0) + (sine[argument2] * argument1);
	var y2 = floor(y) - (sine[argument2] * argument0) + (cosine[argument2] * argument1);
	return collision_line(x1, y1, x2, y2, argument3, true, true);



}
