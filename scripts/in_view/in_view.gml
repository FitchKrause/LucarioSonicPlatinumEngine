/// @description  in_view(view, offset)
/// @param view
/// @param  offset
function in_view()
{
	/*
	Checks if the calling instance's coordinates lie within the given view.

	> view: view id to evaluate
	> offset: pixel extension to both the width and height of the view size.

	< return value: boolean; whether the calling instance's coordinates are in the given view or not
	*/

	return (((x >= camera_get_view_x(argument[0])) - argument[1]) and ((y >= camera_get_view_y(argument[0])) - argument[1])) and
	(((x < camera_get_view_x(argument[0])) + (camera_get_view_width(argument[0]) + argument[1])) and ((y < camera_get_view_y(argument[0])) + (camera_get_view_height(argument[0]) + argument[1])));
}