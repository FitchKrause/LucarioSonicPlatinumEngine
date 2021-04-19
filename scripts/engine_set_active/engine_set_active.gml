/// @description  engine_set_active(active)
/// @param active

/*
Pauses or un-pauses the engine.

> active: boolean; whether the engine should be active or paused

< return value: n/a
*/

function engine_set_active()
{
	if argument[0]
	{
		instance_activate_object(objEngineObject);
		if paused { instance_deactivate_object(objSceneObject); } else { audio_resume_all(); }
	}
	else
	{    
		instance_deactivate_object(objEngineObject);
		audio_pause_all();
	}
}