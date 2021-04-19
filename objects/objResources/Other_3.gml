/// @description  Clean up

// Font
// HUD
font_delete(font_hud_lives);
font_delete(font_hud_numbers);
font_delete(font_hud_numbers2);
font_delete(font_hud_text);
font_delete(font_hud_text2);

// Titlecard
font_delete(font_title_act);
font_delete(font_title_act2);
font_delete(font_title_act3);
font_delete(font_title_text);
font_delete(font_title_text2);
font_delete(font_title_text3);

// Menu
font_delete(font_menu);
font_delete(font_menu_title);
font_delete(font_menu_crackers);
font_delete(font_menu_levelselect);

// Particles
part_type_destroy(part_splash);
part_type_destroy(part_inv_sparkle);
part_type_destroy(part_bubble_pop);
part_type_destroy(part_sparkle);
part_type_destroy(part_explosion);
part_type_destroy(part_dust);
part_type_destroy(part_lspark);
part_type_destroy(part_bigring);
part_type_destroy(part_balloon_explode);

// Animation
ds_map_destroy(anim_sonic);
ds_map_destroy(anim_supersonic);
ds_map_destroy(anim_tails);
ds_map_destroy(anim_knuckles);

