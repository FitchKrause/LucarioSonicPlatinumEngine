/// @description  State

switch state
{
    // Init
    case 0:
    {
        if not timer { state = 1; }
        y -= 1 * global.tempo;
        break;
    }
    
    case 1: // Redeem powerup
    {
        with player_id // get player id
        {
            
            if (state == player_is_dead) // abort if dead
            {
                audio_stop_sound(sndError);
                audio_play_emitter(audio_emitter, sndError, false, 0);
                with other
                {
                    player_id = noone;
                    instance_destroy();
                }
                exit;
            }
            
            switch other.item // get item type
            {
                case MONITOR_EXTRALIFE: // life
                {
                    player_get_lives(1);
                    break;
                }
            
                case MONITOR_EGGMAN: // eggman
                {
                    player_hit((facing * -1), sndDeath);
                    break;
                }
            
                case MONITOR_RINGBOX: // 10 rings
                {
                    audio_stop_sound(sndRing);
                    audio_play_emitter(audio_emitter, sndRing, false, 0);
                    player_get_rings(10);
                    break;
                }
                
                case MONITOR_SUPERSNEAKERS: // superspeed
                {
                    player_get_speedshoes();
                    break;
                }
            
                case MONITOR_SHIELDNORMAL: // normal shield
                {
                    player_get_shield(SHIELD_NORMAL);
                    audio_play_emitter(audio_emitter, sndShield, false, 0);
                    break;
                }
                    
                case MONITOR_SHIELDBUBBLE:  // bubble shield
                {
                    player_get_shield(SHIELD_BUBBLE);
                    audio_play_emitter(audio_emitter, sndShieldBubble, false, 0);
                    break;
                }
                    
                case MONITOR_SHIELDLIGHTNING: // lightning shield
                {
                    player_get_shield(SHIELD_LIGHTNING);
                    audio_play_emitter(audio_emitter, sndShieldLightning, false, 0);
                    break;
                }
                    
                case MONITOR_SHIELDFIRE: // fire shield
                {
                    player_get_shield(SHIELD_FIRE);
                    audio_play_emitter(audio_emitter, sndShieldFire, false, 0);
                    break;
                }
            
                case MONITOR_INVINCIBILITY: // invincibility
                {
                    player_get_invincibility();
                    break;
                }
                
                case MONITOR_EXTRATIME: // timer
                {
                    if instance_exists(objZone)
                    {
                        with objZone { timer = min(timer + 3600, objGame.spawn_time); }
                        audio_play_emitter(audio_emitter, sndWarp, false, 0);
                    }
					else { audio_play_emitter(audio_emitter, sndError, false, 0); }
                    break;
                }
                
                case MONITOR_SCOREBOX: // 1.000 score
                {
                    player_get_score(1000);
                    audio_play_emitter(audio_emitter, sndChing, false, 0);
                    break;
                }
                
                case MONITOR_SUPERSCOREBOX: // 5.000 score
                {
                    player_get_score(5000);
                    audio_play_emitter(audio_emitter, sndChing, false, 0);
                    break;
                }
            
                default: // none
                {
                    audio_play_emitter(audio_emitter, sndError, false, 0);
                    break;
                }
            }
        }
        
        // done
        state = 2;
        timer = 32;
		player_id = noone;
        break;
    }
    
    case 2: // destroy
    {
        if not timer { instance_destroy(); }
    }
}


