/// @description  music_reset_volume()
function music_reset_volume()
{
	with objMusic
	{
	    if (music_flags & MUSFLAG_LOCKED) { exit; }
	    audio_sound_gain(music_playing, objData.volume_music, 0);
	    audio_sound_gain(overlay_playing, objData.volume_music, 0);
	}
}