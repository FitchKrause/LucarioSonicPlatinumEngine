/// @description  Initialize
image_speed = 0;
image_index = objZone.time_over;
objZone.time_over = false;
fade_alpha = 0;
forced = false;

// music
music_play_single(bgmGameOver);
objMusic.flags |= MUSFLAG_NOCHANGE;

// start alarm
timer = -1;
timer_normal = 660;
offset = (256 + objScreen.gui_width * 0.5) * 0.0625;

