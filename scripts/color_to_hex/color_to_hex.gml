/// @description  color_to_hex(color)
/// @param color
function color_to_hex(argument0) {
	//
	//  Returns a given color as a hexadecimal string in RRGGBB format.
	//  Depends on dec_to_hex().
	//
	//      color       RGB color, real
	//
	/// GMLscripts.com/license
	{
	    var color,dec;
	    color = argument0;
	    dec = (color & 16711680) >> 16 | (color & 65280) | (color & 255) << 16;
	    return dec_to_hex(dec);
	}




}
