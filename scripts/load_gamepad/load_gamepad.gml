/// @description  load_gamepad(port)
/// @param port
function load_gamepad(argument0) {
	/*
	Assigns control codes to the given controller port from "settings.dat".
	If a control code is not found, a default value is assigned instead.

	> port: id of the controller to assign; can be 0 or 1

	< return value: n/a
	*/

	// get control codes
	ini_open(working_directory + "\\gamepad.ini");
	with objGame.controller[argument0]
	{
	    // gamepad
	    code_gamepad[0] = ini_read_real("p" + string(argument0) + "_gamepad", "up", objData.default_gamepad_up[argument0]);
	    code_gamepad[1] = ini_read_real("p" + string(argument0) + "_gamepad", "down", objData.default_gamepad_down[argument0]);
	    code_gamepad[2] = ini_read_real("p" + string(argument0) + "_gamepad", "left", objData.default_gamepad_left[argument0]);
	    code_gamepad[3] = ini_read_real("p" + string(argument0) + "_gamepad", "right", objData.default_gamepad_right[argument0]);
	    code_gamepad[4] = ini_read_real("p" + string(argument0) + "_gamepad", "a", objData.default_gamepad_a[argument0]);
	    code_gamepad[5] = ini_read_real("p" + string(argument0) + "_gamepad", "b", objData.default_gamepad_b[argument0]);
	    code_gamepad[6] = ini_read_real("p" + string(argument0) + "_gamepad", "c", objData.default_gamepad_c[argument0]);
	    code_gamepad[7] = ini_read_real("p" + string(argument0) + "_gamepad", "x", objData.default_gamepad_x[argument0]);
	    code_gamepad[8] = ini_read_real("p" + string(argument0) + "_gamepad", "y", objData.default_gamepad_y[argument0]);
	    code_gamepad[9] = ini_read_real("p" + string(argument0) + "_gamepad", "z", objData.default_gamepad_z[argument0]);
	    code_gamepad[10] = ini_read_real("p" + string(argument0) + "_gamepad", "start", objData.default_gamepad_start[argument0]);
	    code_gamepad[11] = ini_read_real("p" + string(argument0) + "_gamepad", "select", objData.default_gamepad_select[argument0]);
	}
	ini_close();




}
