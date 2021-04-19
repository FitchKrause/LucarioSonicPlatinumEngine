/// @description  Initialize
image_speed = 0;

// State
started = false; // player cannot move until the zone has started
finished = false; // when the zone has ended, this is set so that all values are reset properly
is_paused = false;
no_pause = false; // 

// Timing
timer = 36000;
timer_enabled = false;
time_over = false;
reseting = -1; // set to non-0 to reset the zone

// Music
music = noone;
looppoint = 0;
pitch = 1;

// Properties
name = "";
act = 1;
total_rings = instance_number(objRing);
levelflags = 0; // see engine_enumerators()
levelstyle = STYLETYPE_ENGINE;

// Custom script
script_start = noone; // Executed when the zone starts
script_end = noone; // Executed when the zone ends

// Animals
animal[0] = objBlueSmallBird;
animal[1] = objSmallPenguin;
animal[2] = objBlueSmallBird;
animal[3] = objSmallPenguin;

