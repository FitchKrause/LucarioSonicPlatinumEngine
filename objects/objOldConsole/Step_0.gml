/// @description  Activation
/*
// Toggle console
if (keyboard_check_pressed(con_key)) {
    if con_visible {event_perform(ev_other, ev_user2); } else { event_perform(ev_other, ev_user1); }
}

// Abort if console not active
if not con_visible { exit; }

// Update surface
if not surface_exists(surf) { surf = surface_create(width - (padding * 2), height - (padding * 2)); }

// Activate
if (mouse_area_pressed(x,y,x+width,y+height,mb_left)) {
    
    // Single or double click?
    if (db_timer = -1) {
    
        // Single click
        db_timer = db_delay;
        db_click_x = mouse_x;
    
    } else {
    
        // Double click
        var pos = string_find_word_endpoints(value, cursor_pos1);
        cursor_pos1 = pos[0];
        cursor_pos2 = pos[1];
        
        // No drag
        cursor_drag = false;
        
        // Reset
        db_timer = -1;
        
    }
    
} else {

    // Deactivate
    if mouse_check_button_pressed(mb_left) {
    
        // Deactivate event
        event_perform(ev_other,ev_user2);
    
    }

}

// Highlighting
if cursor_drag and mouse_check_button_pressed(mb_left) { cursor_pos2 = string_find_position_x(value, x + padding, mouse_x + scroll, 0); }
else { cursor_drag = false; }

// Update double click timer
if (db_timer > -1) then db_timer --;
if (db_click_x != mouse_x) then db_timer = -1;

// Update cursor
cursor_flash_alarm --;

if (cursor_flash_alarm = 0) {

    cursor_flash = !cursor_flash;
    cursor_flash_alarm = cursor_flash_sp;

}

/// Keyboard

// Detect highlighting
var sel = (cursor_pos1 != cursor_pos2);

// If textbox active
if (active) {

    // Check pressed key valid
    if (keyboard_lastkey != -1 &&
    keyboard_lastkey != vk_enter &&
    keyboard_lastkey != ord("#")) {
    
        // Check CTRL or Shift key pressed
        var modkey = keyboard_check(vk_shift)-keyboard_check(vk_control);
        
        if (!keyboard_check(vk_shift) &&
        !keyboard_check(vk_control)) then modkey = -2;
        
        // Find which key pressed
        switch (keyboard_lastkey) {
        
            // Home
            case vk_home:
            
                    // Send cursor to start
                    cursor_pos1 = 0;
                    //cursor_pos2 = cursor_pos;
                   
                    // Reset cursor flash
                    cursor_flash_alarm = cursor_flash_sp;
                    cursor_flash = 1;
            
                break;
                
            // End
            case vk_end:
            
                    // Send cursor to end of string
                    cursor_pos1 = string_length(value);
                    //cursor_pos2 = cursor_pos;
    
                    // Reset cursor flash
                    cursor_flash_alarm = cursor_flash_sp;
                    cursor_flash = 1;
            
                break;
                
            // Left arrow
            case vk_left:
                    
                    // If highlighted and no modifier key pressed
                    if (sel && modkey = -2) {
                    
                        var minpos = min(cursor_pos1,cursor_pos2);
                        cursor_pos1 = minpos;
                        cursor_pos2 = minpos;
                    
                    } else {
                    
                        // One space or to start of word?
                        if (modkey = -1) {
                        
                            var pos = string_find_word_endpoints(value, cursor_pos1);
                            var newpos = pos[0];
                        
                        } else {
                        
                            var newpos = clamp(cursor_pos2-1, 0, string_length(value));
                        
                        }
                        
                        // Move cursor
                        cursor_pos2 = newpos;
                        if (modkey != 1) {
                            cursor_pos1 = cursor_pos2;
                        }
                    
                    }
                    
                    // Reset flashing
                    cursor_flash_alarm = cursor_flash_sp;
                    cursor_flash = 1;
            
                break;
                
            // Right arrow
            case vk_right:
                    
                    // If highlighted and no modifier key pressed
                    if (sel && modkey = -2) {
                    
                        var maxpos = max(cursor_pos1,cursor_pos2);
                        cursor_pos1 = maxpos;
                        cursor_pos2 = maxpos;
                        
                    } else {
                    
                        // One space or to end of word?
                        if (modkey = -1) {
                        
                            var pos = string_find_word_endpoints(value, cursor_pos1);
                            var newpos = pos[1];
                        
                        } else {
                        
                            var newpos = clamp(cursor_pos2+1, 0, string_length(value));
                        
                        }
                        
                        // Move cursor
                        cursor_pos2 = newpos;
                        if (modkey != 1) {
                        
                            cursor_pos1 = cursor_pos2;
                            
                        }
                    
                    }
                    
                    // Reset flashing
                    cursor_flash_alarm = cursor_flash_sp;
                    cursor_flash = 1;
            
                break;
                
            // Backspace
            case vk_backspace:
            
                    // Delete highlighted text
                    if (sel) {
                    
                        event_perform(ev_other,ev_user3);
                        
                    } else {
                    
                        if (modkey = -1) {
                        
                            // Find start of word
                            var pos = string_find_word_endpoints(value, cursor_pos2);
                            
                            // Delete word
                            value = string_delete(value, pos[0], cursor_pos2-pos[0]);
                            cursor_pos1 = pos[0];
                            cursor_pos2 = cursor_pos1;
                        
                        } else {
                        
                            // Delete single character
                            value = string_delete(value, cursor_pos1, 1);
                            cursor_pos1 -= 1;
                            cursor_pos2 = cursor_pos1;
                            
                        }
                    
                    }
                    
                    // Reset flashing
                    cursor_flash_alarm = cursor_flash_sp;
                    cursor_flash = 1;
                    
                    // History
                    if (history_enabled) {
                    
                        ds_stack_push(undo,value);
                        ds_stack_clear(redo);
                    
                    }
            
                break;
              
            // Delete  
            case vk_delete:
            
                    // Delete highlighted text
                    if (sel) {
                    
                        event_perform(ev_other,ev_user3);
                        
                    } else {
                    
                        if (modkey = -1) {
                        
                            // End of word
                            var pos = string_find_word_endpoints(value, cursor_pos2);
                            
                            // Delete word
                            value = string_delete(value, cursor_pos2, pos[1]-cursor_pos2);
                            cursor_pos1 = pos[1];
                            cursor_pos2 = cursor_pos1;
                        
                        } else {
                        
                            // Delete single character
                            value = string_delete(value, cursor_pos1+1, 1);
                        
                        }
                    
                    }
                    
                    // Reset
                    cursor_flash_alarm = cursor_flash_sp;
                    cursor_flash = 1;
                    chk = 1;
                    
                    // History
                    if (history_enabled) {
                    
                        ds_stack_push(undo, value);
                        ds_stack_clear(redo);
                    
                    }
            
                break;
                
            // Character keys
            default:
            
                    // Check
                    var chk = 0;
                    
                    // Shortcut keys
                    if (modkey = -1) {
                    
                        // Select all
                        if (keyboard_lastkey = ord("A")) {
                        
                            // Highlight text
                            cursor_pos1 = 0;
                            cursor_pos2 = string_length(value);
                            
                            // History
                            if (history_enabled) {
                            
                                ds_stack_push(undo,value);
                                ds_stack_clear(redo);
                            
                            }
                            
                            // Checked
                            chk = 1;
                        
                        }
                        
                        // Clipboard functions
                        if (clipboard_enabled) {
                        
                            // Copy
                            if (keyboard_lastkey = ord("C")) {
                            
                                // If text highlighted
                                if (sel) {
                                
                                    // Add to clipboard
                                    var minpos = min(cursor_pos1, cursor_pos2);
                                    var maxpos = max(cursor_pos1, cursor_pos2);
                                    var seltxt = string_copy(value, minpos+1, maxpos-minpos);
                                    clipboard_set_text(seltxt);
                                
                                }
                                
                                // Reset flashing
                                cursor_flash_alarm = cursor_flash_sp;
                                cursor_flash = 1;
                                
                                // Checked
                                chk = 1;
                            
                            }
                            
                            // Paste
                            if (keyboard_lastkey = ord("V")) {
                            
                                // If clipboard holds text
                                if (clipboard_has_text()) {
                                
                                    // If text highlighted then replace
                                    if (sel) {
                                    
                                        event_perform(ev_other,ev_user3);
                                    
                                    }
                                    
                                    // Add text from clipboard
                                    var clptxt = clipboard_get_text();
                                    value = string_insert(clptxt, value, cursor_pos1+1);
                                    cursor_pos1 += string_length(clptxt);
                                    cursor_pos2 = cursor_pos1;
                                    
                                    // History
                                    if (history_enabled) {
                                        
                                        ds_stack_push(undo,value);
                                        ds_stack_clear(redo);
                                    
                                    }
                                    
                                    // Reset flashing
                                    cursor_flash_alarm = cursor_flash_sp;
                                    cursor_flash = 1;
                                    
                                    // Checked
                                    chk = 1;
                                
                                }
                            
                            }
                            
                            // Cut
                            if (keyboard_lastkey = ord("X")) {
                            
                                // If text is highlighted
                                if (sel) {
                                
                                    // Add to clipboard
                                    var minpos = min(cursor_pos1, cursor_pos2);
                                    var maxpos = max(cursor_pos1, cursor_pos2);
                                    var seltxt = string_copy(value, minpos+1, maxpos-minpos);
                                    clipboard_set_text(seltxt);
                                    
                                    // Delete highlighted
                                    event_perform(ev_other,ev_user3);
                                    
                                    // History
                                    if (history_enabled) {
                                        
                                        ds_stack_push(undo,value);
                                        ds_stack_clear(redo);
                                    
                                    }
                                    
                                    // Reset flashing
                                    cursor_flash_alarm = cursor_flash_sp;
                                    cursor_flash = 1;
                                    
                                    // Checked
                                    chk = 1;
                                
                                }
                            
                            }
                        
                        } else if !history_enabled then exit; // Clipboard
                        
                        // History
                        if (history_enabled) {
                        
                            // Undo
                            if (keyboard_lastkey = ord("Z")) {
                            
                                // If there is enough history
                                if (ds_stack_size(undo) > 1) {
                                
                                    // Update history
                                    var t1 = ds_stack_top(undo);
                                    ds_stack_push(redo, t1);
                                    
                                    ds_stack_pop(undo);
                                    t2 = ds_stack_top(undo);
                                    
                                    // Use value from history
                                    value = t2;
                                    
                                    // Reset flashing
                                    cursor_flash_alarm = cursor_flash_sp;
                                    cursor_flash = 1;
                                    
                                    // Checked
                                    chk = 1;
                                
                                }
                            
                            }
                            
                            // Redo
                            if (keyboard_lastkey = ord("Y")) {
                            
                                // If there is enough history
                                if (ds_stack_size(redo) > 1) {
                                
                                    // Update history
                                    var t = ds_stack_pop(redo);
                                    ds_stack_push(undo, t);
                                    
                                    // Set text
                                    value = t;
                                    
                                    // Checked
                                    chk = 1;
                                
                                }
                            
                            }
                            
                        } else exit; // History
                        
                    } // Shortcut keys
                    
                    // Typing
                    if (chk != 1) {
                    
                        // If there is text to place
                        if (string_length(keyboard_lastchar) != 0) {
                        
                            // Delete if highlighted
                            if (sel) then event_perform(ev_other,ev_user3);
                            
                            // Add last pressed character
                            value = string_insert(keyboard_lastchar, value, cursor_pos1+1);
                            cursor_pos1 += 1;
                            cursor_pos2 = cursor_pos1;
                            
                            // History
                            if (history_enabled) {
                                ds_stack_push(undo,value);
                                ds_stack_clear(redo);
                            }
                            
                            // Reset cursor
                            cursor_flash_alarm = cursor_flash_sp;
                            cursor_flash = 1;
                        
                        }
                    
                    }
            
                break;
        
        } // Keyboard lastchar
        
        // Reset for next step
        keyboard_lastkey = -1;
        keyboard_lastchar = "";
    
    }

}

/// Scrolling

var txtw = string_width(((value)); // String width
var boxw = (width-(padding*2)); // Box width

// If string wider than text box
if (txtw > boxw) {

    scroll_max = txtw - boxw;

} else {

    scroll_max = 0;
    scroll = 0;

}

// Scroll along with selection
if (scroll_max != 0) {

    // Get X of secondary cursor
    var curx = (x+padding)+string_width(((string_copy(value, 0, cursor_pos2)))-scroll;
    
    // Text bounding box size
    var x1 = x + padding;
    var x2 = (x + width) - padding;
    
    // Scroll left
    if (curx < x1) then scroll -= x1-curx;
    
    // Scroll right
    if (curx > x2) then scroll += curx-x2;
    
    // Limit scrolling
    scroll = clamp(scroll, 0, scroll_max);
    
}

/// Error Checking

//remove any new lines
//value = string_replace_all(value, "", "");
value = string_replace_all(value, "#", "");
value = string_replace_all(value, chr(13) + chr(10), "");
value = string_replace_all(value, chr(13), "");
value = string_replace_all(value, chr(15), "");
value = string_replace_all(value, chr(10), "");

//correct cursor
cursor_pos1 = clamp(cursor_pos1, 0, string_length(value)); 
cursor_pos2 = clamp(cursor_pos2, 0, string_length(value));

// Clear history if too much
if (history_enabled) {

    if ((ds_stack_size(undo) > 30) || 
    (ds_stack_size(redo) > 30)) {
    
        ds_stack_clear(undo);
        ds_stack_clear(redo);
        ds_stack_push(undo, value);
        
    }
    
}

/// Console

// User begins typing
if keyboard_check_pressed(vk_anykey) &&
!keyboard_check_pressed(vk_down) &&
!keyboard_check_pressed(vk_right) &&
string_count(con_sep,value) == 0 {

    // If something entered
    if (string_length(value) > 0) {

        // Clear suggestions list
        ds_list_clear(con_sug);
        
        // For each declared command
        for (var i=0; i<ds_list_size(con_cmds); i+=4) {
        
            // If user has permission to execute
            if (!con_cmds[| i+1]) || (con_cmds[| i+1] && con_admin) {
            
                // Get command
                var cmd = con_cmds[| i];
                
                // Check input matches command
                if string_copy(cmd,1,string_length(value)) == value {
                
                    // Add to suggestions list
                    ds_list_add(con_sug,i);
                
                }
            
            }
        
        }
        
    } else {
    
        // Clear suggestions list
        ds_list_clear(con_sug);
    
    }

}

// Scroll through suggestions
if (keyboard_check_pressed(vk_down) &&
ds_list_size(con_sug) > 0) {

    if (con_sug_sel < ds_list_size(con_sug)-1)
    then con_sug_sel ++ else con_sug_sel = 0;

}

// Select suggestion
if (keyboard_check_pressed(vk_right) &&
con_sug_sel > -1) {

    value = con_cmds[| con_sug[| con_sug_sel]];
    cursor_pos1 += string_length(value);
    cursor_pos2 = cursor_pos1;

}

// Last command
if (keyboard_check_pressed(vk_up) &&
con_cmd_last != "") {

    value = con_cmd_last;
    cursor_pos1 += string_length(value);
    cursor_pos2 = cursor_pos1;

}

// If command submitted
if (keyboard_check_pressed(vk_enter)) {
    
    // Input
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

