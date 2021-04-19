/// @description string_real_roundto(value,roundedto)
/// @param value
/// @param roundedto
///Returns argument0 rounded to the nearest (argument1)
///eg 21852 rounded to nearest 100 returns 21900
///Created by Andrew McCluskey, use it freely
function string_real_roundto(argument0, argument1) {

	var rtn;

	rtn = argument0 / argument1;
	rtn = round(rtn);
	rtn *= argument1;

	return rtn;



}
