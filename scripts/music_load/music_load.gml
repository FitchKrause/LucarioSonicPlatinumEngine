/// @description  music_load(filename)
/// @param filename
function music_load()
{
	//var filename = argument[0];
	//if not file_exists(filename) { return undefined; } else { return audio_create_stream(filename); }
	return not file_exists(argument[0]) ? undefined : audio_create_stream(argument[0]);
}