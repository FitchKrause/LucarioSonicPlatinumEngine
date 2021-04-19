/// @description  vigenere_ascii(string, key, mode <0 - Decipher | 1 - Encipher>)
/// @param string
/// @param  key
/// @param  mode <0 - Decipher | 1 - Encipher>
function vigenere_ascii()
{
	var in = string(argument[0]);
	var key = argument[1];
	var mode = argument[2];
	var out = "";
	var inLen = string_length(in);
	var keyLen = string_length(key);
	var loVal = 32;
	var hiVal = 126;
	var span = (hiVal - loVal) + 1;
	for (var pos = 0; pos < inLen; pos += 1)
	{
	    var inChar = string_char_at(in, pos + 1);
	    var keyChar = string_char_at(key, (pos mod keyLen) + 1);
	    var inVal = min(max(loVal, ord(inChar)), hiVal) - loVal;
	    var keyVal = min(max(loVal, ord(keyChar)), hiVal) - loVal;
	    if mode { var outVal = ((inVal + keyVal) mod span) + loVal; } else { var outVal = ((span + inVal - keyVal) mod span) + loVal; }
	    var outChar = chr(outVal);
	    out = out + outChar;
	}
	return out;
}
