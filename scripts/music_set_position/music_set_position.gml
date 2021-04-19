/// @description  music_set_position(music, position)
/// @param music
/// @param position
function music_set_position()
{
	var music = argument[0];
	var position = argument[1];
	if is_undefined(music) { exit; }
	with objMusic
	{
	    if (music_flags & MUSFLAG_LOCKED) { exit; }
	    if (position <> 0) and (position > 0) { audio_sound_set_track_position(music, (position / sample_rate)); }
	}
}