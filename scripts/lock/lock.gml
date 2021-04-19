function lock(argument0, argument1, argument2) {
	   //call by: lock(val,min,max);
	   var cur_value, min_value, max_value;
	   min_value = argument0;
	   cur_value = argument1;
	   max_value = argument2;
	   return median( min_value , cur_value , max_value );




}
