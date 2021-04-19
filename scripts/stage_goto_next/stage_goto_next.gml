/// @description  stage_goto_next(transition, [fade_music])
/// @param transition
/// @param  [fade_music]
function stage_goto_next()
{
	/*
	Transitions to the next scene on the queue.
	(Does nothing if we've already reached the last scene in the queue)

	> transition: object index of transition to use

	< return value: n/a
	*/

	var fade_music = true;
	if (argument_count > 1) { fade_music = argument[1]; }
	with objGame
	{
	    // ignore if out of bounds or if empty
	    if ds_list_empty(stage_list) or ((stage_index + 1) >= ds_list_size(stage_list)) { transition_to(gameMenu, objFade, 24); return false; }
	
	    // get next scene
	    stage_index += 1;
	    stage_id = stage_list[|stage_index];
	    transition_to(stage_id, argument[0], 24, fade_music);
	}
}