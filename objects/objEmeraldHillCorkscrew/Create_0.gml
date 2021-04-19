/// @description Initialize

// Parent
event_inherited();
image_speed = 0;

// Script
reaction_script = player_reaction_corkscrew;
threshold = 5;
last_collision = 0;
collision = 0;
depth = 10;

// Create covering
with instance_create_depth(x, y, -depth, objZoneObject)
{
    sprite_index = other.sprite_index;
    image_index = 1;
    image_speed = 0;
    visible = true;
}