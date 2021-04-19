/// @description  Render

var nearest_player = instance_nearest_notme(floor(x), floor(y), objPlayer);
if (item == MONITOR_EXTRALIFE) { if instance_exists(nearest_player) and (nearest_player.palette_sprite > -1) and surface_exists(nearest_player.palette_surface) { retro_palette_set(nearest_player.palette_surface, 1, true); } }
draw_sprite_ext(sprite_index, image_index, floor(x), floor(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (item == MONITOR_EXTRALIFE) { if instance_exists(nearest_player) and (nearest_player.palette_sprite > -1) and surface_exists(nearest_player.palette_surface) { retro_palette_clear(); } }