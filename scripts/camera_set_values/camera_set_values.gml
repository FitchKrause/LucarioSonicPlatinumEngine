/// @description  camera_set_values(left, top, right, bottom, follow, camera_mode)
/// @param left
/// @param  top
/// @param  right
/// @param  bottom
/// @param  follow
/// @param  camera_mode
function camera_set_values()
{
	// Set variables
	var left = -1; // Left
	var top = -1; // Top
	var right = -1; // Right
	var bottom = -1; // Bottom
	var follow = -1; // the camera follow the player
	var camera_mode = -1; // 0 = Death by bounds, 1 = Death by view

	// Arguments
	left = argument[0]; // Left
	if (argument_count > 1) { top = argument[1]; } // Top
	if (argument_count > 2) { right = argument[2]; } // Right
	if (argument_count > 3) { bottom = argument[3]; } // Bottom
	if (argument_count > 4) { follow = argument[4]; } // the camera follow the player
	if (argument_count > 5) { camera_mode = argument[5]; } // 0 = Death by bounds, 1 = Death by view
	
	if (left > -1) { camera.left = max(left, 0); }
	if (top > -1) { camera.top = max(top, 0); }
	if (right > -1) { camera.right = min(right, room_width - 1); }
	if (bottom > -1) { camera.bottom = min(bottom, room_height - 1); }
	if (follow > -1) { camera.follow = follow; }
	if (camera_mode > -1) { camera.camera_mode = camera_mode; }
}