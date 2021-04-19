/// @description  music_play_overlay(music, [position], [flags])
/// @param music
/// @param  [position]
/// @param  [flags]
function music_play_overlay()
{
	var newmusic = argument[0];
	var position = 0;
	var playflags = 0;
	if (argument_count > 1) { position = argument[1]; }
	if (argument_count > 2) { playflags = argument[2]; }

	// Abort if ...
	if (objMusic.music_flags & MUSFLAG_NOCHANGEOVERLAY) or (objMusic.music_flags & MUSFLAG_LOCKED) { exit; } // Locked
	if is_undefined(newmusic) { exit; } // Invalid
	if not audio_exists(newmusic) { exit; } // Doesn't exists
	if (playflags & MUSPLAYFLAG_NOFORCE) { if audio_is_playing(newmusic) { exit; } } // Already playing

	with objMusic
	{    
	    // State
	    if (state <> MUSSTATE_OVERLAY) { state_previous = state; }
	    if (state == MUSSTATE_OVERLAY) { audio_stop_sound(overlay_playing); }
	    state = MUSSTATE_OVERLAY;
    
		// Get arguments
		overlay_previous_id = overlay_current_id;
		overlay_previous_flags = overlay_current_flags;
		overlay_current_id = newmusic;
		overlay_current_flags = playflags;
	
	    // Silence
		audio_sound_gain(music_playing, 0, 0);
	    if (state_previous == MUSSTATE_LOOP) { audio_pause_sound(music_playing) }
    
	    // Change & Play
		audio_sound_gain(newmusic, objData.volume_music, 0);
	    overlay_playing = audio_play_sound(newmusic, 100, false);
		audio_sound_gain(overlay_playing, objData.volume_music, 0);
	    if (position <> 0) and (position > 0) { audio_sound_set_track_position(overlay_playing, (position / sample_rate)); }
    
	    // Modifiers
		if (playflags & MUSPLAYFLAG_FADING) { audio_sound_gain(overlay_playing, 0, 0); }
		audio_sound_gain(overlay_playing, objData.volume_music, 204 * sign(playflags & MUSPLAYFLAG_FADING));
	    audio_sound_pitch(overlay_playing, pitch_current);
	    return overlay_playing;
	}
}