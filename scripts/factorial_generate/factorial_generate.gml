function factorial_generate(argument0) {
	   //factorial_generate(n)
	   var result , cache;
	   result = argument0;
	   cache = ds_list_create();
   
	   var i; i = 0;
	   repeat( argument0 + 1 ) {
	      if ( i > 1 ) {
	         ds_list_add( cache , i * ds_list_find_value( cache , i - 1 ) );
	      } else {
	         ds_list_add( cache , 1 );
	      }
      
	      i += 1;
	   }
   
	   return cache;




}
