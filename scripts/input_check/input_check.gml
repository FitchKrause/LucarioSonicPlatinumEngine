/// @description  input_check(port, code)
/// @param port
/// @param  code
function input_check(argument0, argument1) {
	/*
	Checks if the given control code is currently active on the given controller.
	(ie. the button is being held down)

	> port: id of the controller to check
	> code: control code to evaluate

	< return value: boolean; whether the control code is active or not, or -1
	                if the controller does not exist.
	*/

	with objGame
	{
	    if controller[argument0] < 0 return -1;
	    return (controller[argument0].state & argument1) > 0;
	}



}
