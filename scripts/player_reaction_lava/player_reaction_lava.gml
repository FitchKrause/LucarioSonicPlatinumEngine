function player_reaction_lava(argument0) {
	// player_reaction_lava(local_id)

	// abort if immune or already hit
	if (immunity) or (invincibility) or (super_form) or ((shield) and (shield_type == SHIELD_FIRE)) or (state == player_is_hurt) return false;

	// take hit
	player_hit(sign(x - argument0.x), sndDeathSpike, HARMFUL_FIRE, argument0.vulnerable);

	// state changed
	return true;



}
