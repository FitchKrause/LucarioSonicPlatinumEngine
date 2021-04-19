/// @description  Music system machine

try
{
	// State machine
	switch state
	{   
	    case MUSSTATE_LOOP: // Loop state
	    {
	        if (music_current_looppoint <> 0) and (music_current_looppoint > 0)
	        {
	            if (audio_sound_get_track_position(music_playing) >= (music_current_looppoint / sample_rate)) and not is_looping { is_looping = true; }
	            else if (audio_sound_get_track_position(music_playing) < (music_current_looppoint / sample_rate)) and is_looping { music_set_position(music_playing, music_current_looppoint); }
	        }
			//music_set_position(music_playing, (audio_sound_get_track_position(music_playing) + 0.01) * sample_rate);
	        break;
	    }
    
	    case MUSSTATE_SINGLE: // Single state
	    {        
	        if not audio_is_playing(music_playing) { state = state_default; music_stop_all(); } break;
	    }
    
	    case MUSSTATE_OVERLAY: // Overlay state
	    {
	        if audio_is_playing(overlay_playing) { if (state_previous == MUSSTATE_LOOP) { if not audio_is_paused(music_playing) { audio_pause_sound(music_playing); } } }
	        else if not audio_is_playing(overlay_playing)
	        {
	            overlay_playing = -1;
	            if (state_previous == MUSSTATE_LOOP) { audio_resume_sound(music_playing); }
	            music_set_volume(music_playing, objData.volume_music, 204);
	            state = state_previous;
	        }
	        break;
	    }
	}

	// Pitch handler
	if (pitch_current <> pitch_target)
	{
		pitch_current = pitch_target;
		audio_sound_pitch(music_playing, pitch_current);
		audio_sound_pitch(overlay_playing, pitch_current);
	}
	
}
catch(error) { engine_error(error); }