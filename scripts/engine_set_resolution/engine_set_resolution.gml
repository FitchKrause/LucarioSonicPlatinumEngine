/// @description  engine_set_resolution(multiplier)
/// @param multiplier
function engine_set_resolution()
{
	if resolution_supported(objScreen.width * argument[0], objScreen.height * argument[0])
	{
	    objData.resolution = argument[0];
	    with objScreen { event_user(0); }
	    save_settings();
	    audio_play_normal(sndCheckpoint, false, 0);
	}
	else
	{
	    audio_stop_sound(sndError);
	    audio_play_normal(sndError, false, 0);
	}
}