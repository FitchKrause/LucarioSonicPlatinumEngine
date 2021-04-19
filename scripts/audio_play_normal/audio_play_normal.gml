/// @description  audio_play_normal(sound, loops, priority, [volume])
/// @param sound
/// @param  loops
/// @param  priority
/// @param  [volume]
function audio_play_normal()
{
	var volume = objData.volume_sfx;
	if (argument_count > 3) { volume = argument[3]; }
	audio_sound_gain(argument[0], volume, 0);
	return audio_play_sound(argument[0], argument[2], argument[1]);
}