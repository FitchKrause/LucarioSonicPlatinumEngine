/// @description  Initialize Player
image_speed = 0;
depth = 0;

event_inherited();

// Identification
player_id = instance_number(objPlayer) - 1;
character_id = -1;
input_id = player_id;

// Camera
camera = instance_create_depth(floor(x), floor(y), 0, objCamera);
camera.vertical_lock = false;
camera_mode = 0;
camera_follow = true;

// States
state = player_is_waiting;
stateflags = 0;
toggleflags = 0;
spinning = false;
jumping = false;
jump_action = false;
dropdash_action = false;
spindashing = false;
peelouting = false;
dropdasing = false;
underwater = false;
outspace = false;
floating = false;
super_form = false;
vulnerability = false;
multiability = false;
reverse_control = false;

// Input
input = 0;
input_pressed = 0;
input_released = 0;
input_lock = false;
input_lock2 = false;

// Movement and collision
//local_list = ds_list_create();
local_list = 0;
zlayer = 1;
facing = 1;
wall_facing = 0;
cliff_facing = 0;
xspeed = 0;
yspeed = 0;

// Camera panning
camera_pan_up = -100;
camera_pan_down = 100;
camera_pan_left = -140;
camera_pan_right = 140;

// Timers
timer = 0;
dead_timer = 0;
force_sliding = 0;
air_count = -1;
immunity = 0;
ignore_rings = 0;
superspeed = 0;
invincible = 0;
uncurl = 0;
ring_drain = 0;
chain_multiplier = 0;

// Effects
drown_count = noone;
invincibility = noone;
tails_effect = noone;
smoke = noone;

// Shield
shield = noone;
shield_type = SHIELD_NONE;

// System flags
offscreen_enabled = true;
max_xspeed = 48;
max_yspeed = 48;
limit_xspeed = false;
limit_yspeed = false;

// Bounding box
offset_size = 1;
offset_x = 8 * offset_size;
offset_y = 14 * offset_size;
offset_wall = 10 * offset_size;
segment_width = offset_x * 0.5;
segment_height = offset_y * 0.5;

// Collisions
angle = gravity_angle();
relative_angle = 0;
mask_rotation = angle;
floor_id = noone;
floor_tag = 0;
cliff_facing = 0;

// Physics constants
base_speed_cap = 6;
ceiling_threshold = -4;
slide_threshold = 2.5;
waterrun_threshold = 4;
roll_threshold = 1.03125;
unroll_threshold = 0.5;
brake_threshold = 4;
slope_friction = 0.078125;
slope_friction_cap = 0.125;
slope_friction_up = 0.071825;
slope_friction_down = 0.3125;
spindash_friction = 0.96875;

// Spindash constants
spindash_charge = 0;
spindash_charge_max = 8;
spindash_pitch = 1;

// Super Peel Out
peelout_charge = 0;
peelout_charge_max = 24;

// Dropdash (Sonic only)
dropdash_charge = 0;
dropdash_charge_max = 20;

// Tails flight
flight_force = 0.03125;
flight_threshold = -1;

// Knuckles glide and climb
glide_speed = 0;
glide_speed_cap = 12;
glide_acceleration = 0.0546875;
glide_angle = 0;
glide_direction = 1;
glide_force = 0.5;
glide_falling = false;
glide_slide_friction = 0.125;
climb_speed = 1;

// Palette
palette_enabled = false;
palette_surface = -1;
palette_sprite = -1;
palette_index = 0;

// Animated palette
palette_anim_script = -1;
palette_anim_tick = 0;
palette_anim_speed = 0;
palette_anim_running = false;

// Stored colours
pallete_color = undefined;
//pallete_color_index = 0;
// pallete_color[0 .. N, 0 .. N]
// entry 0: index
// entry 1: stored colour and position { "RED | GREEN | BLUE | POSITION" }

// Animation system
animation_table = -1; // ds_map for all animations, see objResources
animation_current = ""; // Actual animation
animation_previous = ""; // Previous animation before change
animation_new = "idle"; // New animation to change
animation_script = -1; // Script animation execute
animation_tick = 0; // Step value of animation script (float values are rounded down)
animation_speed = 1; // Speed for increasing tick (allows float values)
animation_running = false; // Flag if animation should execute
animation_reset = false; // Flag if animation should reset
animation_locked = false; // Flag if animation shouldn't change by animation_new

// Initialize values
player_change_character(objData.player_character_id[player_id]);
player_reset_physics();

// Position table
table_size = 8;
xtable = ds_list_create();
ytable = ds_list_create();
for (i = 0; i < (table_size - 1); i += 1) { ds_list_add(xtable, floor(x)); ds_list_add(ytable, floor(y)); }

// Audio emitter
reserved_sound = -1;
audio_emitter = audio_emitter_create();
audio_emitter_position(audio_emitter, floor(x), floor(y), 0);
audio_emitter_gain(audio_emitter, objData.volume_sfx);

// Debug mode
debug_angle_x1 = x;
debug_angle_y1 = y;
debug_angle_x2 = x;
debug_angle_y2 = y;

debug_pos = 0;
debug_type = 0;
debug_object = noone;
debug_list = ds_list_create();
ds_list_add(debug_list, objRing);
ds_list_add(debug_list, objMonitor);
ds_list_add(debug_list, objSpike);
ds_list_add(debug_list, objSpikeSonic1);
ds_list_add(debug_list, objCheckpoint);
ds_list_add(debug_list, objSignPost);
ds_list_add(debug_list, objCapsule);
ds_list_add(debug_list, objEmeraldHillCorkscrew);
ds_list_add(debug_list, objCasinoNightBumper);
ds_list_add(debug_list, objCasinoNightFlipper);
ds_list_add(debug_list, objGreenHillCollapse);
ds_list_add(debug_list, objMarblePushable);
ds_list_add(debug_list, objMarbleBreakable);
ds_list_add(debug_list, objSpringWhite);
ds_list_add(debug_list, objSpringWhiteDiagonal);
ds_list_add(debug_list, objSpringPurple);
ds_list_add(debug_list, objSpringPurpleDiagonal);
ds_list_add(debug_list, objSpringRed);
ds_list_add(debug_list, objSpringRedDiagonal);
ds_list_add(debug_list, objSpringOrange);
ds_list_add(debug_list, objSpringOrangeDiagonal);
ds_list_add(debug_list, objSpringYellow);
ds_list_add(debug_list, objSpringYellowDiagonal);
ds_list_add(debug_list, objSpringGreen);
ds_list_add(debug_list, objSpringGreenDiagonal);
ds_list_add(debug_list, objSpringBlue);
ds_list_add(debug_list, objSpringBlueDiagonal);
ds_list_add(debug_list, objBalloonBlue);