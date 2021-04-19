/// @description  music_unload(music)
/// @param music
function music_unload()
{
	//var music = argument[0];
	//if audio_exists(music) { audio_destroy_stream(music); }
	if audio_exists(argument[0]) { audio_destroy_stream(argument[0]); }
}