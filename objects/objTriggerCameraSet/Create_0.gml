/// @description  Init

event_inherited();

reaction_script = player_reaction_camera_set;

// Set variables
left = -1; // Left
top = -1; // Top
right = -1; // Right
bottom = -1; // Bottom
follow = -1; // the camera follow the player
camera_mode = -1; // 0 = Death by bounds, 1 = Death by view

