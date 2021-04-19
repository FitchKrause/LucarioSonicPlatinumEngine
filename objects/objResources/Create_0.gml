/// @description  Custom resources
image_speed = 0;

// Fonts
// HUD
font_hud_lives = font_add_sprite_ext(sprFontHUDLives, "0123456789", false, 1);
font_hud_numbers = font_add_sprite_ext(sprFontHUDNumbers, "0123456789" + ":.-+=/", false, 0);
font_hud_numbers2 = font_add_sprite_ext(sprFontHUDNumbers2, "0123456789" + ":.-+=/", false, 0);
font_hud_text = font_add_sprite_ext(sprFontHUDText, "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + ":.-+=/" + "'" + "\"", true, 0);
font_hud_text2 = font_add_sprite_ext(sprFontHUDText2, "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + ":.-+=/" + "'" + "\"", true, 0);

// Titlecard
font_title_act = font_add_sprite_ext(sprFontTitleAct, "1234567890", true, 0);
font_title_act2 = font_add_sprite_ext(sprFontTitleAct2, "1234567890", true, 0);
font_title_act3 = font_add_sprite_ext(sprFontTitleAct3, "1234567890", true, 0);
font_title_text = font_add_sprite_ext(sprFontTitleText, "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "abcdefghijklmnopqrstuvwxyz" + "1234567890" + ".?!", true, 0);
font_title_text2 = font_add_sprite_ext(sprFontTitleText2, "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "abcdefghijklmnopqrstuvwxyz" + "1234567890" + ".?!", true, 0);
font_title_text3 = font_add_sprite_ext(sprFontTitleText3, "ABCDEFGHIJKLMNOPQRSTUVWXYZ", true, 0);

// Menu
font_menu = font_add_sprite_ext(sprFontMenu, "!" + "\"" + "#$%&'()*+,-./" + "0123456789" + ":;<=>?@" + "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "\\^_`" + "abcdefghijklmnopqrstuvwxyz", true, 1);
font_menu_title = font_add_sprite_ext(sprFontMenuTitle, "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "abcdefghijklmnopqrstuvwxyz" + "&", true, 1);
font_menu_crackers = font_add_sprite_ext(sprFontSonicCrackers, "!" + "\"" + "#$%&'()*+,-./" + "0123456789" + ":;<=>?@" + "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "[\\]^_`" + "abcdefghijklmnopqrstuvwxyz" + "{|}~", true, 1);
font_menu_levelselect = font_add_sprite_ext(sprFontLevelSelect, "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789" + "$-=>.:/", true, 1);

// Particles
// Water splash
part_splash = part_type_create();
part_type_sprite(part_splash, sprSplash, 1, 1, 0);
part_type_life(part_splash, 32, 32);

// Inv sparkle
part_inv_sparkle = part_type_create();
part_type_sprite(part_inv_sparkle, sprInvSparkle, 1, 1, 0);
part_type_life(part_inv_sparkle, 30, 30);

// Bubble pop
part_bubble_pop = part_type_create();
part_type_sprite(part_bubble_pop, sprBubblePop, 1, 1, 0);
part_type_life(part_bubble_pop, 10, 10);

// Ring sparkle
part_sparkle = part_type_create();
part_type_sprite(part_sparkle, sprRingSparkle, 1, 1, 0);
part_type_life(part_sparkle, 24, 24);

// Explosion
part_explosion = part_type_create();
part_type_sprite(part_explosion, sprExplosion, 1, 1, 0);
part_type_life(part_explosion, 30, 30);

// Brake dust
part_dust = part_type_create();
part_type_sprite(part_dust, sprDust, 1, 1, 0);
part_type_life(part_dust, 16, 16);

// Lightning spark
part_lspark = part_type_create();
part_type_sprite(part_lspark, sprLightningSpark, 1, 0, 0);
part_type_life(part_lspark, 21, 21);

// Big ring teleport
part_bigring = part_type_create();
part_type_sprite(part_bigring, sprRingBigAnimation, 1, 1, 0);
part_type_life(part_bigring, 24, 24);

// Balloon explode
part_balloon_explode = part_type_create();
part_type_sprite(part_balloon_explode, sprBalloonExplosion, 1, 1, 0);
part_type_life(part_balloon_explode, 10, 10);

// Sonic animation table
anim_sonic = ds_map_create();
ds_map_add(anim_sonic, "idle", player_animation_sonic_idle);
ds_map_add(anim_sonic, "walk", player_animation_sonic_walk);
ds_map_add(anim_sonic, "run", player_animation_sonic_run);
ds_map_add(anim_sonic, "sprint", player_animation_sonic_sprint);
ds_map_add(anim_sonic, "cliff", player_animation_sonic_cliff);
ds_map_add(anim_sonic, "cliff_b", player_animation_sonic_cliffb);
ds_map_add(anim_sonic, "push", player_animation_sonic_push);
ds_map_add(anim_sonic, "brake", player_animation_sonic_brake);
ds_map_add(anim_sonic, "look", player_animation_sonic_look);
ds_map_add(anim_sonic, "crouch", player_animation_sonic_crouch);
ds_map_add(anim_sonic, "spin", player_animation_sonic_spin);
ds_map_add(anim_sonic, "spindash", player_animation_sonic_spindash);
ds_map_add(anim_sonic, "dropdash", player_animation_sonic_dropdash);
ds_map_add(anim_sonic, "rise", player_animation_sonic_rise);
ds_map_add(anim_sonic, "flip", player_animation_sonic_flip);
ds_map_add(anim_sonic, "corkscrew", player_animation_sonic_corkscrew);
ds_map_add(anim_sonic, "get_air", player_animation_sonic_getair);
ds_map_add(anim_sonic, "hurt", player_animation_sonic_hurt);
ds_map_add(anim_sonic, "dead", player_animation_sonic_dead);
ds_map_add(anim_sonic, "drown", player_animation_sonic_drown);
ds_map_add(anim_sonic, "peelout", player_animation_sonic_peelout);
ds_map_add(anim_sonic, "fall", player_animation_sonic_fall);
ds_map_add(anim_sonic, "float", player_animation_sonic_float);
ds_map_add(anim_sonic, "outta_here", player_animation_sonic_outtahere);
ds_map_add(anim_sonic, "transform", player_animation_sonic_transform);

// Sonic animation table
anim_supersonic = ds_map_create();
ds_map_add(anim_supersonic, "idle", player_animation_supersonic_idle);
ds_map_add(anim_supersonic, "walk", player_animation_supersonic_walk);
ds_map_add(anim_supersonic, "run", player_animation_sonic_run);
ds_map_add(anim_supersonic, "sprint", player_animation_sonic_sprint);
ds_map_add(anim_supersonic, "cliff", player_animation_sonic_cliff);
ds_map_add(anim_supersonic, "cliff_b", player_animation_sonic_cliffb);
ds_map_add(anim_supersonic, "push", player_animation_sonic_push);
ds_map_add(anim_supersonic, "brake", player_animation_sonic_brake);
ds_map_add(anim_supersonic, "look", player_animation_sonic_look);
ds_map_add(anim_supersonic, "crouch", player_animation_supersonic_crouch);
ds_map_add(anim_supersonic, "spin", player_animation_sonic_spin);
ds_map_add(anim_supersonic, "spindash", player_animation_sonic_spindash);
ds_map_add(anim_supersonic, "dropdash", player_animation_sonic_dropdash);
ds_map_add(anim_supersonic, "rise", player_animation_sonic_rise);
ds_map_add(anim_supersonic, "flip", player_animation_sonic_flip);
ds_map_add(anim_supersonic, "corkscrew", player_animation_sonic_corkscrew);
ds_map_add(anim_supersonic, "get_air", player_animation_sonic_getair);
ds_map_add(anim_supersonic, "hurt", player_animation_sonic_hurt);
ds_map_add(anim_supersonic, "dead", player_animation_sonic_dead);
ds_map_add(anim_supersonic, "drown", player_animation_sonic_drown);
ds_map_add(anim_supersonic, "peelout", player_animation_sonic_peelout);
ds_map_add(anim_supersonic, "fall", player_animation_sonic_fall);
ds_map_add(anim_supersonic, "float", player_animation_sonic_float);
ds_map_add(anim_supersonic, "transform", player_animation_sonic_transform);

// Tails animation table
anim_tails = ds_map_create();
ds_map_add(anim_tails, "idle", player_animation_tails_idle);
ds_map_add(anim_tails, "walk", player_animation_tails_walk);
ds_map_add(anim_tails, "run", player_animation_tails_run);
ds_map_add(anim_tails, "sprint", player_animation_tails_sprint);
ds_map_add(anim_tails, "cliff", player_animation_tails_cliff);
ds_map_add(anim_tails, "push", player_animation_tails_push);
ds_map_add(anim_tails, "brake", player_animation_tails_brake);
ds_map_add(anim_tails, "look", player_animation_tails_look);
ds_map_add(anim_tails, "crouch", player_animation_tails_crouch);
ds_map_add(anim_tails, "spin", player_animation_tails_spin);
ds_map_add(anim_tails, "spindash", player_animation_tails_spindash);
ds_map_add(anim_tails, "rise", player_animation_tails_rise);
ds_map_add(anim_tails, "flip", player_animation_tails_flip);
ds_map_add(anim_tails, "corkscrew", player_animation_tails_corkscrew);
ds_map_add(anim_tails, "get_air", player_animation_tails_getair);
ds_map_add(anim_tails, "hurt", player_animation_tails_hurt);
ds_map_add(anim_tails, "drown", player_animation_tails_drown);
ds_map_add(anim_tails, "dead", player_animation_tails_dead);
ds_map_add(anim_tails, "flight", player_animation_tails_flight);
ds_map_add(anim_tails, "flight_end", player_animation_tails_flightend);
ds_map_add(anim_tails, "swim", player_animation_tails_swim);
ds_map_add(anim_tails, "swim_end", player_animation_tails_swimend);
ds_map_add(anim_tails, "fall", player_animation_tails_fall);
ds_map_add(anim_tails, "float", player_animation_sonic_float);
ds_map_add(anim_tails, "peelout", player_animation_tails_peelout);

// Knuckles animation table
anim_knuckles = ds_map_create();
ds_map_add(anim_knuckles, "idle", player_animation_knuckles_idle);
ds_map_add(anim_knuckles, "walk", player_animation_knuckles_walk);
ds_map_add(anim_knuckles, "run", player_animation_knuckles_run);
ds_map_add(anim_knuckles, "cliff", player_animation_knuckles_cliff);
ds_map_add(anim_knuckles, "cliff_b", player_animation_knuckles_cliffb);
ds_map_add(anim_knuckles, "push", player_animation_knuckles_push);
ds_map_add(anim_knuckles, "brake", player_animation_knuckles_brake);
ds_map_add(anim_knuckles, "look", player_animation_knuckles_look);
ds_map_add(anim_knuckles, "crouch", player_animation_knuckles_crouch);
ds_map_add(anim_knuckles, "spin", player_animation_knuckles_spin);
ds_map_add(anim_knuckles, "spindash", player_animation_knuckles_spindash);
ds_map_add(anim_knuckles, "rise", player_animation_knuckles_rise);
ds_map_add(anim_knuckles, "flip", player_animation_knuckles_flip);
ds_map_add(anim_knuckles, "corkscrew", player_animation_knuckles_corkscrew);
ds_map_add(anim_knuckles, "get_air", player_animation_knuckles_getair);
ds_map_add(anim_knuckles, "hurt", player_animation_knuckles_hurt);
ds_map_add(anim_knuckles, "dead", player_animation_knuckles_dead);
ds_map_add(anim_knuckles, "drown", player_animation_knuckles_drown);
ds_map_add(anim_knuckles, "glide", player_animation_knuckles_glide);
ds_map_add(anim_knuckles, "glide_end", player_animation_knuckles_glideend);
ds_map_add(anim_knuckles, "glide_slide", player_animation_knuckles_glideslide);
ds_map_add(anim_knuckles, "glide_stand_1", player_animation_knuckles_glidestand1);
ds_map_add(anim_knuckles, "glide_stand_2", player_animation_knuckles_glidestand2);
ds_map_add(anim_knuckles, "climb", player_animation_knuckles_climb);
ds_map_add(anim_knuckles, "climb_end", player_animation_knuckles_climbend);
ds_map_add(anim_knuckles, "fall", player_animation_knuckles_fall);
ds_map_add(anim_knuckles, "float", player_animation_sonic_float);
ds_map_add(anim_knuckles, "peelout", player_animation_knuckles_peelout);

