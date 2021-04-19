/// @description  game_set_active(active)
/// @param active
function game_set_active()
{
	with objScreen { paused = not argument[0]; }
	with objGame { part_system_automatic_update(particles, argument[0]); }
	if argument[0] { instance_activate_object(objSceneObject); audio_resume_all(); }
	else
	{    
	    with objScreen { screenshot = sprite_create_from_surface(application_surface, 0, 0, width, height, false, false, 0, 0); }
	    instance_deactivate_object(objSceneObject);
	    audio_pause_all();
	}
}