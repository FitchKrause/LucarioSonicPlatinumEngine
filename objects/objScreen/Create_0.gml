/// @description Screen settings

image_speed = 0;
timer = -1;

// Display
max_views = 3;
width = 424; //320;
height = 240; //224;
gui_width = width * 2;
gui_height = height * 2;
reset_display = false;
reset_display_tick = 0;
offset = 0;

// Rendering
/*
rendering_game_id = surface_create(width, height);
rendering_gui_id = surface_create(gui_width, gui_height);
*/
// Paused
paused = false;
screenshot = -1;

// Spliscreen
splitscreen = false;
splitscreen_on = false;
view[0] = surface_create(width, height);
view[1] = surface_create(width, height);

// Vsync
event_user(0);