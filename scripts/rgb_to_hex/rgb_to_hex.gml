/// @description  rgb_to_hex(Red, Green, Blue)
/// @param Red
/// @param  Green
/// @param  Blue
function rgb_to_hex(argument0, argument1, argument2) {


	var str = "ABCDEF"    // Hex Character string

	var r = argument0;
	var g = argument1;
	var b = argument2;

	var rx = floor(r / 16);
	if (rx > 9) {
	    var rxd = string_char_at(str, rx - 9);
	} else {
	    var rxd = string(rx);
	}
	var ry = r mod 16;
	if (ry > 9) {
	    var ryd = string_char_at(str, ry - 9);
	} else {
	    var ryd = string(ry);
	}
	var gx = floor(g / 16);
	if (gx > 9) {
	    var gxd = string_char_at(str, gx - 9);
	} else {
	    var gxd = string(gx);
	}
	var gy = g mod 16;
	if (gy > 9) {
	    var gyd = string_char_at(str, gy - 9);
	} else {
	    var gyd = string(gy);
	}
	var bx = floor(b / 16)
	if (bx > 9) {
	    var bxd = string_char_at(str, bx - 9);
	} else {
	    var bxd = string(bx);
	}
	var by = b mod 16;
	if (bx > 9) {
	    var byd = string_char_at(str, by - 9);
	} else {
	    var byd = string(by);
	}

	// Create the hex string
	var hexstring = "\\#" + rxd + ryd + gxd + gyd + bxd + byd;

	// Return the hex string
	return hexstring;



}
