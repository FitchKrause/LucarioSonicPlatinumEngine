function player_reaction_switch(argument0, argument1) {
	// player_reaction_switch(local_id, code)

	// check collision code
	if (argument1 <> DIRECTION_BOTTOM) or (mask_rotation <> 0) { return false; }

	// trigger switch
	argument0.image_index = 1;

	// activate
	if (not argument0.activated)
	{
	    argument0.activated = true;
	    with (argument0.parent_id)
	    {
	        event_user(0);
	    }
	}

	// sound
	//if (image_index == 0) { audio_play_stereo(sndBeep, floor(x), floor(y), false, 0); }

	return false;



}
