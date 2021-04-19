/// @description  Initialize

event_inherited();

image_speed = 0;

// Animation system
animation_script = -1;
animation_tick = -1;
animation_speed = 1;
animation_running = false;
animation_reset = false;

reaction_script = player_reaction_sign_post;

//passed = 0;
character_id = -1;
offset = 0;
move_player = true;

/// Create sparkle offsets
ox[0] = -24;
oy[0] = -16;

ox[1] = 8;
oy[1] = 8;

ox[2] = -16;
oy[2] = 0;

ox[3] = 24;
oy[3] = -8;

ox[4] = 0;
oy[4] = -8;

ox[5] = 16;
oy[5] = 0;

ox[6] = -24;
oy[6] = 8;

ox[7] = 24;
oy[7] = 16;

