/// @description Pause and center window

if not paused and (screenshot > -1)
{
    sprite_delete(screenshot);
    screenshot = -1;
}

//if (window_get_width() <> (width * objData.resolution)) or (window_get_height() <> (height * objData.resolution)) { event_user(0); }
if timer
{
    timer -= 1;
    if not timer
	{
		display_reset(0, false);
		window_set_position((display_get_width() / 2) - (window_get_width() / 2), (display_get_height() / 2) - (window_get_height() / 2));
	}
}

