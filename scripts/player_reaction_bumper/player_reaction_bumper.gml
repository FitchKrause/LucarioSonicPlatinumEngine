function player_reaction_bumper(argument0) {
	// player_reaction_bumper(local_id)

	// ignore if pathing
	if (path_index > -1) return false;

	// trigger bumper and gain points
	argument0.timer = 16;
	if (argument0.counter[player_id] < 10)
	{
	    player_get_score(100, player_id);
	    argument0.counter[player_id] += 1;
	    instance_create_depth(argument0.x, argument0.y, depth, objScorePopup);
	}

	// get bounce direction
	var bounce_direction = angle_wrap(point_direction(floor(argument0.x), floor(argument0.y), floor(x), floor(y)) - gravity_angle());

	// update player
	if (state == player_is_hurt) { player_is_falling(-1); }
	xspeed = cosine[bounce_direction] * 7;
	yspeed = -sine[bounce_direction] * 7;
	if (character_id == CHARACTER_KNUCKLES) { glide_falling = false; }
	if (character_id == CHARACTER_SONIC) { dropdasing = false; }

	// move outside collision
	while collision_box(offset_x, offset_y, (mask_rotation mod 180), argument0)
	{
	    x += sign(xspeed);
	    y += sign(yspeed);
	}

	// sound
	audio_play_stereo(sndBumper, argument0.x, argument0.y, false, 0);
	return true;



}
