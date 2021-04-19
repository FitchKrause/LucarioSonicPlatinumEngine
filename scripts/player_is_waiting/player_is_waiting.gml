/// @description  player_is_waiting()
function player_is_waiting() {

	/* AUTHOR NOTE: This is a transitionary state until the zone has started.
	   Set objZone.started to true when you're ready to go! */
	if not (objZone.levelflags & LEVELFLAG_SPECIALSTAGE)
	{
	    animation_running = false;
	    if (objZone.started) 
	    {
	        animation_running = true;
	        player_is_standing(-1);
	    }
	}
	else if (objZone.levelflags & LEVELFLAG_SPECIALSTAGE)
	{ 
	    // animation
	    animation_new = "drown";
    
	    // speed
	    max_xspeed = 6;
	    limit_xspeed = true;
    
	    // camera
	    camera.floor_enabled = false;
	    camera.max_speed = 128;
    
	    // visible
	    player_actions(true, false);
    
	    if objZone.started
	    { 
	        // effect
	        part_particles_create(objGame.particles, objGame.spawn_id.x - (sprite_get_width(sprRingBigAnimation) / 2), objGame.spawn_id.y - (sprite_get_height(sprRingBigAnimation) / 2), objResources.part_bigring, 1);
    
	        // sound
	        audio_play_emitter(audio_emitter, sndWarp, false, 0);
    
	        // visible
	        player_actions(true, true);
        
	        // flags
	        toggleflags |= PLAYERSTATE_NOJUMPACTION|PLAYERSTATE_NOSPINDASH|PLAYERSTATE_NOSPINDASH|PLAYERSTATE_NOPEELOUT|PLAYERSTATE_NOROLLING|PLAYERSTATE_NOCROUCHING|PLAYERSTATE_NOLOOKING;
        
	        // state
	        player_is_falling(-1);
        
	        // start timer
	        objZone.timer_enabled = true;
	    }
	}



}
