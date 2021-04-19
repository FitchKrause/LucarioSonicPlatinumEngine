/// @description  Input

if keyboard_check_pressed(vk_f12) { is_active = not is_active; }
if is_active
{
    if (keyboard_lastkey <> -1) and (keyboard_lastkey <> vk_enter)
    {
        //var keymodifier = keyboard_check(vk_shift) - keyboard_check(vk_control);
        //if not keyboard_check(vk_shift) and not keyboard_check(vk_control) { modkey = -2; }
        switch keyboard_lastkey
        {
            case vk_home: // Cursor to start
            {
                cursor_position = 0;
                break;
            }
            
            case vk_end: // Cursor to end
            {
                cursor_position = string_length(input_text);
                break;
            }
            
            case vk_backspace: // Remove
            {
                input_text = string_delete(input_text, cursor_position, 1);
                cursor_position -= 1;
                break;
            }
            
            case vk_delete: // Delete
            {
                input_text = string_delete(input_text, cursor_position + 1, 1);
                break;
            }
            
            default:
            {
                var check = 0;
                // modifers here soon...
                
                if not check
                {
                    if (string_length(keyboard_lastchar) <> 0)
                    {
                        input_text = string_insert(keyboard_lastchar, input_text, cursor_position + 1);
                        cursor_position += 1;
                    }
                }
                break;
            }
        }
        keyboard_lastkey = -1;
        keyboard_lastchar = "";
    }
}
input_text = string_replace_all(input_text, "#", "");
input_text = string_replace_all(input_text, chr(13) + chr(10), "");
input_text = string_replace_all(input_text, chr(13), "");
input_text = string_replace_all(input_text, chr(15), "");
input_text = string_replace_all(input_text, chr(10), "");
cursor_position = clamp(cursor_position, 0, string_length(input_text)); 

if keyboard_check_pressed(vk_pageup) and not (render_start > ((ds_list_size(log_text) - 1) - 14)) { render_start += 1; }
if keyboard_check_pressed(vk_pagedown) and not (render_start < 1) { render_start -= 1; }

/// Logic

render_end = render_start + 14;

