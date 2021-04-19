/// @description  save_keyboard(port)
/// @param port
function save_keyboard() {
	/*
	Saves control codes from the given controller port to "keyboard.ini".

	> port: id of the controller to save from; can be 0 or 1

	< return value: n/a
	*/

	// save control codes
	ini_open(working_directory + "\\keyboard.ini");

	with objGame.controller[argument[0]]
	{
	    // keyboard
	    ini_write_real("p" + string(argument[0]) + "_keyboard", "up", code_keyboard[0]);
	    ini_write_real("p" + string(argument[0]) + "_keyboard", "down", code_keyboard[1]);
	    ini_write_real("p" + string(argument[0]) + "_keyboard", "left", code_keyboard[2]);
	    ini_write_real("p" + string(argument[0]) + "_keyboard", "right", code_keyboard[3]);
	    ini_write_real("p" + string(argument[0]) + "_keyboard", "a", code_keyboard[4]);
	    ini_write_real("p" + string(argument[0]) + "_keyboard", "b", code_keyboard[5]);
	    ini_write_real("p" + string(argument[0]) + "_keyboard", "c", code_keyboard[6]);
	    ini_write_real("p" + string(argument[0]) + "_keyboard", "x", code_keyboard[7]);
	    ini_write_real("p" + string(argument[0]) + "_keyboard", "y", code_keyboard[8]);
	    ini_write_real("p" + string(argument[0]) + "_keyboard", "z", code_keyboard[9]);
	    ini_write_real("p" + string(argument[0]) + "_keyboard", "start", code_keyboard[10]);
	    ini_write_real("p" + string(argument[0]) + "_keyboard", "select", code_keyboard[11]);
	}
	ini_close();




}
