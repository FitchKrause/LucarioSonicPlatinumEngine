/// @description  Destroy enemy if flying

if (place_meeting(x, y, objEnemy))
{
    // abort if ...
    if (player_id.state <> player_is_flying) or (player_id.underwater > -1) { exit; } // not actually flying
    if (sprite_index <> sprTailsEffect4) { exit; } // tails aren't spinning right
    if (not other.can_hit) { exit; } // can't harm this guy
    
    // give score
    player_chain_multiplier(player_id, other.x, other.y);
    
    // destroy enemy
    instance_destroy(other);
    
    // sound
    audio_play_emitter(player_id.audio_emitter, sndPop, false, 0);
}

