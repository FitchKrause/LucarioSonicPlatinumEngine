/// @description  distance_to_angle(start, destination)
/// @param start
/// @param  destination
function distance_to_angle()
{
	/*
	Calculates the signed angular difference between the two given angles.

	> start: starting angle
	> destination: ending angle

	< return value: signed integer between -180 and 179. (inclusive)
	*/
	return ((((argument[1] - argument[0]) mod 360) + 540) mod 360) - 180;
}