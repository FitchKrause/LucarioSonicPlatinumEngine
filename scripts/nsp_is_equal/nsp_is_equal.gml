/// @description nsp_is_equal(val1, val2)
/// @param val1
/// @param val2
function nsp_is_equal(argument0, argument1)
{
	if ((is_string(argument0) + is_string(argument1)) <> 1) {return (argument0 == argument1); }
	return false;
}