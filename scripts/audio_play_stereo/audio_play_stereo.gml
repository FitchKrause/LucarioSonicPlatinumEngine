/// @description  audio_play_stereo(sound, x, y, loops, priority, [volume])
/// @param sound
/// @param  x
/// @param  y
/// @param  loops
/// @param  priority
/// @param  [volume]
function audio_play_stereo()
{
	/*
	Plays a 2 dimensional (stereo) sound effect.

	> sound: Sound resource.
	  x, y: coordinates to play the sound.
	  loops: Is looping?
	  priority: Priority sound.
	  [volume]: If no given default to objData sound volume.

	< return value: The ID of the playing sound.
	*/
	var volume = objData.volume_sfx;
	if (argument_count > 5) { volume = argument[5]; }

	if (argument[0] == sndRing)
	{
	    global.ring_side = not global.ring_side;
	    audio_stop_sound(global.ring_side ? sndRingRight : sndRingLeft);
	    return audio_play_sound(global.ring_side ? sndRingRight : sndRingLeft, argument[3], argument[4]);
	}

	audio_sound_gain(argument[0], volume, 0);
	return audio_play_sound_at(argument[0], argument[1], argument[2], 0, 100, 300, 1, argument[3], argument[4]);
}