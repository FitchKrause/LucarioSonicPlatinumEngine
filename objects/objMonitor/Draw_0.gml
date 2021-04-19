/// @description  Draw monitor

// monitor
draw_sprite_ext(sprite_index, 0, floor(x), floor(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);

// icon
if ((objScreen.image_index mod 4) < 3)
{
    // draw player face if applicable
    if (icon > -1) and (icon < 1)
    {
        var nearest_player = instance_nearest_notme(floor(x), floor(y), objPlayer);
        var frame = 0;
        if nearest_player { frame = objData.player_character_id[nearest_player.player_id] - 1; }
        if instance_exists(nearest_player) and (nearest_player.palette_sprite > -1) and surface_exists(nearest_player.palette_surface) { retro_palette_set(nearest_player.palette_surface, 1, true); }
        draw_sprite(sprMonitorIconCharacter, frame, floor(x), floor(y) - image_yscale * 2);
        if instance_exists(nearest_player) and (nearest_player.palette_sprite > -1) and surface_exists(nearest_player.palette_surface) { retro_palette_clear(); }
    }
    else { draw_sprite(sprMonitorIcon, icon - 1, floor(x), floor(y) - image_yscale * 2); }
}
else { draw_sprite(sprMonitorStatic, (objScreen.image_index div 4), floor(x), floor(y) - image_yscale * 2); }

