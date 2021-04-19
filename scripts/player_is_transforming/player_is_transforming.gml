/// @description  player_is_transforming(step)
/// @param step
function player_is_transforming() {

	switch argument[0]
	{
	    case -1: // Initialize
	    {
	        // Animate
	        animation_new = "transform";
	        animation_speed = 1;
	        image_angle = gravity_angle();
        
	        // States and flags
	        state = player_is_transforming;
	        break;
	    }
    
	    default: // Main
	    {
	        // Animation
	        switch character_id
	        {
	            case CHARACTER_SONIC:
	            {
	                switch animation_tick
	                {
	                    case 0:
	                    {
	                        music_set_volume_all(0, 24);
	                        break;
	                    }
                    
	                    case 12:
	                    {
	                        objMusic.music_position[0] = (audio_sound_get_track_position(objMusic.music_playing) * objMusic.sample_rate);
	                        music_play_loop(bgmTransformationTheme);
	                        audio_play_emitter(audio_emitter, sndTransformate, false, 0);
	                        break;
	                    }
                    
	                    case 15: // Setup palette
	                    {
	                        player_trasformation(false);
	                        break;
	                    }
                    
	                    case 30: // End animation
	                    {
	                        super_form = true;
	                        animation_table = objResources.anim_supersonic;
	                        animation_new = "fall";
	                        player_reset_palette();
	                        player_reset_physics();
	                        player_is_falling(-1);
	                    }
	                }
	            }
	        }
	    }
	}




}
