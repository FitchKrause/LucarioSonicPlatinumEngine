/// @description  music_stop_current()
function music_stop_current()
{
	with objMusic
	{
	    if (music_flags & MUSFLAG_LOCKED) { exit; }
	    audio_stop_sound(music_playing);
	}
}