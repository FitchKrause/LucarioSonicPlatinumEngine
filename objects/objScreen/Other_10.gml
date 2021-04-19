/// @description  Sync window properties

// Resolution limiter
if (objData.resolution > 5) { objData.resolution = 5; } else if (objData.resolution < 2) { objData.resolution = 2; }

// Resize game window
window_set_caption(PROYECTNAME + " | Version: " + string(VERSION));
window_set_size(width * objData.resolution, height * objData.resolution);
surface_resize(application_surface, width, height);
timer = 2;