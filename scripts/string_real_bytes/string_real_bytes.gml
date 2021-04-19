/// @description  string_real_bytes(real, decimals)
/// @param real
/// @param  decimals
function string_real_bytes(argument0, argument1) {

	/******************************************************
	Returns argument0 abbreviated with a B, KB, MB, GB

	Example 1024 B might become 1 KB

	Works up to YottaBytes
	Created by Lucario - The Pokémon Aura
	******************************************************/

	// Arguments
	var Rea = floor(real(argument0));
	var Dec = floor(real(argument1));

	// Temp
	var Add = "";
	var Div = 1;
	var Eva = 0;

	// YottaBytes
	if (Rea >= 1208925819614629174706176)
	{
	    Add = "YB";
	    Div = power(10, 21);
	}

	// ZettaBytes
	else if (Rea >= 1180591620717411303424)
	{
	    Add = "ZB";
	    Div = power(10, 19);
	}

	// ExaBytes
	else if (Rea >= 1152921504606846976)
	{
	    Add = "EB";
	    Div = power(10, 17);
	}

	// PettaBytes
	else if (Rea >= 1125899906842624)
	{
	    Add = "PB";
	    Div = power(10, 15);
	}

	// TerraBytes
	else if (Rea >= 1099511627776)
	{
	    Add = "TB";
	    Div = power(10, 12);
	}

	// GigaBytes
	else if (Rea >= 1073741824)
	{
	    Add = "GB";
	    Div = power(10, 9);
	}

	// MegaBytes
	else if (Rea >= 1048576)
	{
	    Add = "MB";
	    Div = power(10, 6);
	}

	// KiloBytes
	else if (Rea >= 1024)
	{
	    Add = "KB";
	    Div = power(10, 3);
	}

	// Bytes
	else
	{
	    Add = "B";
	    //Div = power(2, 1);
	}

	// Divide
	Rea /= Div;

	// Format
	Eva = string_format(Rea, string_length(string(Rea)), Dec);

	// Return string
	return string_remove_whitespace(string(Eva) + Add);



}
