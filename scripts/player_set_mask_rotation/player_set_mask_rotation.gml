/// @description  player_set_mask_rotation()
function player_set_mask_rotation()
{
	/*
	Evaluates if the calling player instance's mask should be rotated.

	< return value: boolean; whether the mask was successfully rotated or not.
	*/

	// abort if there's no possibility of collision
	if not collision_box(offset_x, offset_y * 2, ((mask_rotation + 90) mod 180), floor_id) { return -1; }

	// calculate offsets and get angle from new mask rotation
	var distance = distance_to_angle(mask_rotation, angle); // rotational offset between angle and mask rotation
	var new_rotation = angle_wrap(mask_rotation + 90 * sign(distance)); // new mask rotation
	var new_angle = new_rotation;
	if (floor_id.surface_angle & ANGLEFLAG_COLLISION) { var new_angle = player_get_surface_angle(floor_id.sticky ? (offset_y * 2) : offset_y, new_rotation); }
	if (new_angle < 0) { return false; }

	// calculate new offset, abort if we're rotating the wrong way or offsets are too steep or shallow
	var new_distance = distance_to_angle(mask_rotation, new_angle);
	if ((sign(distance) <> sign(new_distance))) { return false; }
	if ((abs(distance) < 45) or (abs(new_distance) < 45) or (abs(new_distance) >= 90)) { return false; }

	// confirm rotation
	mask_rotation = new_rotation;
	player_set_floor(floor_id, false);
	floor_tag |= 1;
	return true;
}