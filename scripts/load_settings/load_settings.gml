/// @description  load_settings()
function load_settings()
{
	// Load file
	if not file_exists(working_directory + "\\" + SAVEFILESETTINGS) { default_settings(); exit; }
	var file = file_text_open_read(working_directory + "\\" + SAVEFILESETTINGS);

	// Audio
	objData.volume_music = real(vigenere_ascii(file_text_read_string(file), MASTERKEY, 0));
	file_text_readln(file);
	objData.volume_sfx = real(vigenere_ascii(file_text_read_string(file), MASTERKEY, 0));
	file_text_readln(file);
	objData.level_restart = real(vigenere_ascii(file_text_read_string(file), MASTERKEY, 0));
	file_text_readln(file);
	objData.level_finish = real(vigenere_ascii(file_text_read_string(file), MASTERKEY, 0));
	file_text_readln(file);

	// Gameplay
	objData.classic_rotation = real(vigenere_ascii(file_text_read_string(file), MASTERKEY, 0));
	file_text_readln(file);
	objData.cd_camera = real(vigenere_ascii(file_text_read_string(file), MASTERKEY, 0));
	file_text_readln(file);
	objData.spindash_mode = real(vigenere_ascii(file_text_read_string(file), MASTERKEY, 0));
	file_text_readln(file);
	objData.falling_animations = real(vigenere_ascii(file_text_read_string(file), MASTERKEY, 0));
	file_text_readln(file);

	// Gameplay
	objData.hud_visible = real(vigenere_ascii(file_text_read_string(file), MASTERKEY, 0));
	file_text_readln(file);
	objData.hud_translucency = real(vigenere_ascii(file_text_read_string(file), MASTERKEY, 0));
	file_text_readln(file);
	objData.powerup_display = real(vigenere_ascii(file_text_read_string(file), MASTERKEY, 0));
	file_text_readln(file);
	objData.continues_display = real(vigenere_ascii(file_text_read_string(file), MASTERKEY, 0));
	file_text_readln(file);
	objData.zeroes_display = real(vigenere_ascii(file_text_read_string(file), MASTERKEY, 0));
	file_text_readln(file);

	// Video
	objData.resolution = real(vigenere_ascii(file_text_read_string(file), MASTERKEY, 0));
	file_text_readln(file);
	objData.fullscreen = real(vigenere_ascii(file_text_read_string(file), MASTERKEY, 0));
	file_text_readln(file);
	objData.show_fps = real(vigenere_ascii(file_text_read_string(file), MASTERKEY, 0));
	file_text_readln(file);

	// Close file
	file_text_close(file);
}
