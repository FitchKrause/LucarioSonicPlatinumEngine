function clamp_circley(argument0, argument1, argument2, argument3, argument4) {
	   //call by: clamp_circley(x1,y1,x2,y2,r);
	   var point , yclamped;
	   point = point_direction( argument2 , argument3 , argument0 , argument1 );
	   yclamped = argument3 + lengthdir_y( argument4 , point );
	   return median( argument3 , argument1 , yclamped );




}
