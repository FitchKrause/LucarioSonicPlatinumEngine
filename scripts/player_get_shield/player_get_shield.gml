/// @description  player_get_shield(kind)
/// @param kind
function player_get_shield(argument0) {
	/*
	Gives the calling player instance a shield of the given kind.

	> kind: shield type to apply

	< return value: the shield type, or -1 if the player already has the given shield
	*/


	if (shield_type == argument0) { return -1; }
	shield_type = argument0;

	// create new shield
	if instance_exists(shield) { instance_destroy(shield); }
	switch shield_type
	{
	    case SHIELD_LIGHTNING: { shield = instance_create_depth(floor(x), floor(y), depth - 1, objShieldLightning); break; }
	    case SHIELD_INSTASHIELD: { shield = instance_create_depth(floor(x), floor(y), depth - 1, objShieldInstashield); break; }
	    case SHIELD_FIRE: { shield = instance_create_depth(floor(x), floor(y), depth - 1, objShieldFire); break; }
	    case SHIELD_BUBBLE: { shield = instance_create_depth(floor(x), floor(y), depth - 1, objShieldBubble); break; }
	    default: { shield = instance_create_depth(floor(x), floor(y), depth - 1, objShieldNormal); break; }
	}

	shield.image_xscale = facing;
	shield.player_id = id;
	if invincibility or super_form { shield.visible = false; }
	return shield_type;


}
