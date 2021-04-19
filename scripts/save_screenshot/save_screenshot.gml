/// @description  save_screenshot(name, folder)
/// @param name
/// @param  folder
function save_screenshot() {
	//
	//  Saves a successively numbered screenshot within the working
	//  directory. Returns true on success, false otherwise.
	//
	//      name        prefix to assign screenshots, string
	//      folder      subfolder to save to (eg. "screens\"), string
	//
	/// GMLscripts.com/license
	{
	    var i, fname, fname_save;
	    i = 0;
    
	    // If there is a file with the current name and number,
	    // advance counter and keep looking:
	    do 
	    {
	        fname = working_directory + "\\" + argument[1] + argument[0] + string_real_character(string(i), 4, 0) + ".png";
	        fname_save = argument[0] + string_real_character(string(i), 4, 0) + ".png";
	        i += 1;
	    }
	    until (!file_exists(fname))
    
	    // Once we've got a unused number we'll save the screenshot under it:
	    screen_save(fname);
	    return fname_save;
	}



}
