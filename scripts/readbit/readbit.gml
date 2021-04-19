function readbit(argument0, argument1) {
	   //call by: readbit(byte,bit);
	   return ( argument0 & power( 2 , 7 - argument1 ) ) > 0;




}
