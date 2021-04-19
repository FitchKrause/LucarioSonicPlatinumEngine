/// @description  Init

event_inherited();

image_speed = 0;

state = 0;

// Create switch
button = instance_create_depth(x, y - 52, 17, objSwitch);
button.sprite_index = sprCapsuleSwitch;
button.visible = true;
button.parent_id = id;

// Animation system
animation_script = -1;
animation_tick = -1;
animation_speed = 1;
animation_running = false;
animation_reset = false;