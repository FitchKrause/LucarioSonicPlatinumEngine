function player_update_water_running()
{
	// player_update_water_running()
	/*
	Evaluates if the calling player instance can run along the surface of nearby water.

	< return value: n/a.
	*/

	// Abort if on floor, oriented incorrectly, not enough speed or in too deep
	if (floor_tag & 1) or (mask_rotation > 0) or (abs(xspeed) < waterrun_threshold) or underwater { return false; }

	// Evaluate all locals
	var total_locals = instance_number(objWater);
	var local_id = noone;
	for (var i = 0; i < total_locals; i += 1)
	{
	    local_id = instance_find(objWater, i);
	    if not local_id.can_run { continue; } // // Ignore if disabled
	    if (y > local_id.bbox_top) or (((y + offset_y) + 1) < local_id.bbox_top) { continue; } // // Ignore if not right on top

	    floor_tag |= 2; // Confirm water running
	    if (y <> ((local_id.bbox_top - offset_y) - 1)) { y = (local_id.bbox_top - offset_y) - 1; angle = 0; relative_angle = 0; } // Align to water surface
	    if not (objScreen.image_index mod 4) // Water effect and sound
	    {
	        audio_stop_sound(sndSplash);
	        audio_play_stereo(sndSplash, floor(x), floor(y), false, 0);
	        part_particles_create(objGame.particles, x - (offset_x * facing), local_id.bbox_top, objResources.part_splash, 1);
	    }
	    break;
	}
}