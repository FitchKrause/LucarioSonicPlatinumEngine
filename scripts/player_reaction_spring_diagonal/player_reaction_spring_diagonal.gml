function player_reaction_spring_diagonal(argument0) {
	// player_reaction_spring_diagonal(local_id)

	// abort if pathing
	if (path_index > -1) return false;

	// trigger spring
	argument0.collision |= (player_id + 1);
	if (argument0.last_collision & argument0.collision) return false; // ignore if already triggered

	// states and flags
	state = player_is_falling;
	spinning = false;
	jump_action = false;
	jumping = false;

	// movement and collision
	var spring_direction = angle_wrap(45 + floor(argument0.image_angle));
	xspeed = -sine[spring_direction] * argument0.force;
	yspeed = -cosine[spring_direction] * argument0.force;
	facing = sign(xspeed);

	// set air state
	player_in_air();
	draw_angle = spring_direction;

	// bubble shield
	    if (shield) and (shield_type == SHIELD_BUBBLE) { with shield { if (action) { action = false; } } }

	// character values
	if (character_id == CHARACTER_KNUCKLES) { glide_falling = false; }
	if (character_id == CHARACTER_SONIC) { dropdasing = false; }

	// animate player
	if argument0.animation
	{
	    animation_new = "flip";
	    animation_tick = 0;
	}
	else
	{
	    animation_new = "rise";
	}

	animation_speed = 1;
	image_angle = gravity_angle();

	// animate spring
	argument0.animation_running = true;

	// sound
	audio_play_stereo(sndSpring, argument0.x, argument0.y, false, 0);
	return true;



}
