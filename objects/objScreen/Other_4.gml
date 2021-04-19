/// @description  Setup views

// Toggle view
splitscreen_on = splitscreen;
view_enabled = true;
view_visible[0] = true;
view_visible[1] = splitscreen_on;
view_visible[2] = splitscreen_on;

// Reset
for (var i = 0; i < max_views - 1; i += 1)
{
	if (view_camera[i] <> -1) { camera_destroy(view_camera[i]); }
	view_camera[i] = camera_create();
	camera_set_view_size(view_camera[i], width * select(splitscreen_on, 1, 1.2), height * select(splitscreen_on, 1, 1.2));
}
camera_set_view_size(view_camera[2], width, height);