function str_to_ascii(argument0) {
	   //call by: str_to_ascii(str);
	   var str , tmp , ascii , pos;
	   str = string( argument0 );
	   ascii = "";
	   pos = 1;
   
	   repeat( string_length( str ) ) {
	      tmp = string( ord( string_char_at( str , pos ) ) );
	      if ( real( tmp ) < 100 ) { tmp = "0" + tmp; }
	      ascii += tmp;
	      pos += 1;
	   }
   
	   return ascii;




}
