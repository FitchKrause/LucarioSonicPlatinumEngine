/// @description  gravity_angle()
function gravity_angle() {
	/*
	< return value: gravity direction rotated to standard unit circle projection. (ie. where 0 degrees is down)
	*/
	return angle_wrap(gravity_direction + 90);



}
