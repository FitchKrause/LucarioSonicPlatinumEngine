/// @description  Auto Execute
/*
/*
AUTOEXEC
This automatically executes commands in the
autoexec.txt file.
*/
/*
// Look for autoexec.txt
if (file_exists("autoexec.txt")) {

    // Read file
    var file = file_text_open_read("autoexec.txt");
    
    // For each line
    while (!file_text_eof(file)) {
    
        // Command & arguments
        value = file_text_readln(file);
        command = string_copy(value,1,string_pos(con_sep,value)-1);
        if (command != "") {
            value = string_delete(value,1,string_pos(con_sep,value));
            arg = string_explode_array(value,con_sep);
        } else {
            command = value;
            arg = undefined;
        }
        
        // Validate and execute
        event_perform(ev_other,ev_user4);
    
    }
    
}

/* */
/*  */
