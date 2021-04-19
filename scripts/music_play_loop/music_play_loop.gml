/// @description  music_play_loop(music, [looppoint], [position], [flags])
/// @param music
/// @param  [looppoint]
/// @param  [position]
/// @param  [flags]
function music_play_loop()
{
	var newmusic = argument[0];
	var loop = 0;
	var position = 0;
	var playflags = 0;
	if (argument_count > 1) { loop = argument[1]; }
	if (argument_count > 2) { position = argument[2]; }
	if (argument_count > 3) { playflags = argument[3]; }

	// Abort if ...
	if is_undefined(newmusic) { exit; } // Invalid
	if not audio_exists(newmusic) { exit; } // Doesn't exists
	if (playflags & MUSPLAYFLAG_NOFORCE) { if audio_is_playing(newmusic) { exit; } } // Already playing
	if (objMusic.music_flags & MUSFLAG_NOCHANGE) or (objMusic.music_flags & MUSFLAG_LOCKED) { exit; } // System locked
	with objMusic
	{
		// State
		if (state <> MUSSTATE_OVERLAY) { state = MUSSTATE_LOOP; } else { state_previous = MUSSTATE_LOOP; }
		
		// Get arguments
		music_previous_id = music_current_id;
		music_previous_flags = music_current_flags;
		music_previous_looppoint = music_current_looppoint;
		music_current_id = newmusic;
		music_current_flags = playflags;
		music_current_looppoint = loop;
		
	    // Change & Play
		audio_stop_sound(music_playing);
		audio_sound_gain(newmusic, objData.volume_music, 0);
		music_playing = audio_play_sound(newmusic, 100, true);
		audio_sound_gain(music_playing, objData.volume_music, 0);
		if (position <> 0) and (position > 0) { audio_sound_set_track_position(music_playing, (position / sample_rate)); }
	    is_looping = false;
	
	    // Modifiers
	    if audio_is_playing(overlay_playing) { audio_pause_sound(music_playing); }
	    if (playflags & MUSPLAYFLAG_FADING) { audio_sound_gain(music_playing, 0, 0); }
		audio_sound_gain(music_playing, objData.volume_music * (not audio_is_playing(overlay_playing)), 204 * sign(playflags & MUSPLAYFLAG_FADING) * (not audio_is_playing(overlay_playing)));
	    audio_sound_pitch(music_playing, pitch_current);
	    return music_playing;
	}
}