function player_reaction_harmful_solid(argument0) {
	// player_reaction_harmful_solid(local_id)

	// abort if immune or already hit
	if (immunity) or (invincibility) or (super_form) or (state == player_is_hurt) { return false; }

	// take hit
	player_hit(sign(x - argument0.x), argument0.hurt_sound, argument0.hurt_type, argument0.hurt_vulnerable);

	// state changed
	return true;



}
