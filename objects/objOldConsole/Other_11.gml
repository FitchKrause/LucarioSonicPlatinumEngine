/// @description  Activate

// Create background
//var sw = surface_get_width(rendering_game_id);
//var sh = surface_get_height(rendering_game_id);
//con_surf = surface_create(sw,sh);
//surface_copy(con_surf,0,0,rendering_game_id);
/*
// Deactivate everything
instance_deactivate_all(true);
    
// Reset
keyboard_lastkey = -1;
keyboard_lastchar = "";

// Reposition text cursor
cursor_drag = true;
cursor_pos1 = string_find_position_x(value, x+padding, mouse_x+scroll, 0);
cursor_pos2 = cursor_pos1;

// Reset flashing
cursor_flash_alarm = cursor_flash_sp;
cursor_flash = 1;

// Show console
con_visible = true;

