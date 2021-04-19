/// @description  Init

event_inherited();

image_speed = 0;
depth = -1;
shield_backlayer = instance_create_depth(x, y, -depth, objSceneObject);
with shield_backlayer { visible = true; image_speed = 0; };

animation_script = player_animation_shield_fire;
animation_speed = 1;
animation_running = true;

