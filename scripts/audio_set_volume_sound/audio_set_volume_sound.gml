/// @description  audio_set_volume_sound(volume)
/// @param volume
function audio_set_volume_sound()
{
	/*
	Sets the volume of all sound effects and updates every audio emitter that uses them.
	If you create new objects with audio emitters that can be affected by the global
	volume, be sure to add them here!

	> volume: value to set the volume to.

	< return value: n/a
	*/
	
	objData.volume_sfx = argument[0];
	with objPlayer { audio_emitter_gain(audio_emitter, objData.volume_sfx); }
	with objCapsule { audio_emitter_gain(audio_emitter, objData.volume_sfx); }
	with objZoneObject { audio_emitter_gain(audio_emitter, objData.volume_sfx); }
}