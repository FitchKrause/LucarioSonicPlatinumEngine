/// @description  player_react(local_id, code)
/// @param local_id
/// @param code
function player_react()
{
	/*
	Executes the reaction script of the given local.

	> local_id: instance id to evaluate
	> code: collision code to apply

	< return value: boolean; whether to abort the calling player instance's current state or not.
	*/

	if (argument[0].reaction_script < 0) { return false; }
	return script_execute(argument[0].reaction_script, argument[0], argument[1]);
}