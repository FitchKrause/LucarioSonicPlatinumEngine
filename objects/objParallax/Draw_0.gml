/// @description  Parallax

// Abort if nothing to render
if (sprite_index < 0) { exit; }

// Get coordinates, separation and boundaries
var fx = x + floor(camera_get_view_x(view_camera[view_current]) * relative_x) + absolute_x + xoffset;
var sx = width + separation_x;
var lx = fx;
var rx = fx;
if (tiled & 1)
{
	lx = camera_get_view_x(view_camera[view_current]) + ((fx - camera_get_view_x(view_camera[view_current])) mod sx) - sx;
	rx = camera_get_view_x(view_camera[view_current]) + camera_get_view_width(view_camera[view_current]) + sx;
}

var fy = y + floor(camera_get_view_y(view_camera[view_current]) * relative_y) + absolute_y + yoffset;
var sy = height + separation_y;
var ly = fy;
var ry = fy;
if (tiled & 2)
{
	ly = camera_get_view_y(view_camera[view_current]) + ((fy - camera_get_view_y(view_camera[view_current])) mod sy) - sy;
	ry = camera_get_view_y(view_camera[view_current]) + camera_get_view_height(view_camera[view_current]) + sy;
}

// Render it
gpu_set_blendenable(false);
for (var cy = ly; cy <= ry; cy += sy) { for (var cx = lx; cx <= rx; cx += sx) { draw_sprite_part_ext(sprite_index, image_index, left, top, width, height, cx, cy, image_xscale, image_yscale, c_white, 1); } }
gpu_set_blendenable(true);