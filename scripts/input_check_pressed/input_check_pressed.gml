/// @description  input_check_pressed(port, code)
/// @param port
/// @param  code
function input_check_pressed(argument0, argument1) {
	/*
	Checks if the given control code was just triggered this frame on the given controller.
	(ie. the button was just pressed this frame)

	> port: id of the controller to check
	> code: control code to evaluate

	< return value: boolean; whether the control code was triggered or not, or -1 if the
	                controller does not exist.
	*/

	with objGame
	{
	    if controller[argument0] < 0 return -1;
	    return (controller[argument0].state_press & argument1) > 0;
	}



}
