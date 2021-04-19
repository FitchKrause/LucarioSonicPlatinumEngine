/// @description  Validate
/*
// Validation
var index = ds_list_find_index(con_cmds,command);
//var admin = con_cmds[| index+1];
var args = con_cmds[| index+2];
var typs = con_cmds[| index+3];

// Deactivate console
event_perform(ev_other,ev_user2);

// If command declared
if (index != -1) {

    // If there are arguments
    if (is_array(arg)) {
    
        // Check correct type of arguments
        if (array_length(arg) != array_length(args)) {
            show_debug_message("[CONSOLE] Not correct number of arguments for '"+command+"'");
            exit;
        }
        
        // Check type
        if (is_array(typs)) {
        
            // For each argument
            for(var a=0; a<array_length(arg); a++) {
            
                // Type
                switch(typs[a]) {
                
                    case "real": case "int": case "float":
                            if (!is_real(arg[a])) {
                                show_debug_message("[CONSOLE] '"+command+"["+arg[a]+"]' needs to be a real value.");
                                exit;
                            }
                        break;
                        
                    case "string":
                            if (!is_string(arg[a])) {
                                show_debug_message("[CONSOLE] '"+command+"["+string(arg[a])+"]' needs to be a string.");
                                exit;
                            }
                        break;
                
                }
            
            }
        
        }
        
    
    } else
    
    // If arguments expected and none sent
    if (is_array(args)) {
    
        show_debug_message("[CONSOLE] '"+command+"' expects arguments.");
        exit;
    
    }
    
    // Execute command
    show_debug_message("[CONSOLE] Executed command: "+command);
    event_perform(ev_other,ev_user0);
    con_cmd_last = command;
    
} else {

    show_debug_message("[CONSOLE] Unknown command.");

}

