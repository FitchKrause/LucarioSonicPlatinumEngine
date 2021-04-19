/// @description  music_set_pitch(value)
/// @param value
function music_set_pitch()
{
	with objMusic
	{
	    if (music_flags & MUSFLAG_LOCKED) { exit; }
	    pitch_target = argument[0];
	}
}