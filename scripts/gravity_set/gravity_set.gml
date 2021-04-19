/// @description  gravity_set(angle)
/// @param angle
function gravity_set(argument0) {
	/*
	Sets the gravity direction for all instances in a room.

	> angle: angle to set

	< return value: n/a
	*/

	argument0 = angle_wrap(argument0);
	with all gravity_direction = argument0;



}
