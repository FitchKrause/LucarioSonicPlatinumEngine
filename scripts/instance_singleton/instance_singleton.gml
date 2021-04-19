/// @description  instance_singleton(object)
/// @param object
function instance_singleton(argument0) {
	//
	//  Returns a single instance of the given object, 
	//  creating one if no instance exists.
	//
	//      object      object to look for, real
	//
	/// GMLscripts.com/license
	{
	    var obj = argument0;
	    if (instance_number(obj) == 0) { return instance_create_depth(0, 0, 0, obj); }
	    return instance_find(obj, 0);
	}



}
