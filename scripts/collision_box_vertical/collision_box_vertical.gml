/// @description  collision_box_vertical(ox, oy, rotation, index)
/// @param ox
/// @param  oy
/// @param  rotation
/// @param  index
function collision_box_vertical(argument0, argument1, argument2, argument3) {
	/*
	Evaluates collision between the given object or instance and a rectangle of size {ox * 2, oy}.
	The rectangle rotates with the top edge centered against the calling instance's center point.

	> ox: the half-width of the rectangle
	> oy: the height of the rectangle
	> rotation: angle to rotate the rectangle; snapped to 90 degrees before usage
	> index: object or instance index to evaluate

	< return value: first matching instance id colliding with the rectangle, or noone on failure
	*/

	var rotation = round(argument2 / 90) * 90;
	var x1 = floor(x) - (cosine[rotation] * argument0);
	var y1 = floor(y) + (sine[rotation] * argument0);
	var x2 = floor(x) + (cosine[rotation] * argument0) + (sine[rotation] * argument1);
	var y2 = floor(y) - (sine[rotation] * argument0) + (cosine[rotation] * argument1);
	return collision_rectangle(x1, y1, x2, y2, argument3, true, true);



}
