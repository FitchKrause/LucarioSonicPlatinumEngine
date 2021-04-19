/// @description  player_get_speedshoes()
function player_get_speedshoes() {
	/*
	Activates the speed shoes power-up for the calling player instance.
	(Or resets the timer if already active)

	< return value: n/a
	*/

	// refresh if already got superspeed
	if superspeed { superspeed = 1200; } 
	else
	{
	    // give super speed
	    superspeed = 1200;
	    player_reset_physics();
    
	    // music
	    if not audio_is_playing(bgmDrowning) { music_set_pitch(1.12); } else { music_reset_pitch(); }
	}



}
