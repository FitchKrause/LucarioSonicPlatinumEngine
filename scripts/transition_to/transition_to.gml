/// @description  transition_to(next_room, kind, frames, [music_fade], [custom_colour])
/// @param next_room
/// @param  kind
/// @param  frames
/// @param  [music_fade]
/// @param  [custom_colour]
function transition_to()
{
	/*
	Switches to the given room using the given transition kind.

	> next_room: room to switch to
	> kind: object index of the transition type
	> frames: amount of time in frames it should take to transition
	> [music_fade]: Optional, don't fade music on transition

	< return value: instance id of the transtion object, or noone if something went wrong
	*/
	if instance_exists(argument[1]) { return noone; }

	var fade_music = true;
	var custom_colour = c_black;
	if (argument_count > 3) { fade_music = argument[3]; }
	if (argument_count > 4) { custom_colour = argument[4]; }
	if fade_music { music_set_volume_all(0, argument[2]); objMusic.music_flags &= ~(MUSFLAG_NOSTOP); } else { objMusic.music_flags |= MUSFLAG_NOSTOP; }
	with instance_create_depth(0, 0, -2000, argument[1])
	{
	    next_room = argument[0];
		fill_colour = custom_colour;
	    image_speed = 1 / argument[2];
		global.tempo = 0;
	    return id;
	}
	return noone;
}