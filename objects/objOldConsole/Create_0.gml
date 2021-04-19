/// @description  Console
/*
// Configuration
con_key = vk_f12; // The key for toggling the console
con_visible = false; // Hidden by default
con_sep = ";"; // Seperator for command and arguments
con_admin = true; // Whether user can execute admin commands
autoexec = true; // Perform commands in local 'autoexec.cfg' script.
con_dim = 0.5; // How much to dim background when console visible.

con_sug_enabled = true; // Display command suggestions
//con_sug_margin = 0; // Margin between textbox and suggestions
//con_sug_limit = 10; // Maximum number of suggestions to show
con_sug_pad = 8; // Padding for suggestions box
con_sug_bg_c = c_white; // Suggestions background color
con_sug_sel_c = make_color_rgb(234, 236, 239); // Highlighted suggestion background color
con_sug_cmd_c = c_black; // Suggested command text color
con_sug_arg_c = c_gray; // Suggested argument text color
con_sug_typ_c = make_color_rgb(152, 188, 249); // Suggested argument type text color

// Init
con_cmds = ds_list_create(); // Holds all declared commands
con_sug = ds_list_create(); // Holds suggested commands
con_cmd_last = ""; // Last command entered
con_sug_sel = -1; // Highlighted suggestion
con_surf = noone; // Background surface for console
if autoexec then alarm[0] = 10; // Auto execute

/// Textbox

// Features
history_enabled = true; // Undo / Redo enabled?
//clipboard_enabled = true; // Cut/Copy/Paste enabled?

// Attributes
active = true; // Whether input field is active
value = ""; // The textbox value
//maxlength = 100; // Max number of characters
//gui = false; // Draw in GUI event

// Font
//fnt = fnt_open_sans_16; // Font
fnt_c = c_black; // Font color
fnt_a = 1; // Font alpha

// Textbox Appearance
textbox_x = 20; // X position for textbox
textbox_y = 20; // Y position for textbox

fill_c = c_white; // Background color
fill_a = 1; // Background alpha

border_c = c_white; // Border color
border_a = 1; // Border alpha
border_w = 1; // Border width

active_c = c_white; // Active border color
active_a = 1; // Active border alpha
active_w = 2; // Active border width

// Highlighting
select_bg_c = c_black; // Highlighted bg color
select_bg_a = 1; // Highlighted bg alpha
select_fnt_c = c_white; // Highlighted text color
select_fnt_a = 1; // Highlighted text alpha

// Dimensions
//draw_set_font(fnt); // Font size
padding = 8; // Text padding
width = 600; // Textbox width
height = string_height("Wp")+(padding*2); // Textbox height

// Cursor
cursor_c = c_black; // Cursor color
cursor_a = 1; // Cursor alpha
cursor_w = 2; // Cursor width

cursor_flash_sp = 24; // Cursor flash speed
cursor_flash_alarm = cursor_flash_sp; // Reset flash timer
cursor_flash = 0; // Cursor visible
cursor_pos1 = string_length(value); // First cursor position
cursor_pos2 = string_length(value); // Second cursor position
cursor_drag = false; // Cursor can drag

// Double clicking
db_delay = 20; // Time distance between clicks
db_timer = -1; // Timer
db_click_x = mouse_x; // Double click X position

// Scrolling
scroll = 0; // Current scroll level
//scroll_max = 0; // Max scroll level

// Undo / Redo
undo = ds_stack_create(); // Undo list
redo = ds_stack_create(); // Redo list
ds_stack_push(undo,value);

// Surface
surf = surface_create(width-(padding*2), height-(padding*2));

/// Commands

/*
All commands should be declared here using the
console_add() script. Commands are executed in
the User Defined 0 event.
*/

//console_add("game_end",false);

/* */
/*  */
