/// @description  Update

// Image index
image_index = objScreen.image_index div 8;

// Timer
if objZone.timer_enabled
{
    // total time
	var total_time = (objZone.levelflags & LEVELFLAG_REVERSETIMER) ? total_time = min(abs(objZone.timer), 35999) : min(abs(objZone.timer - objGame.spawn_time), 35999);
    var minutes = string(total_time div 3600);
    var seconds = string_real_character(((total_time div 60) mod 60), 2, "0");
	var centiseconds = string_real_character(floor((total_time mod 60) / 0.60), 2, "0");
    time_stamp = minutes + ":" + seconds + "." + centiseconds;
}