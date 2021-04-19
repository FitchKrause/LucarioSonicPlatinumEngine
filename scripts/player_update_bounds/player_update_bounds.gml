/// @description  player_update_bounds()
function player_update_bounds()
{
	/*
	Handles when the calling player instance's coordinates lie outside the camera boundary.

	< return value: boolean; whether to abort the calling player instance's current state or not.
	*/

	var bounds_left = camera_mode ? camera_get_view_x(view_camera[camera.camera_id]) : camera.left_bound;
	var bounds_right = camera_mode ? camera_get_view_x(view_camera[camera.camera_id]) + camera_get_view_width(view_camera[camera.camera_id]) : camera.right_bound;
	var bounds_top = camera_mode ? camera_get_view_y(view_camera[camera.camera_id]) : camera.top_bound;
	var bounds_bottom = camera_mode ? camera_get_view_y(view_camera[camera.camera_id]) + camera_get_view_height(view_camera[camera.camera_id]) : camera.bottom_bound;
	switch mask_rotation
	{
		case 0: // down
	    {
	        if (x < (bounds_left + offset_x)) { x = bounds_left + offset_x; if (xspeed < 0) { xspeed = 0; }}
	        if (x > (bounds_right - offset_x)) { x = bounds_right - offset_x; if (xspeed > 0) { xspeed = 0; }}
	        if (y < (bounds_top - (offset_y * 2))) { y = bounds_top - offset_y * 2;}
	        if (y > (bounds_bottom + offset_y)) { player_is_dead(-1); return false; }
	        break;
	    }
            
	    case 90: // right
	    {
	        if (y < (bounds_top + offset_x)) { y = bounds_top + offset_x; if (xspeed > 0) { xspeed = 0; }}
	        if (y > (bounds_bottom - offset_x)) { y = bounds_bottom - offset_x; if (xspeed < 0) { xspeed = 0; }}
	        if (x > (bounds_right + offset_y)) { player_is_dead(-1); return false; }
	        break;
	    }
            
	    case 180: // up
	    {
	        if (x < (bounds_left + offset_x)) { x = bounds_left + offset_x; if (xspeed < 0) { xspeed = 0; }}
	        if (x > (bounds_right - offset_x)) { x = bounds_right - offset_x; if (xspeed > 0) { xspeed = 0; }}
	        if (y < (bounds_top - offset_y)) { player_is_dead(-1); return false; }
	        break;
	    }
            
	    case 270: // left
	    {
	        if (y < (bounds_top + offset_x)) { y = bounds_top + offset_x; if (xspeed < 0) { xspeed = 0; }}
	        if (y > (bounds_bottom - offset_x)) { y = bounds_bottom - offset_x; if (xspeed > 0) { xspeed = 0; }}
	        if (x < (bounds_left - offset_y)) { player_is_dead(-1); return false; }
	        break;
	    }
	}
	return true;
}