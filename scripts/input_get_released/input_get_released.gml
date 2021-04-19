/// @description  input_get_released(port)
/// @param port
function input_get_released(argument0) {

	/*
	Get the input released state on the given controller.

	> port: id of the controller to get released state.

	< return value: bitwise or 0, if the controller does not exist.
	*/

	with objGame
	{
	    if (controller[argument0] < 0) return 0;
	    return (controller[argument0].state_release)
	}



}
