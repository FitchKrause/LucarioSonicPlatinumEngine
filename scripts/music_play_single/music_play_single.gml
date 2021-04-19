/// @description  music_play_single(music, [position], [flags])
/// @param music
/// @param  [position]
/// @param  [flags]
function music_play_single()
{
	var newmusic = argument[0];
	var position = 0;
	var playflags = 0;
	if (argument_count > 1) { position = argument[1]; }
	if (argument_count > 2) { playflags = argument[2]; }

	// Abort if ...
	if (objMusic.music_flags & MUSFLAG_NOCHANGE) or (objMusic.music_flags & MUSFLAG_LOCKED) { exit; } // locked
	if is_undefined(newmusic) { exit; } // invalid
	if not audio_exists(newmusic) { exit; } // Doesn't exists
	if (playflags & MUSPLAYFLAG_NOFORCE) { if audio_is_playing(newmusic) { exit; } } // Already playing
	with objMusic
	{
		// State
		if (state <> MUSSTATE_OVERLAY) { state = MUSSTATE_SINGLE; } else { state_previous = MUSSTATE_SINGLE; }
		
		// Get arguments
		music_previous_id = music_current_id;
		music_previous_flags = music_current_flags;
		music_current_id = newmusic;
		music_current_flags = playflags;

	    // Change & Play
		audio_stop_sound(music_playing);
	    audio_sound_gain(newmusic, objData.volume_music, 0);
	    music_playing = audio_play_sound(newmusic, 100, false);
		audio_sound_gain(music_playing, objData.volume_music, 0);
		if (position <> 0) and (position > 0) { audio_sound_set_track_position(music_playing, (position / sample_rate)); }

	    // Modifiers
	    if (playflags & MUSPLAYFLAG_FADING) { audio_sound_gain(music_playing, 0, 0); }
	    audio_sound_gain(music_playing, objData.volume_music * not audio_is_playing(overlay_playing), 204 * sign(playflags & MUSPLAYFLAG_FADING) * (not audio_is_playing(overlay_playing)));
	    audio_sound_pitch(music_playing, pitch_current);
	    return music_playing;
	}
}