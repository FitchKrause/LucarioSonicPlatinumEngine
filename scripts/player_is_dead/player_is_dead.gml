/// @description  player_is_dead(step, [sound])
/// @param step
/// @param  [sound]
function player_is_dead() {
	switch argument[0]
	{
	case -2: // starting (drowning)
	    // animate
	    animation_new = "drown";
	    animation_speed = 1;
	    image_angle = gravity_angle();
	    player_trasformation(true);

	    // states and flags
	    state = player_is_dead;
	    spinning = false;
	    underwater = false;
	    floating = false;
	    outspace = false;

	    // movement and collision
	    yspeed = 0;
	    angle = gravity_angle();

	    // tempo
	    if not objData.player_cpu[player_id] { global.tempo = 0; }
    
	    // counters and timers
	    force_sliding = 0;
	    air_count = -1;
	    superspeed = 0;
	    invincible = 0;
	    super_form = false;

	    // physics values (force underwater gravity)
	    player_reset_physics();
	    gravity_force = 0.0625;

	    // camera
	    camera.vertical_lock = true;
	    camera.follow = false;

	    // destroy effects
	    with drown_count { instance_destroy(); }
	    with shield { instance_destroy(); }
	    with invincibility { instance_destroy(); }
    
	    // set noone effects
	    drown_count = noone;
	    shield = noone;
	    invincibility = noone;
	    shield_type = SHIELD_NONE;

	    // sound
	    audio_play_emitter(audio_emitter, sndDrown, false, 0);

	    // other
	    dead_timer = 102;
	    if (path_index > -1) { path_end(); }
	    break;

	case -1: // starting (normal)
	    // animate
	    animation_new = "dead";
	    animation_speed = 1;
	    image_angle = gravity_angle();
	    player_trasformation(true);

	    // states and flags
	    state = player_is_dead;
	    spinning = false;
	    underwater = false;
	    floating = false;
	    outspace = false;

	    // movement and collision
	    yspeed = -7;
	    angle = gravity_angle();

	    // tempo
	    if (not objData.player_cpu[player_id]) { global.tempo = 0; }
	    //else { audio_play_emitter(audio_emitter, sndDeath, false, 0); return player_is_hurt(-1, facing); }
    
	    // counters and timers
	    sliding = 0;
	    air_count = -1;
	    superspeed = 0;
	    invincible = 0;
	    super_form = false;

	    // physics values
	    player_reset_physics();

	    // camera
	    camera.vertical_lock = true;
	    camera.follow = false;

	    // destroy effects
	    with drown_count { instance_destroy(); }
	    with shield { instance_destroy(); }
	    with invincibility { instance_destroy(); }
    
	    // set noone effects
	    drown_count = noone;
	    shield = noone;
	    invincibility = noone;
	    shield_type = SHIELD_NONE;
    
	    // sound
	    if (argument_count > 1) { audio_play_emitter(audio_emitter, argument[1], false, 0); }
	    else { audio_play_emitter(audio_emitter, sndDeath, false, 0); }

	    // other
	    dead_timer = 102;
    
	    if (path_index > -1) { path_end(); }
	    break;

	default: // main
	    // finish when ready
	    if not dead_timer { return player_reset(); }

	    // update position
	    y += cosine[angle] * yspeed;

	    // gravity
	    yspeed += gravity_force;
	}



}
