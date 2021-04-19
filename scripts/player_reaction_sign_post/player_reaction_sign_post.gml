function player_reaction_sign_post(argument0)
{
	// player_reaction_sign_post(local_id)

	// ignore if ...
	if objZone.finished return false; // Already done
	if (path_index > -1) return false; // Pathing

	// Handle based on game mode
	switch objGame.mode
	{
	    case GAMETYPE_SINGLEPLAYER: // Singleplayer
	    {
	        // Ignore if not player 1
	        if (player_id > 0)
	        {
	            return false;
	        }
    
	        // Scene is finished
	        objZone.finished = true;
        
	        // Stop timer
	        if (player_id == 0) 
	        {
	           objZone.timer_enabled = false; 
	        } 
	    }
	    break;
	}

	// Set sign post face
	argument0.character_id = character_id;

	// Animate
	argument0.animation_script = object_animation_signpost;
	argument0.animation_speed = 1;
	argument0.animation_running = true;

	// Sound
	audio_play_stereo(sndSignPost, argument0.x, argument0.y, false, 0);
	return false;
}