/// @description  collision_box(ox, oy, invert, index)
/// @param ox
/// @param  oy
/// @param  invert
/// @param  index
function collision_box(argument0, argument1, argument2, argument3) {
	/*
	Evaluates collision between the given object or instance and a rectangle of size {ox * 2, oy * 2} centered on the calling instance.

	> ox, oy: the half-width and half-height of the rectangle
	> invert: boolean; if true, switches ox and oy
	> index: object or instance index to evaluate

	< return value: first matching instance id colliding with the rectangle, or noone on failure
	*/

	if argument2 return collision_rectangle(floor(x) - argument1, floor(y) - argument0, floor(x) + argument1, floor(y) + argument0, argument3, true, true); else
	return collision_rectangle(floor(x) - argument0, floor(y) - argument1, floor(x) + argument0, floor(y) + argument1, argument3, true, true);



}
