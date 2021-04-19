/// @description  Initialize

// State
is_active = false;

// Input
input_text = "";

// Cursor
cursor_position = 0;
//cursor_selection1 = 0;
//cursor_selection2 = 0;

// Render
render_start = 0;
render_end = render_start + 14;

// Log
log_text = ds_list_create();

// Pop-out messages
message_text = ds_list_create();
message_timer = ds_list_create();

