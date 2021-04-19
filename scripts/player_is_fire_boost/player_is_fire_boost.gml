/// @description  player_is_fire_boost()
function player_is_fire_boost() {

	// animate
	animation_new = "spin";
	animation_speed = (1 / max(5 - abs(xspeed), 1));
	image_angle = 0;

	// states and flags
	state = player_is_falling;
	spinning = true;
	jumping = false;
	jump_action = false;

	// movement and collision
	xspeed = 12 * facing;
	yspeed = 0;

	// camera
	camera.timer = floor(24 - abs(xspeed));

	// set air state
	player_in_air();

	// shield animation
	if (shield)
	{
	    if (shield_type == SHIELD_FIRE)
	    {
	        with shield
	        {
	            with shield_backlayer { visible = false; }
	            animation_script = player_animation_shield_fire_action;
	            animation_speed = 1;
	            animation_running = true;
	            animation_reset = true;
	        }
	    }
	}

	// sound
	audio_play_emitter(audio_emitter, sndShieldFireAction, false, 0);



}
