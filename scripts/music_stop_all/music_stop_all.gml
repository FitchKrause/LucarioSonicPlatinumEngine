/// @description  music_stop_all()
function music_stop_all()
{
	with objMusic
	{
	    if (music_flags & MUSFLAG_LOCKED) { exit; }
	    audio_stop_sound(music_playing);
	    audio_stop_sound(overlay_playing);
	    state = MUSSTATE_SILENCE;
	}
}