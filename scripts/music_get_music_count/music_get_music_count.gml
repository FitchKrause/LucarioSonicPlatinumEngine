/// @description  music_get_music_count()
function music_get_music_count()
{
	var music_count = 0
	var music_read = 0;
	while audio_exists(music_read)
	{
	    var name = audio_get_name(music_read);
	    if is_undefined(name) { continue; }
	    if string_starts_with(name, "bgm") { music_count += 1; }
	    music_read += 1;
	    continue;
	}
	return music_count;
}