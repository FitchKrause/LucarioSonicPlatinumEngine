/// @desc player_reaction_bubble(local_id)
function player_reaction_bubble()
{
	// ignore if ...
	if (path_index > -1) return false; // pathing
	if floor_tag return false; // not in the air
	if (argument0.image_index < 5) return false; // too small
	if (shield_type == SHIELD_BUBBLE) return false; // bubble shield
	if super_form { return false; } // super form

	// update player
	state = player_is_falling;
	xspeed = 0;
	yspeed = 0;
	if (character_id == CHARACTER_KNUCKLES) { glide_falling = false; }
	if (character_id == CHARACTER_SONIC) { dropdasing = false; }
	air_count = 1800;
	animation_new = "get_air";
	animation_speed = 1;

	// particles and effects
	part_particles_create(objGame.particles, argument0.x, argument0.y, objResources.part_bubble_pop, 1);
	with drown_count { instance_destroy(); }
	drown_count = noone;

	// sound
	music_reset_pitch();
	music_play_loop(objZone.music, objZone.looppoint, objMusic.music_position[0], MUSPLAYFLAG_FADING|MUSPLAYFLAG_NOFORCE);
	if superspeed { music_set_pitch(1.12); }
	if invincible { music_play_loop(bgmInvincibility, 39513, 0, MUSPLAYFLAG_FADING|MUSPLAYFLAG_NOFORCE); }
	if super_form { music_play_loop(bgmTransformationTheme, 0, objMusic.music_position[0]); }
	audio_play_stereo(sndGetAir, argument0.x, argument0.y, false, 0);
	instance_destroy(argument0);
	return true;
}