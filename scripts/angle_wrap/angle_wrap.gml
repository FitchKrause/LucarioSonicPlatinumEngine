/// @description  angle_wrap(angle)
/// @param angle
function angle_wrap()
{
	/*
	< return value: the given angle wrapped between 0 and 359 degrees.
	*/
	return (argument[0] mod 360) + (360 * (argument[0] < 0));
}