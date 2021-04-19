/// @description  Initialize

image_speed = 0;
event_inherited();

reaction_script = player_reaction_flipper;
player_id = noone;

// Animation system
animation_script = object_animation_flipper;
animation_tick = 0;
animation_speed = 1;
animation_running = false;
animation_reset = false;

