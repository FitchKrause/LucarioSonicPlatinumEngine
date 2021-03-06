/// @description  string_keycode(number);
/// @param number
function string_keycode() {

	/***************************************************
	  Converts the given keycode into a string.
  
	  > keycode: The keycode number to convert
  
	  < return value: The converted keycode as string.
	****************************************************/

	switch (argument[0])
	{
	    case vk_left: return "Left arrow"; break;
	    case vk_right: return "Right arrow"; break;
	    case vk_up: return "Up arrow"; break;
	    case vk_down: return "Down arrow"; break;
	    case vk_enter: return "Enter"; break;
	    case vk_escape: return "Escape"; break;
	    case vk_space: return "Space"; break;
	    case vk_shift: return "Shift"; break;
	    case vk_control: return "Control"; break;
	    case vk_alt: return "Alt"; break;
	    case vk_backspace: return "Backspace"; break;
	    case vk_tab: return "Tab"; break;
	    case vk_home: return "Home"; break;
	    case vk_end: return "End"; break;
	    case vk_delete: return "Delete"; break;
	    case vk_insert: return "Insert"; break;
	    case vk_pageup: return "Page Up"; break;
	    case vk_pagedown: return "Page Down"; break;
	    case vk_pause: return "Pause"; break;
	    case vk_printscreen: return "Printscreen"; break;
	    case vk_f1: return "F1"; break;
	    case vk_f2: return "F2"; break;
	    case vk_f3: return "F3"; break;
	    case vk_f4: return "F4"; break;
	    case vk_f5: return "F5"; break;
	    case vk_f6: return "F6"; break;
	    case vk_f7: return "F7"; break;
	    case vk_f8: return "F8"; break;
	    case vk_f9: return "F9"; break;
	    case vk_f10: return "F10"; break;
	    case vk_f11: return "F11"; break;
	    case vk_f12: return "F12"; break;
	    case vk_numpad0: return "Numpad 0"; break;
	    case vk_numpad1: return "Numpad 1"; break;
	    case vk_numpad2: return "Numpad 2"; break;
	    case vk_numpad3: return "Numpad 3"; break;
	    case vk_numpad4: return "Numpad 4"; break;
	    case vk_numpad5: return "Numpad 5"; break;
	    case vk_numpad6: return "Numpad 6"; break;
	    case vk_numpad7: return "Numpad 7"; break;
	    case vk_numpad8: return "Numpad 8"; break;
	    case vk_numpad9: return "Numpad 9"; break;
	    case vk_multiply: return "Numpad Multiply"; break;
	    case vk_divide: return "Numpad Divide"; break;
	    case vk_add: return "Numpad Add"; break;
	    case vk_subtract: return "Numpad Subtract"; break;
	    case vk_decimal: return "Numpad Decimal"; break;
    
	    default: return chr(argument0); break;
	}



}
