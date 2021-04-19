/// @description  Update camera position

try
{
	if tick { tick -= 1 * global.tempo; }
	if (tick <> 0) { exit; } // ignore if...
	
	// get camera position
	var splitscreen_vmod = (((objScreen.height / 2) / 2) * objScreen.splitscreen_on);
	origin_x = floor(x + (offset_x * sine[gravity_direction]) + (offset_x * cosine[gravity_direction]));
	origin_y = floor(y - (offset_y * cosine[gravity_direction]) - (offset_y * sine[gravity_direction]));

	// define view sides
	top_view = camera_get_view_y(view_camera[camera_id]);
	left_view = camera_get_view_x(view_camera[camera_id]);
	right_view = camera_get_view_x(view_camera[camera_id]) + camera_get_view_width(view_camera[camera_id]);
	bottom_view = camera_get_view_y(view_camera[camera_id]) + camera_get_view_height(view_camera[camera_id]);

	// define center offset
	origin_x -= (camera_get_view_x(view_camera[camera_id]) + (camera_get_view_width(view_camera[camera_id]) * 0.5));
	origin_y -= (camera_get_view_y(view_camera[camera_id]) + (camera_get_view_height(view_camera[camera_id]) * 0.5));

	// define borders
	if not horizontal_lock { if (abs(origin_x) > border_x) { origin_x -= (border_x * sign(origin_x)); } else { origin_x = 0; } } else { if not locked_horizontal { origin_x *= 0.25; } } // x border
	if not vertical_lock { if (abs(origin_y) > border_y) { origin_y -= (border_y * sign(origin_y)); } else { origin_y = 0; } } else { if not locked_vertical { origin_y *= 0.25; } } // y border

	// limit speed
	var view_yspeed = min(max_speed + abs(y - yprevious), max_speed);
	if (abs(origin_x) > max_speed) { origin_x = max_speed * sign(origin_x); }
	if (abs(origin_y) > view_yspeed) { origin_y = view_yspeed * sign(origin_y); }
	if not locked_x // horizontal movement
	{
	    if (panning_hspeed > 0)
	    {
	        // move automatically
			if (camera_get_view_x(view_camera[camera_id]) < left_bound) { camera_set_view_pos(view_camera[camera_id], min(camera_get_view_x(view_camera[camera_id]) + (panning_hspeed * global.tempo), left_bound), camera_get_view_y(view_camera[camera_id])); }
			else if ((camera_get_view_x(view_camera[camera_id]) + camera_get_view_width(view_camera[camera_id])) > right_bound) { camera_set_view_pos(view_camera[camera_id], max(camera_get_view_x(view_camera[camera_id]) - (panning_hspeed * global.tempo), right_bound - camera_get_view_width(view_camera[camera_id])), camera_get_view_y(view_camera[camera_id])); }
	        else { panning_hspeed = 0; }
	    }
	    else
	    {
	        // focus on player
			if (origin_x < 0) and (camera_get_view_x(view_camera[camera_id]) >= left_bound) { camera_set_view_pos(view_camera[camera_id], floor(max(camera_get_view_x(view_camera[camera_id]) + (origin_x * global.tempo), left_bound)), camera_get_view_y(view_camera[camera_id])); }
			if (origin_x > 0) and ((camera_get_view_x(view_camera[camera_id]) + camera_get_view_width(view_camera[camera_id])) <= right_bound) { camera_set_view_pos(view_camera[camera_id], floor(min(camera_get_view_x(view_camera[camera_id]) + (origin_x * global.tempo), right_bound - camera_get_view_width(view_camera[camera_id]))), camera_get_view_y(view_camera[camera_id])); }
	    }
	}
	
	if not locked_y // vertical movement
	{ 
	    if (panning_vspeed > 0)
	    {
	        // move automatically
			if (camera_get_view_y(view_camera[camera_id]) < top_bound) { camera_set_view_pos(view_camera[camera_id], camera_get_view_x(view_camera[camera_id]), min(camera_get_view_y(view_camera[camera_id]) + (panning_vspeed * global.tempo), right_bound)); }
			else if ((camera_get_view_y(view_camera[camera_id]) + camera_get_view_height(view_camera[camera_id])) < bottom_bound) { camera_set_view_pos(view_camera[camera_id], camera_get_view_x(view_camera[camera_id]), max(camera_get_view_y(view_camera[camera_id]) - (panning_vspeed * global.tempo), bottom_bound - camera_get_view_height(view_camera[camera_id]))); }
	        else { panning_vspeed = 0; }
	    }
	    else
	    {
	        // focus on player
			if (origin_y < 0) and (camera_get_view_y(view_camera[camera_id]) >= (top_bound - splitscreen_vmod)) { camera_set_view_pos(view_camera[camera_id], camera_get_view_x(view_camera[camera_id]), floor(max(camera_get_view_y(view_camera[camera_id]) + (origin_y * global.tempo), top_bound - splitscreen_vmod))); }
			if (origin_y > 0) and ((camera_get_view_y(view_camera[camera_id]) + camera_get_view_height(view_camera[camera_id])) <= (bottom_bound + splitscreen_vmod)) { camera_set_view_pos(view_camera[camera_id], camera_get_view_x(view_camera[camera_id]), floor(min(camera_get_view_y(view_camera[camera_id]) + (origin_y * global.tempo), (bottom_bound - camera_get_view_height(view_camera[camera_id])) + splitscreen_vmod))); }
	    }
	}

	// force camera to enter bounds
	if not locked_y { if (top_view < (top_bound - splitscreen_vmod)) { camera_set_view_pos(view_camera[camera_id], camera_get_view_x(view_camera[camera_id]), camera_get_view_y(view_camera[camera_id]) + (floor(1 * global.tempo))); } } // top_bound
	if not locked_x { if (left_view < left_bound) { camera_set_view_pos(view_camera[camera_id], camera_get_view_x(view_camera[camera_id]) + (floor(1 * global.tempo)), camera_get_view_y(view_camera[camera_id])); } } // left_bound
	if not locked_x { if (right_view > right_bound) { camera_set_view_pos(view_camera[camera_id], camera_get_view_x(view_camera[camera_id]) - (floor(1 * global.tempo)), camera_get_view_y(view_camera[camera_id])); } } // right_bound
	if not locked_y { if (bottom_view > (bottom_bound + splitscreen_vmod)) { camera_set_view_pos(view_camera[camera_id], camera_get_view_x(view_camera[camera_id]), camera_get_view_y(view_camera[camera_id]) - (floor(1 * global.tempo))); } } // bottom_bound
}
catch(error) { engine_error(error); }