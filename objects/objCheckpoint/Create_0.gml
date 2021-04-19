/// @description  Initialize

event_inherited();

image_speed = 0;

reaction_script = player_reaction_checkpoint;
priority = -1;

// Animation system
animation_script = object_animation_checkpoint;
animation_tick = -1;
animation_speed = 1;
animation_running = false;
animation_reset = false;

