/// @description  default_settings()
function default_settings() {

	// Load defaults
	objData.volume_music = objData.default_volume_music;
	objData.volume_sfx = objData.default_volume_sfx;
	objData.level_restart = objData.default_level_restart;
	objData.level_finish = objData.default_level_finish;
	//objData.menu_music = objData.default_menu_music;

	objData.classic_rotation = objData.default_classic_rotation;
	objData.cd_camera = objData.default_cd_camera;
	objData.spindash_mode = objData.default_spindash_mode;
	objData.falling_animations = objData.default_falling_animations;

	objData.hud_visible = objData.default_hud_visible;
	objData.hud_translucency = objData.default_hud_translucency;
	objData.powerup_display = objData.default_powerup_display;
	objData.continues_display = objData.default_continues_display;
	objData.zeroes_display = objData.default_zeroes_display;

	objData.resolution = objData.default_resolution;
	objData.fullscreen = objData.default_fullscreen;
	objData.show_fps = objData.default_show_fps;

	// Save settings
	save_settings();


}
