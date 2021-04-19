function player_reaction_layer_flip(argument0) {
	// player_reaction_layer_flip(local_id)
	zlayer = 1 + (sign(argument0.image_xscale) xor sign(x - xprevious));
	return false;




}
