/// @description nsp_grid_shift(Grid, Start, End)
/// @param Grid
/// @param  Start
/// @param  End
function nsp_grid_shift(argument0, argument1, argument2) {
	/*
	Underlying NSP script.
	NOTE: There will be some excess data at the end of the grid!
	*/

	ds_grid_set_grid_region(argument0,argument0,argument2+1,0,ds_grid_width(argument0)-1,1,argument1,0);



}
