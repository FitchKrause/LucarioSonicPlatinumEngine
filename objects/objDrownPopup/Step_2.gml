/// @description  Animate

// Frame speed
if not (image_index >= 3)
{
    image_index += (frame_speed * global.tempo);
}

// flicker when ready
visible = 1 - ((timer[1] div 8) mod 2);

/// View Movement

if (frame_speed > 0)
{
    if (image_index >= 3) // if we've grown enough
    {
        // setup sprite
        sprite_index = sprDrownPopup;
        image_index = (player_id.air_count div 120);
        frame_speed = 0;

        // stop moving
        xspeed = 0;
        yspeed = 0;
        
        // get screen offset
		view_x = floor(floor(camera_get_view_x(view_camera[player_id.camera.camera_id]) + (camera_get_view_width(view_camera[player_id.camera.camera_id]) / 2)) - x);
		view_y = floor(floor(camera_get_view_y(view_camera[player_id.camera.camera_id]) + (camera_get_view_height(view_camera[player_id.camera.camera_id]) / 2)) - y);
		
        // set alarm
        timer[0] = 12;
    }
}