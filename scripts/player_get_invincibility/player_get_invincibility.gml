/// @description  player_get_invincibility()
function player_get_invincibility()
{
	/*
	Activates the invincibility power-up for the calling player instance.
	(Or resets the timer if already active)

	< return value: n/a
	*/

	// hide shield
	if shield { shield.visible = false; }

	// refresh if already created
	if invincibility { invincible = 1200; } 
	else
	{
	    // create invincibility
	    invincible = 1200;
	    invincibility = instance_create_depth(floor(x), floor(y), depth - 1, objInvincibility);
	    invincibility.player_id = id;
	    if super_form { invincibility.visible = false; }

	    // music
	    objMusic.music_position[0] = (audio_sound_get_track_position(objMusic.music_playing) * objMusic.sample_rate);
	    music_play_loop(bgmInvincibility, 39513);
	}
}