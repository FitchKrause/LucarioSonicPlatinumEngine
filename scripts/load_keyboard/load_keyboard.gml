/// @description  load_keyboard(port)
/// @param port
function load_keyboard() {
	/*
	Assigns control codes to the given controller port from "controls.ini".
	If a control code is not found, a default value is assigned instead.

	> port: id of the controller to assign; can be 0 or 1

	< return value: n/a
	*/

	// get control codes
	ini_open(working_directory + "\\keyboard.ini");
	with objGame.controller[argument[0]]
	{
	    // keyboard
	    code_keyboard[0] = ini_read_real("p" + string(argument0) + "_keyboard", "up", objData.default_keyboard_up[argument[0]]);
	    code_keyboard[1] = ini_read_real("p" + string(argument0) + "_keyboard", "down", objData.default_keyboard_down[argument[0]]);
	    code_keyboard[2] = ini_read_real("p" + string(argument0) + "_keyboard", "left", objData.default_keyboard_left[argument[0]]);
	    code_keyboard[3] = ini_read_real("p" + string(argument0) + "_keyboard", "right", objData.default_keyboard_right[argument[0]]);
	    code_keyboard[4] = ini_read_real("p" + string(argument0) + "_keyboard", "a", objData.default_keyboard_a[argument[0]]);
	    code_keyboard[5] = ini_read_real("p" + string(argument0) + "_keyboard", "b", objData.default_keyboard_b[argument[0]]);
	    code_keyboard[6] = ini_read_real("p" + string(argument0) + "_keyboard", "c", objData.default_keyboard_c[argument[0]]);
	    code_keyboard[7] = ini_read_real("p" + string(argument0) + "_keyboard", "x", objData.default_keyboard_x[argument[0]]);
	    code_keyboard[8] = ini_read_real("p" + string(argument0) + "_keyboard", "y", objData.default_keyboard_y[argument[0]]);
	    code_keyboard[9] = ini_read_real("p" + string(argument0) + "_keyboard", "z", objData.default_keyboard_z[argument[0]]);
	    code_keyboard[10] = ini_read_real("p" + string(argument0) + "_keyboard", "start", objData.default_keyboard_start[argument[0]]);
	    code_keyboard[11] = ini_read_real("p" + string(argument0) + "_keyboard", "select", objData.default_keyboard_select[argument[0]]);
	}
	ini_close();




}
