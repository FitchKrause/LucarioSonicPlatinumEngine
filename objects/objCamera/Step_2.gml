/// @description Initialize position

if not initialized
{
	initialized = true;
	var xpos = median(x - (camera_get_view_width(view_camera[camera_id]) / 2), left_bound, right_bound - camera_get_view_width(view_camera[camera_id]));
	var ypos = median(y - (camera_get_view_height(view_camera[camera_id]) / 2), top_bound, bottom_bound - camera_get_view_height(view_camera[camera_id]));
	camera_set_view_pos(view_camera[camera_id], xpos, ypos);
}