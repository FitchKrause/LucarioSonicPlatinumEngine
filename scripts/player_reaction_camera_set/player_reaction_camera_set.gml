function player_reaction_camera_set(argument0) {
	// player_reaction_camera_set(local_id)

	// abort if not near camera center
	if (x < argument0).x return false;

	// consume trigger and obtain camera bounds
	camera_set_values(argument0.left, argument0.top, argument0.right, argument0.bottom, argument0.follow, argument0.camera_mode);
	return false;



}
