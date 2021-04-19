function ascii_to_str(argument0) {
	   //call by: ascii_to_str(str);
	   var ascii , tmp , str , pos;
	   ascii = string_digits( argument0 );
	   str = "";
	   tmp = "";
	   pos = 1;
   
	   do {
	      var n; n = 0;
	      repeat( 3 ) {
	         tmp += string( string_char_at( ascii , pos + n ) );
	         n += 1;
	      }
      
	      str += chr( real( tmp ) );
	      pos += 3;
	      tmp = "";
	   } until( pos >= string_length( ascii ) );
   
	   return str;




}
