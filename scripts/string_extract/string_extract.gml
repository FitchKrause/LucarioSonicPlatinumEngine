/// @description  string_extract(str, sep, ind)
/// @param str
/// @param  sep
/// @param  ind
function string_extract() {

	/***************************************************
	    example: string_extract("tree, stone, gras", ", ", 2);
	    return gras
	****************************************************/



	var s, se, i, l;
	s = argument[0];
	se = argument[1];
	i = argument[2];
	l = (string_length(se) - 1);

	repeat (i)
	{
	    s = string_delete(s, 1, string_pos(se, s) + l);
	}

	s = string_delete(s, string_pos(se, s), string_length(s));
	return s;



}
