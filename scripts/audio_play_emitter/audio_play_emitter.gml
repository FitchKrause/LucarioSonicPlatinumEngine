/// @description  audio_play_emitter(emitter, sound, loops, priority)
/// @param emitter
/// @param  sound
/// @param  loops
/// @param  priority
function audio_play_emitter()
{
	/*
	Plays a 3 dimensional sound effect through the emitter.

	> emitter: Emmiter ID to play the sound.
	  sound: Sound resource.
	  loops: Is looping?
	  priority: Priority sound.

	< return value: The ID of the playing sound on the emitter.
	*/
	if (argument[1] == sndRing) { return audio_play_stereo(sndRing, 0, 0, argument[2], argument[3]); }
	return audio_play_sound_on(argument[0], argument[1], argument[2], argument[3]);
}