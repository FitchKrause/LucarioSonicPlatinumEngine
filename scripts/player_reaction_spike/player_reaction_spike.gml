function player_reaction_spike(argument0, argument1) {
	// player_reaction_spike(local_id, code)

	// abort if immune or already hit
	if (immunity) or (invincibility) or (super_form) or (state == player_is_hurt) { return false; }

	// get angle relative to current rotation
	var rotation_offset = angle_wrap((floor(argument0.image_angle / 90) * 90) - mask_rotation);

	// check collision code
	if (argument1 == DIRECTION_RIGHT) and (rotation_offset <> 90) { return false; }
	if (argument1 == DIRECTION_LEFT) and (rotation_offset <> 270) { return false; }
	if (argument1 == DIRECTION_BOTTOM) and (rotation_offset <> 0) { return false; }
	if (argument1 == DIRECTION_TOP) and (rotation_offset <> 180) { return false; }

	// take hit
	player_hit(sign(x - argument0.x), sndDeathSpike, HARMFUL_NORMAL, argument0.vulnerable);

	// state changed
	return true;



}
