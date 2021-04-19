/// @description  merge_color_squared(col1,col2,amount)
/// @param col1
/// @param col2
/// @param amount
function merge_colour_squared(argument0, argument1, argument2) {
	//
	//  Returns a color merged from two colors by a given amount,
	//  where color components are squared for a more natural mix.
	//  An amount value of 0 returns the first color (col1), a 
	//  value of 1 returns the second color (col2), and values 
	//  in-between return a mix of the two colors. 
	//
	//      col1        first color
	//      col2        second color
	//      amount      blend factor [0,1]
	//
	/// GMLscripts.com/license
	{
	    var amount = clamp(argument2, 0, 1);
	    var r = sqrt(lerp(sqr(colour_get_red(argument0)), sqr(colour_get_red(argument1)), amount));
	    var g = sqrt(lerp(sqr(colour_get_green(argument0)), sqr(colour_get_green(argument1)), amount));
	    var b = sqrt(lerp(sqr(colour_get_blue(argument0)), sqr(colour_get_blue(argument1)), amount));

	    return make_colour_rgb(r,g,b);
	}



}
