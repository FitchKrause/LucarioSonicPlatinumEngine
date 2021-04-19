function player_update_air()
{
	// abort if not underwater or outspace
	if ((not outspace and not underwater) or (collision_point(floor(x), floor(y), objWater, false, true) or collision_point(floor(x), floor(y), objSpace, false, true))) { return false; }
	if underwater
	{
		var water_id = collision_point(floor(xprevious), floor(yprevious), objWater, false, true);
		if water_id { if (y < water_id.bbox_top) { yspeed *= 2; part_particles_create(objGame.particles, x, water_id.bbox_top, objResources.part_splash, 1); } }
		underwater = false;
		if (state == player_is_flying) { animation_new = "flight"; if not timer { animation_new = "flight_end"; } }
		audio_play_stereo(sndSplash, floor(x), floor(y), false, 0);
	}
	else if outspace { outspace = false; }
	
	// Clear
	air_count = -1;
	player_reset_physics();
	instance_destroy(drown_count);
	drown_count = noone;

	// Music
	music_reset_pitch();
	music_play_loop(objZone.music, objZone.looppoint, objMusic.music_position[0], MUSPLAYFLAG_FADING|MUSPLAYFLAG_NOFORCE);
	if superspeed { music_set_pitch(1.12); }
	if invincible { music_play_loop(bgmInvincibility, 39513, 0, MUSPLAYFLAG_FADING|MUSPLAYFLAG_NOFORCE); }
	if super_form { music_play_loop(bgmTransformationTheme, 0, objMusic.music_position[0]); }
}