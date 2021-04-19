/// @description  music_set_volume(music, value, [frames])
/// @param music
/// @param  value
/// @param  [frames]
function music_set_volume()
{
	var music = argument[0];
	with objMusic
	{
	    if (music_flags & MUSFLAG_LOCKED) { exit; }
	    if (argument_count > 2) { audio_sound_gain(music, argument[1], (argument[2] * 1000) / 60); } else { audio_sound_gain(music, argument[1], 0); }
	}
}