/// @description GIF Recording

if gif_enabled
{
	if (gif_handle <> -1)
	{
		if (gif_tick < 120)
		{
			gif_add_surface(gif_handle, rendering_game_id, 6 / 100);
			gif_tick += 1;
		}
		else
		{
			gif_enabled = false;
			gif_tick = 0;
			gif_save(gif_handle, "GIF_TEST.gif");
			audio_play_normal(sndCheckpointReverse, false, 0);
		}
	}
}