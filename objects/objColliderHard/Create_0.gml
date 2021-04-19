/// @description  Initialize

event_inherited();

// collision data
zlayer = 3; // no collision happens on zlayer mismatch; it is a bitflag, so values like 7 (111) will cover multiple layers

// propeties
name = undefined; // for triggers
parent = noone; // like Source Engine, the "child" will follow the "parent"

// flags
flat_surface = true; // flat surfaces ignore angle detection and default to the mask's current rotation.
surface_angle = 0; // the correct angle is found externally using sensors; necessary for custom masks.
angle_sides = 0; // set specific angle side colliding if surface_angle is enabled.
top_only = false; // only the bottom half of the player's mask will collide, and only if the player's top half isn't also colliding
launch = false; // the player will ramp off this terrain when moving fast enough.
crush = false; // if the player's center is embedded inside this terrain, he will die.
can_push = false; // can be moved by pushing against it.
can_climb = false; // can be clung to and climbed by Knuckles.
sticky = false; // the terrain is sticky and slope friction is disables. also allows the player walk normaly in wall and celling
climb_direction = 0; // 1 = right; -1 = left; 0 = both. Decides what direction should Knuckles to climb correctly
push_speed = 1; // if can_push is enabled, define the speed of pushing.
can_collide = true; // colliding enabled or not.
skip_sensor = false; // sensor angle will skip if flag is enabled

// bounding box
true_left = bbox_left;
true_right = bbox_right;
true_top = bbox_top;
true_bottom = bbox_bottom;