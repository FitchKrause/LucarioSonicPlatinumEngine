function player_is_reset(argument0) {
	// player_is_reset()
	switch argument0
	{
	case -1: // starting
	    // reset position
	    x = objGame.spawn_id.x;
	    y = objGame.spawn_id.y + 1;

	    // animation
	    animation_new = "idle";
	    facing = 1;

	    // states and flags
	    state = player_is_reset;
	    flags = 0;
	    spinning = false;
	    jumping = false;
	    jump_action = false;
	    spindashing = false;
	    peelouting = false;

	    // movement and collision
	    xspeed = 0;
	    yspeed = 0;

	    // set air state
	    player_in_air();

	    // character values
	    if (character_id == CHARACTER_KNUCKLES) glide_falling = false; 

	    // camera
	    camera.vertical_lock = true;
	    camera.follow = true;

	    // other
	    depth = 0;
	    break;

	default: // main
	    // continue when camera catches up
	    if (in_view(view_camera[camera.camera_id], 0)) { state = player_is_falling; }
	}
}