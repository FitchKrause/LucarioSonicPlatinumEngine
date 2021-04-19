/// @description  Clean up

if (screenshot > -1)
{
    sprite_delete(screenshot);
    screenshot = -1;
}

if surface_exists(view[0]) { surface_free(view[0]); }
if surface_exists(view[1]) { surface_free(view[1]); }