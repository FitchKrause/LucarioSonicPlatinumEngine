/// @description  Initialize
event_inherited();

image_speed = 0;
objGame.can_pause = false;

// State machine
mode = 1;
style_mode = 0; // For different Sonic Genesis styles
state_timer = 0;

// Properties
name = "";
act = -1;
style = STYLETYPE_SONIC2;

// Display properties
fade_alpha = 0;
bg_color = make_colour_rgb(27, 72, 221);

// Styles positions
// Engine
engine_title_ox = (objScreen.gui_width - 272);
engine_act_ox = (objScreen.gui_width - 256);
effect_line_offset = 0;

// Sonic 1
sonic1_title_ox1 = (objScreen.gui_width - 192) - 40;
sonic1_title_ox2 = (objScreen.gui_width - 244) - 40;
sonic1_act_ox = (objScreen.gui_width - 212) - 30;
sonic1_act_sprite_ox = (objScreen.gui_width - 228) - 30;
sonic1_oval_ox = (objScreen.gui_width - 220) - 40;

// Sonic 2
sonic2_title_ox1 = objScreen.gui_width - 64;
sonic2_title_ox2 = objScreen.gui_width - 128;
sonic2_act_ox = objScreen.gui_width - 112;

// Offsets
// Engine
engine_title_offset = engine_title_ox;
engine_act_offset = engine_act_ox + 32 + 16;
engine_triangles_offset = objScreen.gui_width + 16;
engine_lines_offset = objScreen.gui_width + 64;
engine_borders_offset = 128;

// Sonic 1
sonic1_title_offset = sonic1_title_ox1 + 2; //(objScreen.gui_width) + 24; //704;
sonic1_title_offset2 = sonic1_title_ox2 + 60; //(objScreen.gui_width) + 24; //704;
sonic1_act_offset = (sonic1_act_sprite_ox / 2) + 26; //(objScreen.width / 2) + 120; //384;
sonic1_oval_offset = sonic1_oval_ox + 2; //(objScreen.gui_width) + 24; //704;

// Sonic 2
sonic2_title_offset = objScreen.gui_width;
sonic2_backdrop_offset = 0;
sonic2_border_offset1 = objScreen.gui_width + 16;
sonic2_border_offset2 = -sonic2_border_offset1;