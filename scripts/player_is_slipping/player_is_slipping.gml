/// @description  player_is_slipping()
function player_is_slipping()
{
	/*
	Evaluates if the calling player instance is standing on a slant too steep to climb.

	< return value: boolean; whether to abort the calling player instance's current state or not.
	*/

	// abort if ...
	if not (floor_tag & 1) or floor_id.sticky return false; // not on terrain or it's sticky
	if (abs(xspeed) >= slide_threshold) or (relative_angle < 45) or (relative_angle > 315) { return false; } // moving fast enough or angle is too shallow

	// fall if we're on a flat surface or angle is REALLY steep. Otherwise, slide down
	if floor_id.flat_surface or ((relative_angle >= 90) and (relative_angle <= 270)) { player_is_falling(-1); return true; }
	force_sliding = 32;
	return false;
}