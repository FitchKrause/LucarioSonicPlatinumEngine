function player_is_flying(argument0) {
	// player_is_flying()
	switch argument0
	{
	case -1: // Starting
	    // Animate
	    if (underwater) { animation_new = "swim"; }
	    else { animation_new = "flight"; }
    
	    // Animation speed
	    animation_speed = 1;
    
	    // Angle
	    image_angle = gravity_angle();
    
	    // States and flags
	    state = player_is_flying;
	    spinning = false;
	    jumping = false;
	    jump_action = false;

	    // Set air state
	    player_in_air();
    
	    // Character values
	    timer = 480;
	    flight_force = 0.03125;
	    break;

	default: // Main
	    // Acceleration
	    // Left
	    if (input & INPUT_LEFT)
	    {
	        if (xspeed > -speed_cap) { xspeed -= air_acceleration; if (xspeed < -speed_cap) { xspeed = -speed_cap; } }
	        facing = -1;
	    }
    
	    // Right
	    if (input & INPUT_RIGHT)
	    {
	        if (xspeed < speed_cap) { xspeed += air_acceleration;  if (xspeed > speed_cap) { xspeed = speed_cap; } }
	        facing = 1;
	    }
    
	    // Movement
	    if not player_move_air()
	    {
	        if audio_is_playing(reserved_sound) { audio_stop_sound(reserved_sound); }
	        return false;
	    }

	    // Air friction
	    /*if ((yspeed < 0) and (yspeed > -jump_release))
	    {
	        xspeed *= air_friction;
	    }*/
    
	    // Gravity
	    if (yspeed < flight_threshold) { flight_force = 0.03125; }
	    yspeed += flight_force;
    
	    // Landing
	    if (floor_tag)
	    {
	        if (audio_is_playing(reserved_sound)) { audio_stop_sound(reserved_sound); }
	        return player_is_running(-1);
	    }
    
	    // Flight up height
	    if (input_pressed & INPUT_A) and not (toggleflags & PLAYERSTATE_NOJUMPACTION) { if (timer) { if (yspeed >= flight_threshold) { flight_force = -0.125; } } }
    
	    // Flight down height
	    if (input_pressed & INPUT_B) and not (toggleflags & PLAYERSTATE_NOJUMPACTION) { flight_force = 0.0625; }
    
	    // Cancel
	    if (input_pressed & INPUT_C) and not (toggleflags & PLAYERSTATE_NOJUMPACTION)
	    {
	        if (audio_is_playing(reserved_sound)) { audio_stop_sound(reserved_sound); }
	        return player_is_rolling(-1);
	    }
    
	    // Animate
	    if (not timer) { if (underwater) { animation_new = "swim_end"; } else { animation_new = "flight_end"; } }
    
	    // Animation speed
	    if (underwater) and (yspeed >= 0) { animation_speed = 0.5; } else { animation_speed = 1; }
    
	    // Sound
	    if (underwater) { if (audio_is_playing(reserved_sound)) { audio_stop_sound(reserved_sound); } }
	    else if (not timer)
	    {
	        if (not audio_is_playing(sndFlightEnd))
	        {
	            audio_stop_sound(reserved_sound);
	            reserved_sound = audio_play_emitter(audio_emitter, sndFlightEnd, true, 0);
	        }
	    }
	    else if (not audio_is_playing(sndFlight))
	    {
	        audio_stop_sound(reserved_sound);
	        reserved_sound = audio_play_emitter(audio_emitter, sndFlight, true, 0);
	    }
	}




}
