/// @description  player_hit(direction, [sound], [type], [vulnerable])
/// @param direction
/// @param  [sound]
/// @param  [type]
/// @param  [vulnerable]
function player_hit()
{
	/*
	Evaluates the calling player instance's condition after taking a hit.

	> direction: sign of xspeed in case of recoil
	> [sound]: sound index; used when a shield is hit
	> [type]: harmful type
	> [vulnerable]: no inmmunity is given; used to replicate Sonic 1's spike bug

	< return value: n/a
	*/

	var sound = sndDeath;
	var harmful_type = HARMFUL_NORMAL;
	var vulnerable = false;
	if (argument_count > 1) { sound = argument[1]; }
	if (argument_count > 2) { harmful_type = argument[2]; }
	if (argument_count > 3) { vulnerable = argument[3]; }

	// Abort if immune or already hit or depending on harmful type or is player dead
	if immunity or invincibility or super_form or (state == player_is_hurt) { return false; }
	if shield and (shield_type <> SHIELD_INSTASHIELD)
	{
		switch harmful_type
		{
		    case HARMFUL_FIRE: { if (shield_type == SHIELD_FIRE) { return false; } break; }
		    case HARMFUL_ELETRIC: { if (shield_type == SHIELD_LIGHTNING) { return false; } break; }
		    case HARMFUL_PROJECTILE: { if (shield_type == SHIELD_NORMAL) { return false; } break; }
			case HARMFUL_WATER: { if (shield_type == SHIELD_BUBBLE) { return false; } break; }
		}
	}

	// Remove shield or drop rings or player dead
	if shield and (shield_type <> SHIELD_INSTASHIELD)
	{
	    instance_destroy(shield);
	    shield = noone;
	    shield_type = SHIELD_NONE;
	    if (sound <> sndDeath) { audio_play_emitter(audio_emitter, sound, false, 0); }
	    audio_play_emitter(audio_emitter, sndDeath, false, 0);
	}
	else if objData.player_rings[player_id]
	{
	    player_drop_rings(objData.player_rings[player_id], floor(x), floor(y));
	    objData.player_rings[player_id] = 0;
	    if (sound <> sndRingLoss) { audio_play_emitter(audio_emitter, sound, false, 0); }
	    audio_play_emitter(audio_emitter, sndRingLoss, false, 0);
	}
	else { return player_is_dead(-1, sound); }
	player_is_hurt(-1, argument[0], vulnerable);
}