/// @description  music_set_volume_all(value, [frames])
/// @param value
/// @param  [frames]
function music_set_volume_all()
{
	with objMusic
	{
	    if (music_flags & MUSFLAG_LOCKED) { exit; }
	    if (argument_count > 1)
	    {
	        audio_sound_gain(music_playing, argument[0], (argument[1] * 1000) / 60);
	        audio_sound_gain(overlay_playing, argument[0], (argument[1] * 1000) / 60);
	    }
	    else
	    {
	        audio_sound_gain(music_playing, argument[0], 0);
	        audio_sound_gain(overlay_playing, argument[0], 0);
	    }
	}
}
