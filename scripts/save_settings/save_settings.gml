/// @description  save_settings()
function save_settings()
{	
	// Create file
	if file_exists(working_directory + "\\" + SAVEFILESETTINGS) { file_delete(working_directory + "\\" + SAVEFILESETTINGS); }
	var file = file_text_open_write(working_directory + "\\" + SAVEFILESETTINGS);

	// Audio
	file_text_write_string(file, vigenere_ascii(objData.volume_music, MASTERKEY, 1));
	file_text_writeln(file);
	file_text_write_string(file, vigenere_ascii(objData.volume_sfx, MASTERKEY, 1));
	file_text_writeln(file);
	file_text_write_string(file, vigenere_ascii(objData.level_restart, MASTERKEY, 1));
	file_text_writeln(file);
	file_text_write_string(file, vigenere_ascii(objData.level_finish, MASTERKEY, 1));
	file_text_writeln(file);

	// Gameplay
	file_text_write_string(file, vigenere_ascii(objData.classic_rotation, MASTERKEY, 1));
	file_text_writeln(file);
	file_text_write_string(file, vigenere_ascii(objData.cd_camera, MASTERKEY, 1));
	file_text_writeln(file);
	file_text_write_string(file, vigenere_ascii(objData.spindash_mode, MASTERKEY, 1));
	file_text_writeln(file);
	file_text_write_string(file, vigenere_ascii(objData.falling_animations, MASTERKEY, 1));
	file_text_writeln(file);

	// HUD
	file_text_write_string(file, vigenere_ascii(objData.hud_visible, MASTERKEY, 1));
	file_text_writeln(file);
	file_text_write_string(file, vigenere_ascii(objData.hud_translucency, MASTERKEY, 1));
	file_text_writeln(file);
	file_text_write_string(file, vigenere_ascii(objData.powerup_display, MASTERKEY, 1));
	file_text_writeln(file);
	file_text_write_string(file, vigenere_ascii(objData.continues_display, MASTERKEY, 1));
	file_text_writeln(file);
	file_text_write_string(file, vigenere_ascii(objData.zeroes_display, MASTERKEY, 1));
	file_text_writeln(file);

	// Video
	file_text_write_string(file, vigenere_ascii(objData.resolution, MASTERKEY, 1));
	file_text_writeln(file);
	file_text_write_string(file, vigenere_ascii(objData.fullscreen, MASTERKEY, 1));
	file_text_writeln(file);
	file_text_write_string(file, vigenere_ascii(objData.show_fps, MASTERKEY, 1));
	file_text_writeln(file);

	// Close file
	file_text_close(file);
}