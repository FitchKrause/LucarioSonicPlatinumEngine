/// @description  Init

event_inherited();

image_speed = 0;
image_index = 1;

reaction_script = player_reaction_spring;

force = 10;
animation = true;
skip_sensor = true;
last_collision = 0;
collision = 0;

// Animation system
animation_script = object_animation_spring;
animation_tick = 0;
animation_speed = 1;
animation_running = false;
animation_reset = false;

