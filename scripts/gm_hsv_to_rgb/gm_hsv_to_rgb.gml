/// @description  hsv_to_rgb(Hue, Saturation, Value)
/// @param Hue
/// @param  Saturation
/// @param  Value
function gm_hsv_to_rgb(argument0, argument1, argument2) {

	// set the HSV numbers to 0-1
	H = argument0 / 255;
	S = argument1 / 255;
	V = argument2 / 255;

	if ( S == 0 ) {
	   R = V * 255;
	   G = V * 255;
	   B = V * 255;
	} else {
	   var_h = H * 6
	   if ( var_h == 6 ) var_h = 0
	   var_i = floor( var_h )
	   var_1 = V * ( 1 - S )
	   var_2 = V * ( 1 - S * ( var_h - var_i ) )
	   var_3 = V * ( 1 - S * ( 1 - ( var_h - var_i ) ) )

	   if ( var_i == 0 ) { var_r = V     ; var_g = var_3 ; var_b = var_1; }
	   else if ( var_i == 1 ) { var_r = var_2 ; var_g = V     ; var_b = var_1; }
	   else if ( var_i == 2 ) { var_r = var_1 ; var_g = V     ; var_b = var_3; }
	   else if ( var_i == 3 ) { var_r = var_1 ; var_g = var_2 ; var_b = V;     }
	   else if ( var_i == 4 ) { var_r = var_3 ; var_g = var_1 ; var_b = V;     }
	   else                   { var_r = V     ; var_g = var_1 ; var_b = var_2; }

	   R = var_r * 255;                  //RGB results from 0 to 255
	   G = var_g * 255;
	   B = var_b * 255;
	}

	// Create the RGB array
	rgb[0] = floor(R);
	rgb[1] = floor(G);
	rgb[2] = floor(B);

	// Return the RGB array
	return rgb;



}
