/// @description  input_check_released(port, code)
/// @param port
/// @param  code
function input_check_released(argument0, argument1) {
	/*
	Checks if the given control code was just released this frame on the given controller.
	(ie. the button was just released this frame)

	> port: id of the controller to check
	> code: control code to evaluate

	< return value: boolean; whether the control code was released or not, or -1 if the
	                controller does not exist.
	*/

	with objGame
	{
	    if controller[argument0] < 0 return -1;
	    return (controller[argument0].state_release & argument1) > 0;
	}



}
