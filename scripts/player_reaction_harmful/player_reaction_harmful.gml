function player_reaction_harmful(argument0) {
	// player_reaction_harmful(local_id)

	// abort if immune or already hit
	if (immunity) or (invincibility) or (super_form) or (state == player_is_hurt) { return false; }

	// projectile
	if (argument0.hurt_type == HARMFUL_PROJECTILE) and ((shield) and ((shield_type == SHIELD_BUBBLE) or (shield_type == SHIELD_NORMAL)))
	{
	    // bounce projectile
	    argument0.xspeed = lengthdir_x(10, point_direction(x, y, argument0.x, argument0.y));
	    argument0.yspeed = lengthdir_y(10, point_direction(x, y, argument0.x, argument0.y));
	    argument0.gravity_force = 0.21875;
	    argument0.mask_index = sprMaskNull;
    
	    // 
	    return false;
	}

	// take hit
	player_hit(sign(x - argument0.x), argument0.hurt_sound, argument0.hurt_type, argument0.hurt_vulnerable);

	// state changed
	return true;



}
