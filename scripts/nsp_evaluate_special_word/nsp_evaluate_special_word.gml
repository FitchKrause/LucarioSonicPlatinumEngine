/// @description nsp_evaluate_special_word(String)
/// @param String
function nsp_evaluate_special_word(argument0) {
	/*
	Underlying NSP script.
	*/

	switch (argument0) begin

	 case "self":
	   return self;
	  break;
 
	 case "other":
	   return other;
	  break;
 
	 default:
	  break;

	end;




}
