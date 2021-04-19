/// @description  stage_goto(index, transition, [frames])
/// @param index
/// @param  transition
/// @param  [frames]
function stage_goto()
{
	/*
	Transitions directly to the given scene from the queue.
	(Does nothing if the given id does not exist)

	> index: index of scene in list
	> transition: object index of transition to use

	< return value: n/a
	*/

	var frames = 24;
	if (argument_count > 2) { frames = argument[2]; }
	with objGame
	{
	    // ignore if out of bounds or if empty
	    if ds_list_empty(stage_list) or ((argument[0] < 0) or (argument[0] >= ds_list_size(stage_list))) { transition_to(gameMenu, objFade, 24); return false; }
    
	    // get scene
	    stage_id = stage_list[|argument[0]];
	    stage_index = argument[0];
	    transition_to(stage_id, argument[1], frames, true);
	}
}