/// @description  rgb_to_gm_hsv(Red, Green, Blue)
/// @param Red
/// @param  Green
/// @param  Blue
function rgb_to_gm_hsv(argument0, argument1, argument2) {

	var var_R = ( argument0 / 255 );                     //RGB from 0 to 255
	var var_G = ( argument1 / 255 );
	var var_B = ( argument2 / 255 );

	var var_Min = min( var_R, var_G, var_B );    //Min. value of RGB
	var var_Max = max( var_R, var_G, var_B );    //Max. value of RGB
	var del_Max = var_Max - var_Min;             //Delta RGB value 

	var V = var_Max

	if ( del_Max == 0 ){
	   var H = 0;
	   var S = 0;
	} else {
	   S = del_Max / var_Max;

	   del_R = ( ( ( var_Max - var_R ) / 6 ) + ( del_Max / 2 ) ) / del_Max;
	   del_G = ( ( ( var_Max - var_G ) / 6 ) + ( del_Max / 2 ) ) / del_Max;
	   del_B = ( ( ( var_Max - var_B ) / 6 ) + ( del_Max / 2 ) ) / del_Max;

	   if ( var_R == var_Max ) H = del_B - del_G;
	   else if ( var_G == var_Max ) H = ( 1 / 3 ) + del_R - del_B;
	   else if ( var_B == var_Max ) H = ( 2 / 3 ) + del_G - del_R;

	   if ( H < 0 ) H += 1;
	   if ( H > 1 ) H -= 1;
	}

	// Create the HSV array
	hsv[0] = floor(H * 255);
	hsv[1] = floor(S * 255);
	hsv[2] = floor(V * 255);

	// return the HSV array
	return hsv;



}
