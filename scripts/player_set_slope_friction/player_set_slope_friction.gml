/// @description  player_set_slope_friction(friction, threshold)
/// @param friction
/// @param threshold
function player_set_slope_friction()
{
	/*
	Applies slope friction to xspeed if appropriate.

	> friction: base friction value to use
	> threshold: slope friction must be stronger than this before being applied

	< return value: n/a
	*/

	// ignore if ...
	if not (floor_tag & 1) or floor_id.sticky { return false; } // not on terrain or it's sticky
	if ((sign(sine[relative_angle]) == sign(xspeed)) and ((relative_angle < 22.5) or (relative_angle > 337.5))) { return false; } // we're moving down a shallow slant

	// apply if stronger than threshold
	var slope_friction = (argument[0] * sine[relative_angle]) * global.tempo;
	if (abs(slope_friction) > argument[1]) { xspeed -= slope_friction * global.tempo; }
}