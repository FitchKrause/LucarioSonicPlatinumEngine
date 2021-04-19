/// @description  music_reset_pitch()
function music_reset_pitch()
{
	with objMusic
	{
	    if (music_flags & MUSFLAG_LOCKED) { exit; }
	    pitch_target = pitch_default;
	}
}