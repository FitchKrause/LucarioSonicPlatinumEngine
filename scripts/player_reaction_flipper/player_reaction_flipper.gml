/// @description  player_reaction_flipper(local_id, code)
/// @param local_id
/// @param  code
function player_reaction_flipper(argument0, argument1) {

	// ignore if already activated
	if (argument0.player_id == id) { return false; }

	// check collision
	if ((argument1 <> DIRECTION_LEFT) and (argument0.image_index <> -1)) and ((argument1 <> DIRECTION_RIGHT) and (argument0.image_index <> 1)) and (argument1 <> DIRECTION_BOTTOM)
	{
	    return false;
	}

	// give control to flipper
	argument0.player_id = id;

	// animate
	animation_new = "spin";
	animation_speed = (1 / max(5, 1));
	image_angle = 0;

	// states and flags
	toggleflags |= PLAYERSTATE_NOSTATE;
	spinning = true;
	spindashing = false;
	jump_action = true;

	// counters
	chain_multiplier = 0;

	// bubble shield
	if (shield) and (shield_type == SHIELD_BUBBLE) { with shield { if (action) { action = false; } } }

	// character values
	if (character_id == CHARACTER_KNUCKLES) { glide_falling = false; }
	if (character_id == CHARACTER_SONIC) { dropdasing = false; }

	// hard collision found
	return true;



}
