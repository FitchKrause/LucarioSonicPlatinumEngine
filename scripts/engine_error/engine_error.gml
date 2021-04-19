function engine_error(error)
{
	var extra = 0;
	var name = string_text("crash", "-", date_get_year(date_current_datetime()), "-", date_get_day(date_current_datetime()), "-", date_get_week(date_current_datetime()));
	do { extra += 1; } until not file_exists(name + "_" + string(extra));
	
	var file = file_text_open_write(name + "_" + string(extra) + ".txt");
	file_text_write_string(file, error.longMessage);
	file_text_writeln(file);
	file_text_write_string(file, string_join(error.stacktrace, "\n"));
	file_text_close(file);
	
	engine_set_active(false);
	
	var error_message = string_replace_all(string_replace_all(string_join(error.stacktrace, "\n"), "gml_Script_", ""), "gml_Object_", "");
	global.error = true;
	global.error_message = "ENGINE EXCEPTION:" + "\n" + string(object_get_name(object_index)) + " -> " + string_replace_all(string(error.script), "gml_Script_", "") + "\n\n" + error.message + "\n" + error_message + "\n\n" + "Press F2 to restart." + "\n" + "(Check complete crashlog at " + name + "_" + string(extra) + ".txt)";
}