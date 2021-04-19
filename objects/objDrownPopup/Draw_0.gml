/// @description  Render

if (frame_speed == 0)
{
    // lock to screen position
	var xx = floor((camera_get_view_x(view_camera[player_id.camera.camera_id]) + (camera_get_view_width(view_camera[player_id.camera.camera_id]) / 2)) - view_x);
	var yy = floor((camera_get_view_y(view_camera[player_id.camera.camera_id]) + (camera_get_view_height(view_camera[player_id.camera.camera_id]) / 2)) - view_y);
    draw_sprite_ext(sprite_index, image_index, floor(xx), floor(yy), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else
{
    draw_sprite_ext(sprite_index, image_index, floor(x), floor(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

