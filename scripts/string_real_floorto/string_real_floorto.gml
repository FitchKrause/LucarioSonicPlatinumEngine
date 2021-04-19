/// @description  string_real_floorto(value, flooredto)
/// @param value
/// @param  flooredto
function string_real_floorto(argument0, argument1) {
	// Returns argument0 rounded to the nearest (argument1)
	// eg 21852 rounded to nearest 100 returns 21900
	// Created by Andrew McCluskey, use it freely

	return floor(argument0 / argument1) * argument1;



}
