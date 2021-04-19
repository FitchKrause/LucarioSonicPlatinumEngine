/// @description  music_stop_overlay()
function music_stop_overlay() 
{
	with objMusic
	{
	    if (music_flags & MUSFLAG_LOCKED) { exit; }
	    audio_stop_sound(overlay_playing);
	}
}
