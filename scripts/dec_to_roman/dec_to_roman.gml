/// @description  dec_to_roman(num) 
/// @param num
function dec_to_roman(argument0) {
	//
	//  Returns a string of Roman numerals representing the given integer.
	//
	//      num         positive integer less than 5000, real
	//
	/// GMLscripts.com/license

	var roman;

	if ((argument0 < 1) or (argument0 > 4999)) { return ""; }

	roman = string_copy("    M   MM  MMM MMMM", 4 * (argument0 div 1000) + 1, 4);
	roman += string_copy("    C   CC  CCC CD  D   DC  DCC DCCCCM  ", 4 * ((argument0 mod 1000) div 100) + 1, 4);
	roman += string_copy("    X   XX  XXX XL  L   LX  LXX LXXXXC  ", 4 * ((argument0 mod 100) div 10) + 1, 4);
	roman += string_copy("    I   II  III IV  V   VI  VII VIIIIX  ", 4 * (argument0 mod 10) + 1, 4);

	roman = string_replace_all(roman, " ", "");

	return roman;



}
