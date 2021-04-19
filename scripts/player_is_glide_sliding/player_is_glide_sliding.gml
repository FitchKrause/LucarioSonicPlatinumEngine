/// @description player_is_glide_sliding(state)
function player_is_glide_sliding(argument0) {
	switch argument0
	{
	case -1: // starting
	    // animate
	    animation_new = "glide_slide";

	    // states and flags
	    state = player_is_glide_sliding;
    
	    // movement and collision
	    xspeed = (xspeed * cosine[angle]) - (yspeed * sine[angle]);
	    break;

	default: // main
	    // friction
	    xspeed -= min(abs(xspeed), glide_slide_friction) * sign(xspeed);

	    // update position
	    if not player_move_floor() { return false; }

	    // falling
	    if not floor_tag or not (mask_rotation == gravity_angle()) { return player_is_glide_falling(-1); }

	    // slip off steep terrain
	    if (abs(xspeed) < slide_threshold) and (relative_angle >= 45) and (relative_angle <= 315)
	    {
	        if (xspeed <> 0) { return player_is_running(-1); } else { return player_is_standing(-1); }
	    }

	    // abort on movement or releasing down
	    if (input_released & INPUT_ACTION) or (xspeed == 0)
	    {
	        return player_is_glide_standing(-2);
	    }

	    // slope friction
	    if (abs(xspeed) > speed_cap) { player_set_slope_friction(slope_friction_cap, ground_friction); }
	    else { player_set_slope_friction(slope_friction, ground_friction); }
    
	    // sound
	    if (floor_tag & 1) and not (objScreen.image_index mod 4)
	    {
	        audio_stop_sound(sndGlideSlide);
	        audio_play_emitter(audio_emitter, sndGlideSlide, false, 0);
	    }
	}



}
