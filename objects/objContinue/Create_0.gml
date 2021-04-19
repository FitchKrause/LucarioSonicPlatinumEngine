/// Initialize

event_inherited();
image_speed = 1;

// Propeties
fade_alpha = 0;

// Music
music_stop_all();

// Positions
title_ox = (objScreen.gui_height / 2) - 140;
timer_ox = (objScreen.gui_height / 2) - 40;

// Offset
title_offset = objScreen.gui_height;
timer_offset = objScreen.gui_height;

// Start
state = -1;
timer = 0;
continue_timer = 600;