/// @description  player_is_bubble_jump()
function player_is_bubble_jump() {

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
	xspeed = 0;
	yspeed = 8;

	// set air state
	player_in_air();

	// shield animation
	if (shield) and (shield_type == SHIELD_BUBBLE)
	{
	    with shield
	    {
	        action = true;
	        animation_script = player_animation_shield_bubble_action;
	        animation_speed = 1;
	        animation_running = true;
	        animation_reset = true;
	    }
	}

	// sound
	audio_play_emitter(audio_emitter, sndShieldBubbleAction, false, 0);



}
