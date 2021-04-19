/// @description  camera_set_position(x, y, [no_transition])
/// @param x
/// @param y
/// @param [no_transition]
function camera_set_position()
{
	var no_transition = false;
	if (argument_count > 2) { no_transition = argument[2]; }

	camera.x = argument[0];
	camera.y = argument[1];
	if no_transition
	{
	    camera.oy = 0;
		camera.ox = 0;
		camera_set_view_pos(view_camera[camera.camera_id], max(min(argument[0] - (camera_get_view_width(view_camera[camera.camera_id]) / 2), camera.right - camera_get_view_width(view_camera[camera.camera_id])), camera.left), max(min(argument[1] - (camera_get_view_height(view_camera[camera.camera_id]) / 2), camera.bottom - camera_get_view_height(view_camera[camera.camera_id])), camera.top));
	}
}