function player_reaction_enemy(argument0, argument1) {
	// player_reaction_enemy(local_id, code)

	// ignore if pathing
	if (path_index > -1) { return false; }

	// if not in an invulnerable or attacking state, or enemy is invulnerable
	if (not argument0.can_hit) or not (spinning or spindashing or invincibility or (state == player_is_gliding) or (state == player_is_glide_sliding))
	{
	    // take hit if not already hit
	    if immunity or (state == player_is_hurt) { return false; }
	    player_hit(sign(x - argument0.x), sndDeath);
	    return true;
	}

	// rebound in air
	if not (floor_tag)
	{
	    // if hit from below, weigh down slightly; if hit from above, bounce
	    if (argument1 == DIRECTION_TOP) or (yspeed < 0)
	    {
	        yspeed -= sign(yspeed);
	    }
	    else if (argument1 == DIRECTION_BOTTOM) and (yspeed > 0)
	    {
	        if (input & INPUT_ACTION)
	        {
	            yspeed = -yspeed;
	        }
	        else
	        {
	            yspeed = max(-jump_release, -yspeed);
	        }
	    }
	}

	// give score
	player_chain_multiplier(player_id, argument0.x, argument0.y);

	// sound
	audio_play_stereo(sndPop, argument0.x, argument0.y, false, 0);

	// destroy enemy
	with argument0 { instance_destroy(); }
	return true;



}
