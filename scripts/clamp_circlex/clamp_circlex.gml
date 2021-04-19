function clamp_circlex(argument0, argument1, argument2, argument3, argument4) {
	   //call by: clamp_circlex(x1,y1,x2,y2,r);
	   var point , xclamped;
	   point = point_direction( argument2 , argument3 , argument0 , argument1 );
	   xclamped = argument2 + lengthdir_x( argument4 , point );
	   return median( argument2 , argument0 , xclamped );




}
