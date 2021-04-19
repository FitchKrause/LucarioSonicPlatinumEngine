/// @description  save_gamepad(port)
/// @param port
function save_gamepad(argument0) {
	/*
	Saves control codes from the given controller port to "controls.ini".

	> port: id of the controller to save from; can be 0 or 1

	< return value: n/a
	*/

	// save control codes
	ini_open(working_directory + "\\gamepad.ini");

	with objGame.controller[argument0]
	{
	    // gamepad
	    ini_write_real("p" + string(argument0) + "_gamepad", "up", code_gamepad[0]);
	    ini_write_real("p" + string(argument0) + "_gamepad", "down", code_gamepad[1]);
	    ini_write_real("p" + string(argument0) + "_gamepad", "left", code_gamepad[2]);
	    ini_write_real("p" + string(argument0) + "_gamepad", "right", code_gamepad[3]);
	    ini_write_real("p" + string(argument0) + "_gamepad", "a", code_gamepad[4]);
	    ini_write_real("p" + string(argument0) + "_gamepad", "b", code_gamepad[5]);
	    ini_write_real("p" + string(argument0) + "_gamepad", "c", code_gamepad[6]);
	    ini_write_real("p" + string(argument0) + "_gamepad", "x", code_gamepad[7]);
	    ini_write_real("p" + string(argument0) + "_gamepad", "y", code_gamepad[8]);
	    ini_write_real("p" + string(argument0) + "_gamepad", "z", code_gamepad[9]);
	    ini_write_real("p" + string(argument0) + "_gamepad", "start", code_gamepad[10]);
	    ini_write_real("p" + string(argument0) + "_gamepad", "select", code_gamepad[11]);
	}
	ini_close();




}
